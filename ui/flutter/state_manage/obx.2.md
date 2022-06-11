ob
* Notifier.instance
单例
* read and append
`get value` => reportRead => Notifier.instance.read(this or `ListNotifierSingleMixin`);
ListNotifierSingleMixin.addListener(updater) 
> !!/// 调用`流`T时,将流的监听者加上一个. 监听者要做的是,去`update view`
<!-- Stream or subject.add(`updater`) -->

* `view build`
Notifier.instance.append(NotifyData(`updater`: getUpdate or markNeedsBuild));=> 
流的接收口?XX 流的动作 记录下来.

> `注意, 我们是build()中先设置 了 updater, 然后才会去 访问 get value.`

* `set value`
for (var element in _updaters!) {
    element();
}