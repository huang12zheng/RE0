## MaterialBanner
1. props:elevation,leading,backgroundColor,padding,leadingPadding,forceActionsBelow,overflowAlignment,animation,onVisibl
2. layout
Container->[OverflowBar,padding8,constraints52,alignment]
3. animator
```dart
materialBannerTransition = AnimatedBuilder(
    animation: heightAnimation,
    builder: (BuildContext context, Widget? child) {
        return Align(
        alignment: AlignmentDirectional.bottomStart,
        heightFactor: heightAnimation.value,
        child: child,
        );
    },
    child: materialBanner,
    );
```