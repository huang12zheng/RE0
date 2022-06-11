RelativeRect
RelativeRectTween


BackBtn->FadeInDown


其他还有利用 isRelayoutBoundary 、 isRepaintBoundary 等参数，来实现局部的更新判断，比如：当执行 markNeedsPaint() 触发绘制时，会通过 isRepaintBoundary 是否为 true ， 往上确定了更新区域，通过 requestVisualUpdate 方法触发更新往下绘制。

final bool isRelayoutBoundary = !parentUsesSize || sizedByParent || constraints.isTight || parent is! RenderObject;


don't set colors, use schema


ThemeProvider provider ThemeModel which is 聚合 of both  [vsync] and [themeData].
so we can easy create a ThemeModel. and then send it to Provider.
ThemeSwitcher, it look like controller by use api [changeTheme], which turn into [ThemeModelInheritedNotifier.changeTheme]
model.changeTheme is use [clipper], and [UI.Image]

YoueThemeModel->ThemeData->ThemeProvider.initTheme
use Widget ThemeSwitchingArea wrap ThemeSwitcher.
ThemeSwitchingArea is AnimationWidget. ThemeSwitcher is Buttion

* ThemeSwitcher change themedata, and notify all children. 
But it also need use [value of themedata](that is being use by ThemeSwitcher),to set YourThemeController.

@override
  String get restorationId => 'tab_non_scrollable_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    _tabController.index = tabIndex.value;
  }
