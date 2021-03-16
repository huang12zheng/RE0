* 问题1  darwin linux windows需要的是什么链接器?比如在mac上.

  找到的一些资料: https://moevis.github.io/cheatsheet/2018/08/18/%E8%B6%85%E6%96%B9%E4%BE%BF%E7%9A%84-Rust-%E4%BA%A4%E5%8F%89%E7%BC%96%E8%AF%91.html

  * 问题1.2
    但是否真的需要
    https://github.com/DevNulPavel/m3u8_downloader/blob/47f2e2588dc8f3242d09edc088272829adc54812/Makefile
    
    这个就没有
    
* 问题2 是否有傻瓜的方法?
  * 问题2.2
    有没有试过cross,好像可以不用考虑链接器
    
    https://github.com/rust-embedded/cross
    
    提供了一个环境，跨工具链和跨编译库，这些环境可生成最可移植的二进制文件
  * 问题2.3
    有没有谁知道cross的文档,另是否有必要了解cross文档.

---
* 知识点1

从 https://github.com/brickpop/flutter-rust-ffi/blob/master/rust/makefile#L1-L111 
中知道了:
  + 知识点1.1
    ANDROID 这两个应该是宏, 编译器, 链接器.
  + 知识点1.2
    IOS 用 cargo lipo
```makefile
target/x86_64-linux-android/release/libexample.so: $(SOURCES) ndk-home
    CC_x86_64_linux_android=$(ANDROID_X86_64_LINKER) \
    CARGO_TARGET_X86_64_LINUX_ANDROID_LINKER=$(ANDROID_X86_64_LINKER) \
        cargo build --target x86_64-linux-android --release
    @echo "[DONE] $@"
...
```
* 知识点2
cargo target 只是添加 编译器, 还需要链接器 
