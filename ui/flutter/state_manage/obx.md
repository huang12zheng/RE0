> [Flutter状态管理--Getx学习1--Obx](https://juejin.cn/post/6943779627819073567#heading-6)
> [Flutter GetX looks 因吹斯听](https://juejin.cn/post/7040992086878847006)
* obs
```dart
obs => _RxImpl<T> extends GetListenable<T> with RxObjectMixin<T>

GetListenable<T>.subject => _controller = StreamController<T>.broadcast..add(T)
    refresh()/// 在下面介绍
```
* Obx

你将无法在Obx内部初始化一个控制器，它只是一个带有StreamSubscription的Widget，接收来自你的子代的变化事件
> 而在 RxInterface.notifyChildren 方法中将 _observer 传递进去。其实我们可以看到这个方法只做了一件事情，在 builder 回调执行
> **之前**，设置 RxInterface.proxy 为当前 _ObxState 中的 _observer。

> View call `get value` would call `addListener(subject)`.


Obx extends ObxWidget extends ObxStatelessWidget => ObxElement= StatelessElement with ObserverComponent
> with StatelessElement, we can use `markNeedsBuild`
mixin ObserverComponent on ComponentElement
    getUpdate=>_safeRebuild=>`markNeedsBuild`
    build=>append

    ```dart
    NotifyData(disposers: disposers!, updater: getUpdate)

    T append<T>(NotifyData data, T Function() builder) {
        _notifyData = data;
        final result = builder();
        if (data.disposers.isEmpty && data.throwException) {
        throw ObxError();
        }
        _notifyData = data;
        return result;
    }
    ```

```dart
ListNotifierSingleMixin on Listenabl
* refresh
refresh() => _notifyUpdate();
    for (var element in _updaters!) {
      element();
    }
    addListener(listener) => _updaters!.add(listener); return () => _updaters!.remove(listener);

ListNotifierGroupMixin on Listenable
* refreshGroup
refreshGroup(id) => _notifyGroupUpdate(id)
    if (_updatersGroupIds!.containsKey(id)) {
      _updatersGroupIds![id]!._notifyUpdate();
    }
ChangeNotifier.notifyListeners
```

* H2
```dart
ValueBuilder<bool>(
  initialValue: false,
  builder: (value, update) => Switch(
  value: value,
  onChanged: (flag) {
     update( flag );
  },),
  onUpdate: (value) => print("Value updated: $value"),
),
```
* ~~RxNotifier{_notifyData,}~~
* Notifier
```dart
NotifyData? _notifyData;
add(VoidCallback listener)=>_notifyData?.disposers.add(listener);

```
* read
  * Notifier.instance.read(this);
    * ListNotifierSingleMixin
  * Notifier.instance.read(_updatersGroupIds![id]!);
    * ListNotifierGroupMixin

---
```dart
mixin RxObjectMixin<T> on GetListenable<T>{
    set value(T val) {
        if (isDisposed) return;
        sentToStream = false;
        if (value == val && !firstRebuild) return;
        firstRebuild = false;
        sentToStream = true;
        super.value = val;
    }
    // super.value
    set value(T newValue) {
        if (_value == newValue) return;
        _value = newValue;
        _notify();
    }
    // _notify in `GetListenable<T>`
    void _notify() {
    refresh();
    // refresh  in `ListNotifierSingleMixin`
    @protected
    void refresh() {
        assert(_debugAssertNotDisposed());
        _notifyUpdate();
    }
    // _notifyUpdate
    void _notifyUpdate() {
        for (var element in _updaters!) {
            element();
        }
    }
    /// _updaters addListener(`ListNotifier`)
    * 
  }
}
```



------
T = _RxImpl<T>
`set value` or something like(happend in List Map Set) would call refresh()
refresh would call Stream.add `subject.add`
```dart
  @override
  T get value {
    reportRead();
    return _value;
  }
  // reportRead
  Notifier.instance.read(this);

  // read
  _updaters.addListener(listener);
  add(() => _updaters.removeListener(listener));
```