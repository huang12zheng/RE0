# component
## BottomAppBar
* some info catalogue
design: https://material.io/components/app-bars-bottom/flutter#bottom-app-bar-example
source: https://github.com/flutter/flutter/blob/stable/packages/flutter/lib/src/material/bottom_app_bar.dart#:~:text=Widget%20build(BuildContext%20context)%20%7B
* source detail
```dart
    //! z-coordinate
    final double elevation = widget.elevation ?? babTheme.elevation ?? _defaultElevation;
    final Color color = widget.color ?? babTheme.color ?? Theme.of(context).bottomAppBarColor;
    final Color effectiveColor = ElevationOverlay.applyOverlay(context, color, elevation);
    return PhysicalShape(
      clipper: clipper,
      elevation: elevation,
      //! 阴影颜色
    //!处理叠加颜色的实用程序类
    //!在黑暗的主题中表示表面的高度。 ??什么意思? [color->shadowColor] 是两层的.
      color: effectiveColor,
    ///决定使用哪个[剪辑]。
    ///
    ///如果路径是一个[ShapeBorder]子类，
    ///考虑使用[ShapeBorderClipper]委托类来适应
    ///形状与此小部件使用。
      clipBehavior: widget.clipBehavior,
      child: Material(
        key: materialKey,
        type: MaterialType.transparency,
        child: widget.child == null
          ? null
          ///child is Row
          : SafeArea(child: widget.child!),
      ),
    );
```
> [NotchedShape](https://www.jianshu.com/p/dfff5df6ddde)
> question: what default [babTheme.shape] 
>> final NotchedShape? notchedShape = widget.shape ?? babTheme.shape;

+ RoundedRectangleBorder
```dart
const RoundedRectangleBorder({
    BorderSide side = BorderSide.none,
    this.borderRadius = BorderRadius.zero,
  })
```
+ Material
> question: shape不空,决定了形状.那么如果它是空,但是有borderRadius,会是什么样子?(圆角矩形)
> question: MaterialType默认是?(canvas,矩形)
> question: borderOnForeground是什么? 边在图形前面
> question: material的prop?  type,elevation,color,shadowColor,textStyle,borderRadius,shape,borderOnForeground,clipBehavior,animationDuration,child,
> question: material的contents0? widget.child
> question: material的contents1? AnimatedDefaultTextStyle(style,duration,contents0)
> question: material的contents2? NotificationListener
> question: material的contents3? _InkFeatures
> question: material的child1? AnimatedPhysicalModel
> question: material的child1,AnimatedPhysicalModel的 animateColor 是? false
> question: material的Animated? 修改widget.textStyle
```dart
style: isSelected
? TextStyle(
    fontSize: 50, color: Colors.red, fontWeight: FontWeight.bold)
: TextStyle(
    fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w100),
child: Text("Hello, Flutter"),
```
> 
> 
> ///一块材料。
> ///
> ///物料件负责:
> ///
> / / / 1。剪辑:如果[clipBehavior]不是[剪辑。，材质剪辑它的小部件
> ///由[shape]， [type]和[borderRadius]指定的形状的子树。
> ///默认情况下，[clipBehavior]是[Clip. behavior]。为性能考虑。
> ///参见[Ink]以了解它如何影响剪切[Ink]小部件的示例。
> / / / 2。高度:材质在Z轴上提升它的小部件子树
> ///[高度]像素，并绘制适当的阴影。
> / / / 3。墨水效果:材质显示由[InkFeature]实现的墨水效果
> ///像[InkSplash]和[InkHighlight]下面的孩子。
> ///
> /// ##材料的隐喻
> ///
> ///材料是材料设计的中心隐喻。每一块材料
> ///存在于一个给定的高度，这影响了如何一块材料
> ///在视觉上与其他材料以及材料如何铸造相关
> / / /阴影。
> ///
> ///大多数用户界面元素要么是概念上打印在一块
> ///材料或他们自己由材料制成。材料对用户输入的使用产生反应
> /// [InkSplash]和[InkHighlight]效果。在…上引起反应
> /// material，使用通过[material .of]获得的[MaterialInkController]。
> ///
> ///一般情况下，[材料]的特性不应随时间而改变
> ///[材质]不应改变其[color]， [shadowColor]或[type])。
> ///改变[elevation]和[shadowColor]为[animationDuration]动画。
> ///如果[type]不是[MaterialType.transparency]，则对[shape]的更改将被动画化
> / / /和[ShapeBorder。上一个和下一个[形状]值之间的Lerp]为
> / / /支持。形状的变化也被动画化为[animationDuration]。
> ///
> / / / # #的形状
> ///
> ///材质的形状由[shape]， [type]和[borderRadius]决定。
> ///
> /// -如果[shape]不为空，它决定了形状。
> /// -如果[shape]是空的，[borderRadius]是非空的，形状是一个
> ///圆角矩形，圆角由[borderRadius]指定。
> /// -如果[shape]和[borderRadius]为空，[type]确定
> ///形状如下:
> ///    - [ MaterialType。画布]:默认材质形状是一个矩形。
> ///    - [ MaterialType。:默认材质形状为矩形
> / / /圆形的边缘。边缘半径由[kMaterialEdges]指定。
> ///    - [ MaterialType。:默认材质形状为圆形。
> ///    - [ MaterialType。按钮]:默认材质形状为矩形
> / / /圆形的边缘。边缘半径由[kMaterialEdges]指定。
> ///    - [ MaterialType。透明度]:默认的材质形状是一个矩形。
> ///
> / / / # #边界
> ///
> ///如果[shape]不是null，那么它的边框也会被绘制(如果有的话)。
> ///
> /// ##布局更改通知
> ///
> ///如果布局改变(例如，因为材料上有一个列表，它是
> [LayoutChangedNotification]必须被发送到
> / / /相关的子树。这特别意味着转换(例如。
> /// [SlideTransition])不应该被放置在[Material]控件中
> ///移动包含[InkResponse]， [InkWell]， [Ink]或其他的子树
> ///使用[InkFeature]机制的部件。否则,正在进行的墨水
> ///功能(例如，墨水飞溅和墨水高光)不会移动
> ///新的布局。
> ///
> /// ##在材料上绘画
> ///
> ///材料部件经常会在其最近的材料上触发反应
> / / /祖先。例如,[ListTile。hoverColor]触发一个反应
> ///当指针悬停在瓷砖上时，它的材质。这些反应会是
> ///如果有任何部件在他们之间和材料油漆在这样一个
> ///设置一个[BoxDecoration。]颜色)
> / / / [DecoratedBox])。为了避免这种行为，使用[InkDecoration]来装饰
> ///材料本身。
