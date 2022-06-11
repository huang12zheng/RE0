LayoutBuilder->ConstrainedLayoutBuilder<BoxConstraints>
> _RenderLayoutBuilder->RenderBox with RenderObjectWithChildMixin<RenderBox>, RenderConstrainedLayoutBuilder<BoxConstraints, RenderBox>

```dart
void performLayout() {
    final BoxConstraints constraints = this.constraints;
    rebuildIfNecessary();
    if (child != null) {
      child!.layout(constraints, parentUsesSize: true);
      size = constraints.constrain(child!.size);
    } else {
      size = constraints.biggest;
    }
  }
```

Spacer 是什么? Expanded(:Container())
`performResize`called only if [sizedByParent] is true.