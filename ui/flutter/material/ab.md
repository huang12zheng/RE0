## Appbar

backgrouldColor: Brightness.dark ? colorScheme.surface : colorScheme.primary,

0. appbar的 props?
leading,automaticallyImplyLeading,title,actions,flexibleSpace,bottom,elevation,shadowColor,shape,backgroundColor,foregroundColor,

1. IconButton 可点击的逻辑是?
final BoxConstraints unadjustedConstraints = constraints ?? const BoxConstraints(
      minWidth: _kMinButtonSize,
      minHeight: _kMinButtonSize,
    );
_kMinButtonSize=48.0
1.1. IconButton 大小是 [24+padding(8*2)] 外套一个constraints: adjustedConstraints
1.2. adjustedConstraints 是什么? 
effectiveVisualDensity.effectiveConstraints(unadjustedConstraints);
minWidth: (constraints.minWidth + baseSizeAdjustment.dx).clamp(0.0, constraints.maxWidth),
      minHeight: (constraints.minHeight + baseSizeAdjustment.dy).clamp(0.0, constraints.maxHeight),


2. Appbar的layout是什么?
Stack->[flexibleSpace,Material->Align.topCenter->SafeArea->
Column->[BoxConstraints(maxHeight: toolbarHeight),
bottom
]
]]

> StackFit.passthrough 横向尽量大, 纵向尽量小

> UI设计师是否熟悉material?
> 哪里用到了 kTabLabelPadding?
