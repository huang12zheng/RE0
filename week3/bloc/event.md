# 事件处理
以InkWell组件为例，定义它的onTap函数为openURL(data.hints[0].href, data.hints[0].params)。在创建InkWell时，会以OpenURL作为事件ID，查找对应的处理函数，当用户点击的时候，会解析出对应的参数列表并传递过去，代码如下：

```dart
final List<dynamic> tList = <dynamic>[];
// 解析出参数列表
exp.argumentsList.forEach((dynamic arg) {
    if (arg is String) {
        final dynamic value = valueFromPath(arg, param.data);
        if (value != null) {
            tList.add(value);
        } else {
            tList.add(arg);
        }
    } else {
        tList.add(arg);
    }
});

// 找到对应的处理函数
final dynamic handler =
    TeslaEventManager.sharedInstance().eventHandler(exp.actionName);
if (handler != null) {
    handler(tList);
}
```
----

![](https://upload-images.jianshu.io/upload_images/13183175-d1fc5687f75b2f1f.png?imageMogr2/auto-orient/strip|imageView2/2/w/1200/format/webp)

---

![](https://upload-images.jianshu.io/upload_images/13183175-5ccb5f70b848d923.png?imageMogr2/auto-orient/strip|imageView2/2/w/1200/format/webp)


event-> hascode