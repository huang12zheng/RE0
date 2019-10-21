# Flutter Build Base
## Android
Flutter工程的Android打包，其实只是在Android的Gradle任务中插入了一个flutter.gradle的任务，而这个flutter.gradle主要做了三件事：（这个文件可以在Flutter库中的[flutter/packages/flutter_tools/gradle]目录下能找到。）
1. 增加flutter.jar的依赖。
2. 插入Flutter Plugin的编译依赖。 
3. 插入Flutter工程的编译任务，最终将产物（两个isolaate_snapshot文件、两个vm_snapshot文件和flutter_assets文件夹）拷贝到mergeAssets.outputDir，最终merge到APK的assets目录下。
>  应用程序数据段  应用程序数据段
## ios

执行编译命令“flutter build ios”，最终会执行Flutter的编译脚本[xcode_backend.sh]，而这个脚本主要做了下面几件事：
1. 获取各种参数(如`project_path，target_path，build_mode等），主要来自于Generated.xcconfig的各种定义。
2. 删除Flutter目录下的App.framework和app.flx。
3. 对比Flutter/Flutter.framework与${FLUTTER_ROOT}/bin/cache/artifacts/engine/${artifact_variant}目录下的Flutter.framework，若不相等，则用后者覆盖前者。
4. 获取生成App.framework命令所需参数（build_dir，local_engine_flag，preview_dart_2_flag，aot_flags）。
5. 生成App.framework，并将生成的App.framework和AppFrameworkInfo.plist拷贝到XCode工程的Flutter目录下。
> Generated.xcconfig 是flutter build生成的
> build xcode_backend.sh 之后会 才会跑 `pod install`

## MoreOver
Flutter相关代码的最终产物是:App.framework(`dart代码生成`)和Flutter.framework(`引擎`)。
从Xcode工程的视角看，Generated.xcconfig描述了Flutter相关环境的配置信息，然后Runner工程设置中的Build Phases新增的xcode_backend.sh实现了Flutter.framework的拷贝(从Flutter仓库的引擎到Runner工程根目录下的Flutter目录)与嵌入，App.framework的编译与嵌入。最终生成Runner.app

----
`flutter.jar`类似iOS的Flutter.framework，包括了Engine部分(Flutter.jar中的libflutter.so)，和Embedder部分(FlutterMain,FlutterView,FlutterNativeView等)
> 实际中flutter.jar位于flutter仓库的/bin/cache/artifacts/engine/android*下

## 差别
...