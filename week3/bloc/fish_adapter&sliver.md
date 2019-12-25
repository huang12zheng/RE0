```dart
ListAdapter combineListAdapters(Iterable<ListAdapter> adapters) {
  final List<ListAdapter> list = adapters
      .where((ListAdapter e) => e != null && e.itemCount > 0)
      .toList(growable: false);

  if (list.every((ListAdapter e) => e.itemCount == 1)) {
    /// The result is AbstractComponent
    return ListAdapter(
      (BuildContext buildContext, final int index) =>
          list[index].itemBuilder(buildContext, 0), /// sliver
      list.length,
    );
  } else if (list.length == 1) {
    return list.single;
  }

  final int maxItemCount = list.fold(0, (int count, ListAdapter adapter) {
    return count + adapter.itemCount;  /// for scroll
  });

  /// The result is AbstractAdapter
  return ListAdapter(
    (BuildContext buildContext, final int index) {
      assert(index >= 0 && index < maxItemCount);
      int yIndex = index;
      int xIndex = 0;
      while (xIndex < list.length && list[xIndex].itemCount <= yIndex) {
        yIndex -= list[xIndex].itemCount;
        xIndex++;
      }
      assert(xIndex < list.length);
      return list[xIndex].itemBuilder(buildContext, yIndex);
    },
    maxItemCount,
  );
}
```

