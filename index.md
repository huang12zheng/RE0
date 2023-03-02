<!-- [English resume](resume_html-en.md) -->
## 基本信息
+ 姓名: 黄政
+ 手机: 17682318150
+ 邮箱:805104533@qq.com
+ [兴趣](Interests.md)
+ 身份证号: 352225199208150018
+ 住址: 杭州萧山闻堰滨江东方海岸
+ https://github.com/huang12zheng
+ 职业技能概述: k8s, flutter, rust, 深度学习, libp2p, substrate, devops
+ 毕业于211学校, 计算数学相关, 有竞赛背景

## 教育经历
2011-201507 湖南师大(211) 信息与计算科学 本科学士
* 2013 ACM亚州区杭州站铜牌
* 2014 中科大保研名额
* 数学建模等获奖项

## 职业倾向

* flutter(内容知识相关应用,深度学习相关或去中心化应用)
* rust(实现深度学习相关生态,但更希望有开源的工具直接使用)
* NLP(信息抽取,检索)

## 职业技能
**RUST:**
1. 了解clap,tokio,serde,sccache,Polars,arrow2
2. 能通过FFI将rust生态被flutter利用
3. 使用libp2p,构建独立网络(去中心化)
4. 使用salsa进行增量计算
5. 了解substrate,IBC,zokrates等
6. 宏编程(darling,proc-macro)
7. 了解automerge,yrs等CRDT库

**运维:**
1. 能依据需求,使用PXE,k8s,helmfile部署应用到腾讯云或裸机等
2. 能编写github action,或使用drone等工具实现devops

应用开发:
1. [熟悉flutter开发](system/flutter/index.md).

**深度学习:**
1. 能利用工具,优化大模型训练,推理.有prompt模版经验
2. 了解领域必读论文(包括多模态,轻量模型等),了解数值分析及相关数学原理
3. 能用rust修改或部署一些NLP下游任务

**基本技能:**
1. google,chatgpt
2. git的基本使用
3. 了解线段树,并查集,最大流最小割等数据结构

## 实践经历
> 断档期主要依据自身兴趣,与需要学习理论知识.完成内容比较杂乱,链接地址为[其余杂项](./miscellaneous-cn.md)

杭州恒生电子 为 正式工作经历

* [问答系统](system/dl/项目/train_detail.md)

* 从裸机搭建环境
1. 编写PXE脚本,生成关于alpine netboot的iso或kpxe文件.
2. 使用dnsmasq prxoy,方便在dhcp结束后,发送启动文件和lbk文件.
3. ansible 调用 role:wakeonlan
4. 阅读terraform上的package,依定义编写代码
5. 安装docker,k3s,helm,启动gitea,drone,minio.
6. 依据纠删码原理,设置minio服务器及derive数量.
7. JuiceFS使用redis,生成POXIS路径.
8. 启动vscode-server, 加载自定义的mod.
9. 在ubuntu上编译sccache,并将rust编译任务转发到远程
10. 编写jsonnet脚本
11. 适配argocd.

* 202105-202106 800台机器的运维(奇亚chia)[币价下跌,自动化完成,公司解散]

win:
    装机,人员培训,人员工作情况信息共享(用腾讯文档)
linux:
    人工设置固定IP,使用一些工具(sshpass, ansible, shell, swar (python) ) 实现开机P图,结束关机,结束人肉操作
    zabbix数据记录
    内核参数修改,去除保留空间,16T硬盘格式化设置,脚本挑包,NTFS转linux,依据性能数据验证实际结果,保护文件完整性,定时任务及状态驱动,任务优化,权衡项目推进与问题处理,清盘工作
其它:
    尝试MicroK8S来控制机器，但因为带宽限制,不适合此项目


* 201910-202001 链群(左象)(破产) flutter工程师

  1. 将fish_redux替换为bloc,从而减少样板代码.
  2. 协助测试人员了解flutter,编写widget test.
  3. 尝试响应式设计

  工作中实现的业务:
  1. 重构登录界面(分离登录验证模块,支持微信)
  2. 群组(使用SDK来快速实现聊天功能,设置不同的群类型,普通群员和管理员设置不同权限,以及多页面数据的同步)

* 201505-201707 杭州恒生电子 经纪业务运营平台UF20

1. 清算相关的业务(新股IPO,质押回购,港股通等),涉及技术:Delphi,Oracle,C++
2. 自动化测试,获取鼠标位置信息和识别控件,涉及技术:VB

* 201501-201505 中兴软创 图书订购系统

## 开源pr
* rust-flutter-bridge
  1. 处理没有设置dart_decl_output时,不生成wasm相关代码的问题
  2. 支持`pub type UserId = OwnerId;`也可以正常生成ffi代码
* graphql_flutter
  uuidFromObject类型转换错误
* polars
  表格的样式修复
* Dart-Data-Class-Generator(一个vscode插件)
* fluidframework
  编写中文文档,
  优化restWrapperP
* ...



## 自我评价
```
211重点院校本科学士,熟悉数据结构与基本算法.自学能力强
掌握多种工具,能使用rust,flutter,k8s搭建应用
```
