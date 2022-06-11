* Where do you see flexibility?
> 你觉得灵活性在哪里?
In Adapter, we can access graph, rest, local data.
Graph storage relationship
* Adapter 在哪里? 分别有什么?一般是如何访问它们的?
lib/src/repository/ 下:
hive_local_storage.dart
remote_adapter_serialization.dart
local_adapter.dart
remote_adapter_watch.dart
hive_local_adapter.dart
remote_adapter.dart

> 通过repository里的_adapters保存他们
* 这里的_adapters什么时候初始化?
Repository.initialize入参里有,且函数体里有`_adapters.addAll(adapters)`,并且还将它们初始化了
```dart
await remoteAdapter.initialize(
      remote: remote,
      adapters: adapters,
      read: _read,
    );
```
> 这里发现, Repository的API,本质上是访问里面组合进的remoteAdapter
> 比如`Repository.findAll`函数体里是`remoteAdapter.findAll`

* 上面的封装有没有什么不是这个思路的?
> `Repository.watchOne`函数体里是
> ```dart
> provider = watchOneProvider(
> return remoteAdapter.internalWatch!(provider);
> ```
>> 发现这里有一人alsoWatch参数,`ref.books.watchOne(1, alsoWatch: (book) => [book.author]);`

> `watchAllProvider`里有一个`StateNotifierProvider.family((_,__))`
> 参数里有String finder,会去`_RemoteAdapterWatch.watchAllNotifier`里的`_internalHolder`里找  或默认 `findAll`
> `final _maybeFinder = _internalHolder?.finders[finder]?.call(this);`
> 然后`final model = await _finder...`
> 不过这里的返回值`_notifier`有点太复杂了
> 大概可能是
> 1. isLoading=remote,且返回localAdapter.findAll()
> 2. _notifier的属性_reloadFn,这我们去类DataStateNotifier里发现
> `reload()=>_reloadFn?.call();`
>> 注意_reloadFn还做了graph._notify,触发了DataGraphEvent.
>> 而我们会去`start listening to graph for further changes`
>> `_graph.addListener((events) {`
>> `for (final event in events) {`
>>>
>>> 查看文档[findAll Example Explain](https://flutterdata.dev/docs/repositories/#:~:text=syncLocal%3A%20true)%3B-,Example%3A,-If%20a%20first)
>>> If a first call to findAll returns data for task IDs 1, 2, 3 and a second call updated data for 2, 3, 4 you will end up in your local storage with: 1, 2 (updated), 3 (updated) and 4.
>>>Passing syncLocal: true to the second call will leave the local storage state with 2, 3 and 4.


> 甚至有用到_alsoWatchPairs
> 但重点可能是在,我们应该去观察`_states.add`,有三处
> ```dart
> // doneLoading // 第一次载入
> _states.add(DataState(_model, isLoading: false, exception: null)); 
>
> // addNode updateNode // 关联节点的改变时
> if (event.type == DataGraphEventType.addNode ||
>           event.type == DataGraphEventType.updateNode) {
>
> // handle deletion
> if (event.type == DataGraphEventType.removeNode && _model == null) {
> ```
> 也就是说,只要和这个模型有关的模型改变(发出了GraphEvent),都会触发StateNotifier 状态改变.而我们是监听这个的
>
> 然后这些states会`_mergedState=states.fold`,然后,`notifier.updateWith(.._mergedState..)`

> 到这里,我们介绍了Repository,mixin _RemoteAdapterWatch
> 现在补充一人codegen会用到的类
> ```dart
> class DataRepository {
> final List<Type> adapters;
> final bool remote;
> const DataRepository(this.adapters, {this.remote = true});
}
> ```
* 众所周知,flutter_data是一个本地优先的库,那么如何用`localAdapter`,给个例子
```dart
T saveLocal() {
    remoteAdapter.localAdapter.save(_key, _this);
    return _this;
  }
```
* RemoteAdapter长值样子,有什么注意的?
1. 
2. 有什么注意的

* LoalAdapter长值样子,有什么你一开始没想到的?
没想到的:
1. LocalAdapter有参数graph,`final GraphNotifier graph;`
   或者说,graph尽然在这里.

LoalAdapter长值样子:
2. transformSerialize, 跟据relationshipMetas,来
3. `LoalAdapter`的CURD通过`HiveLocalAdapter`和_hiveLocalStorage
_hiveAdapterNs = '_adapter_hive'; 被用在 graph._addEdge等来edage有关的
final edge = _typesNode[_internalType.namespaceWith(_hiveAdapterNs)];

Hive的typeId,通过查看graph里已经记录的final index来得到
```dart
final index = _typesNode.values
          // denamespace and parse single
          .map((e) => int.parse(e.first.denamespace()))
          // find max
          .fold(0, math.max) +
      1;
```
Hive box ('_graph')里的数据放的如下:
```dart
// _adapter_hive:key: {
//   '_adapter_hive:posts': ['_adapter_hive:1'],
//   '_adapter_hive:comments': ['_adapter_hive:2'],
//   '_adapter_hive:houses': ['_adapter_hive:3'],
// }

// _boxMetadata: {
//   '_boxMetadata:touched': ['_'],
// }
```
> `_adapter_hive:key`是被用在上面说的typeId,
> `_boxMetadata`是被仅仅用在,check the box has received data,或者说findAll是否返回null

有了typeId,你可能会好奇,被用在哪里?无疑是`HiveLocalAdapter.initialize`.
但我们现在可能更应该关注里面用到的:`_hiveLocalStorage`,是它让我们和Hive的交互
1. 构造函数里,入参了 HiveInterface,baseDirFn
通过hiveLocalStorageProvider和hiveProvider,知道这里的HiveInterface就是Hive,或HiveImpl()
2. HiveLocalStorage.initialize里做了两件事
path = path_helper.join(await baseDirFn!(), 'flutter_data');
hive.init(path);

离开那些和初始化有关的,来到CURD的操作:
1. findAll,findOne 没什么要说的,
2. save里:
   _touchLocalStorage // 开始有记录的标志
   依据notify标示,跑 graph._notify,来通知依赖.
3. delete里:
   `graph.removeKey`,进入到GraphNotifier._removeNode,
   for (final toKey in _connectedKeys(key)) {  // 通过metadatas在_connectedKeys,找到所有直接关联的边对应的点,
   再通过这些点,又通过graph.removeNode
> 让我想到了广度优先搜索^_^
> 同时猜想, 我们不会直接和graph打交道

有了这些知识,你可能可以实现不是Hive的,你想依赖的`LocalAdapter`.

* 说完LocalAdapter, 回来RemoteAdapter,但不会都过一遍
1. findAll
   1.1. !shouldLoadRemoteAll
        直接返回本地的models
   1.2. background
        先返回本地的models,然后异步调用sendRequest
        > sendRequest.onSuccess里,依据syncLocal会去清localAdapter
        ```dart
        if (syncLocal!) {
          await localAdapter.clear();
        }
        ```
        > _RemoteAdapter.onSuccess 会将map转换成model,然后model.saveLocal

2. sendRequest
   一般是自定义请求时用的,
   里面有一段,如果不是`GET`请求,且`network error and we're offline`
   调用OfflineOperation.add(), 这里面会通过graph来`_addEdge`,或`_notify`.

* 关系
  似乎我们只要DataModel里定义好Belongs,HasMany,剩下的就和graph一定,
  不用我们关心

* 有用的教程
  https://flutterdata.dev/tutorial/updating/
  

* Belongs,HasMany 和 Set有关. 
* 如何得到一个模型的所有数据?
```dart
  hasmany_model.toList()
  List<E> toList() => _iterable.toList();
  Iterable<E> get _iterable {
    return _keys.map((key) => _adapter.localAdapter.findOne(key)).filterNulls;
  }
```
> 注意这里的_keys
```dart
  Set<String> get _keys {
    if (!isInitialized) return {};
    return _graph._getEdge(_ownerKey!, metadata: _name!).toSet();
  }
```