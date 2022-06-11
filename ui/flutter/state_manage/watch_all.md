```dart
DataState<List<T>?> watchAll({
    bool? remote,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    bool? syncLocal,
    String? finder,
    DataRequestLabel? label,
  }) {
    final provider = watchAllProvider(
      remote: remote,
      params: params,
      headers: headers,
      syncLocal: syncLocal,
      finder: finder,
      label: label,
    );
    return remoteAdapter.internalWatch!(provider);
  }
```
> remoteAdapter.internalWatch!(provider)
> internalWatch if ref.watch
```dart
AutoDisposeStateNotifierProvider<DataStateNotifier<List<T>?>,
      DataState<List<T>?>> watchAllProvider({
    bool? remote,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    bool? syncLocal,
    String? finder,
    DataRequestLabel? label,
  }) {
    remote ??= remoteAdapter._remote;
    return _watchAllProvider(
      WatchArgs(
        remote: remote,
        params: params,
        headers: headers,
        syncLocal: syncLocal,
        finder: finder,
        label: label,
      ),
    );
  }
```
> _watchAllProvider(WatchArgs)
```dart
late final _watchAllProvider = StateNotifierProvider.autoDispose
      .family<DataStateNotifier<List<T>?>, DataState<List<T>?>, WatchArgs<T>>(
          (ref, args) {
    return remoteAdapter.watchAllNotifier(
      remote: args.remote,
      params: args.params,
      headers: args.headers,
      syncLocal: args.syncLocal,
      finder: args.finder,
      label: args.label,
    );
  });
```
> return DataStateNotifier<List<T>?>
* _RemoteAdapterWatch
```dart
```
> _getUpdatedModels localAdapter.findAll
> await _finder
> final models = _getUpdatedModels
> _states.add(DataState(models


graphNotifierThrottleDurationProvider