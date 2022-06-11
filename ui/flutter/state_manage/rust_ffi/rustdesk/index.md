# main file
mobile_ffi.rs lib/models/native_model.dart
# workflow
main()=>{FFI.ffiModel.init(),refreshCurrentUser(),toAndroidChannelInit()}
* PlatformFFI.init
  * dylib
  * _getByName = dylib.lookupFunction<F2, F2>('get_by_name')
  * **static** getByName
  * _setByName
  * **static** void  setByName
  * _homeDir
  * id
  * name
> 初始化前`_setByName`为null, 初始扣, setByName里的_setByName不为null
> setByName将dart_value转为ponit_value,传给ffi函数,再calloc.free
> _setByName的具体实现在**链接库**里,可以查看自动生成的`generated_bridge.dart`里的内容,
> 再去rust里找到对应的函数实现
> enum stream 生成的接口有点魔法
* _eventCallback
```dart
await for (final message in rustdeskImpl.startEventStream()) {
    if (_eventCallback != null) {
```
* _rgbaCallback
```dart
await for (final message in rustdeskImpl.startRgbaStream()) {
    if (_rgbaCallback != null) {
```
* more about rustdeskImpl.startEventStream
Stream<String> startEventStream({dynamic hint}) =>
      executeStream(FlutterRustBridgeTask
    * FlutterRustBridgeTask

* callFfi
      callFfi : (port) => inner.wire_start_event_stream
      > _wire_start_event_streamPtr is 
        ```dart
        _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>('wire_start_event_stream')
        ```
        > wire_xxx的参数是port+rust里的参数, 这里的参数会是一个freeze(Efs) 转为 Pointer<wire_Efs>
        > > _lookup('new_box_autoadd_efs')
```dart
void _api_fill_to_wire_efs(Efs apiObj, wire_Efs wireObj) {
    if (apiObj is ReadDir) {
      wireObj.tag = 0;
      wireObj.kind = inner.inflate_Efs_ReadDir();
      wireObj.kind.ref.ReadDir.ref.dir = _api2wire_u8(apiObj.dir);
      wireObj.kind.ref.ReadDir.ref.len = _api2wire_u8(apiObj.len);
    }
    if (apiObj is Open) {
      wireObj.tag = 1;
      wireObj.kind = inner.inflate_Efs_Open();
      wireObj.kind.ref.Open.ref.len = _api2wire_u8(apiObj.len);
    }
    if (apiObj is Read) {
      wireObj.tag = 2;
      return;
    }
  }

  ffi.Pointer<EfsKind> inflate_Efs_ReadDir() {
    return _inflate_Efs_ReadDir();
  }
  _inflate_Efs_ReadDirPtr.asFunction<ffi.Pointer<EfsKind> Function()>()
  _lookup('inflate_Efs_ReadDir').asFunction()()

  // Extension on [Pointer] specialized for the type argument [NativeFunction].

  /// Convert to Dart function, automatically marshalling the arguments
  /// and return value.
```
* parseSuccessData
* constMeta
* argValues 
* hint
# 说明
xxxPtr是_lookup  ,即`返回的指针`
> ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName) `_lookup`
> 即入参 dynamicLibrary的 dynamicLibrary.lookup
RustdeskWire是Ptr.asFunction

# FlutterRustBridgeTask
* 上级
    + executeStream
    + executeNormal
```dart
    The underlying function to call FFI function, usually the generated wire function
    final void Function(int port) callFfi;

    /// Parse the returned data from the underlying function
    final S Function(dynamic) parseSuccessData;

    /// Metadata that does not change across different method calls.
    final FlutterRustBridgeTaskConstMeta constMeta;

    /// Arguments to be passed into the function call.
    final List<dynamic> argValues;

    /// Transparent hint given by the caller of the method
    final dynamic hint;
```
# FlutterRustBridgeBase内部实现
* 构造时
  + _sanityCheckSingleton
    全局应该只有一个bridge被初始化,所以已经有的话,报错
  + _setUpRustToDartComm
    inner.store_dart_post_cobject(NativeApi.postCObject.cast());
    ```dart
    /// A function pointer to
    /// `bool Dart_PostCObject(Dart_Port port_id, Dart_CObject* message)`
    /// in `dart_native_api.h`.
    ```
* 别的
* executeNormal
  ```dart
    final completer = COmpleter<dynamic>();
    final sendPort = singleCompletePort(completer); //<<<<<<
    task.callFfi(sendPort.nativePort);
    return completer.future.then((dynamic data) =>
        _transformRust2DartMessage(raw, task.parseSuccessData));
    });

  ```
  > 这里的task.callFfi 可以看为是绑定 那么为收到消息而开的端口
* executeSync

* _transformRust2DartMessage
final action = raw[0];

switch (action)
  _RUST2DART_ACTION_SUCCESS  raw.length == 2  
  _RUST2DART_ACTION_ERROR
  _RUST2DART_ACTION_CLOSE_STREAM

* singleCompletePort
`sendPort` is from `responsePort.sendPort` , so please check `RawReceivePort`
```dart
///创建一个SendPort，它只接收一个消息。
///
///当收到第一个消息时，[callback]函数是
///以消息作为参数调用
///和[completer]完成调用的结果。
///所有进一步的消息被忽略。
///
///如果' callback '被省略，它默认为一个标识函数。
/// callback调用可以返回一个future, completer会返回
///等待未来完成。如果省略[callback]，则
///消息的端口必须是[R]的实例。
///
///如果提供了[timeout]，它被用作如何使用的限制
///接收到消息之前的时间。如果一个
///消息没有及时收到，调用了[onTimeout]，
///和' completer '完成调用的结果
/ / /。
/// [callback]函数不会被超时中断，
///只要初始消息及时收到。
///如果' onTimeout '被省略，它默认用补全'补全器'
/ / / [TimeoutException]。
///
/// [completer]可能是一个同步completer。只有
///完成响应另一个事件，无论是端口消息或计时器。
///
///返回期望单个消息的' SendPort '。
```

* RawReceivePort
```dart
  /// Opens a long-lived port for receiving messages.
  ///
  /// A [RawReceivePort] is low level and does not work with [Zone]s. It
  /// cannot be paused. The data-handler must be set before the first
  /// message is received, otherwise the message is lost.
  ///
  /// If [handler] is provided, it's set as the [RawReceivePort.handler].
  ///
  /// The optional `debugName` parameter can be set to associate a name with
  /// this port that can be displayed in tooling.
  ///为接收消息打开一个长期存在的端口。
///
/// A [RawReceivePort]是低级别的，与[Zone]s不工作。它
///不能暂停。数据处理程序必须在第一个之前设置
///消息被接收，否则消息丢失。
///
///如果提供了[handler]，它被设置为[RawReceivePort.handler]。
///
///可选的' debugName '参数可以设置为将名称与
///可以在工具中显示的端口。
```

* wire__xxx
```dart
extends ffi.Struct
tag
ffi.Pointer<EfsKind> kind
```
struct + ffi.Pointer<T>
_api_fill_to_wire_box_autoadd_efs 是对dart T到 ffi.Struct的转换
有点像T to c_struct_(tag+TKind)
```dart
/// inflate_Efs_ReadDir return Pointer<EfsKind>
wireObj.kind = inner.inflate_Efs_ReadDir();
///                                             dartObj.prop
wireObj.kind.ref.ReadDir.ref.dir = _api2wire_u8(apiObj.dir);
```