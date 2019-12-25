# isolate

* Platform Task Runner
Flutter Engine的主Task Runner，类似于Android Main Thread或者iOS的Main Thread
* UI Task Runner Thread（Dart Runner）
* GPU Task Runner
* IO Task Runner
>  Dart的Isolate是Dart虚拟机自己管理的，Flutter Engine无法直接访问。Root Isolate通过Dart的C++调用能力把UI渲染相关的任务提交到UI Runner执行这样就可以跟Flutter Engine相关模块进行交互，Flutter UI相关的任务也被提交到UI Runner也可以相应的给Isolate一些事件通知，UI Runner同时也处理来自App方面Native Plugin的任务。

> 当时我们需要把Native加载好图片数据注册到Engine里面去以便生成Texture渲染，使用完资源我们需要将其移除，看起来非常清晰的逻辑竟然造成了野指针问题。后来排查到注册的时候在一个子线程进行而移除却在Platform线程进行

---
Flutter里面所以的图片都是经过ImageProvider来获取的，ImageProvider在获取图片的时候会调用一个Resolve接口，而这个接口会首先查询ImageCache去读取图片，如果不存在缓存就new Image的实例出来。

stream.setCompleter(PaintingBinding.instance.imageCache.putIfAbsent(key, () => load(key)));

![](https://upload-images.jianshu.io/upload_images/13183175-2530c794e9167599.png?imageMogr2/auto-orient/strip|imageView2/2/w/1200/format/webp)
---

我开始调查每个页面的图片加载请求，我们知道Flutter里面万物皆Widget，页面都是是Widget，由Navigator管理。我在Widget的生命周期方法（详细见Flutter官方文档）中加入监控代码，如我所料，在Navigator栈底下不可见的页面也还在不停的Resolve Image，直接导致了image对象暴涨而导致IO线程过载，导致了内存峰值。


# flutter 生命周期

![](http://gw.alicdn.com/mt/TB1.MOKurPpK1RjSZFFXXa5PpXa-1394-1314.png)

![](http://gw.alicdn.com/mt/TB1GRqZtVzqK1RjSZFoXXbfcXXa-876-740.png)


> PS: 在state dispose后，element会和state断开相互引用，如果在这个时候开发者去拿element的位置,就会报异常


> 解决方案并不难....在页面不可见的时候没必要发出多余的图片加载请求，峰值也就随之降下来了。再经过一番代码优化和测试以后问题得到了根本上的解决。

PS:
* 在极端情况下将老页面进行销毁，在需要的时候重新创建
![](https://upload-images.jianshu.io/upload_images/13183175-ca0d5ba2495f02a3.png?imageMogr2/auto-orient/strip|imageView2/2/w/519/format/webp)
