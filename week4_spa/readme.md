# single-spa dart

```dot
digraph {
    rankdir=LR
    node[shape=record]
    subgraph cluster0{
        SSPA
        BaseSource[label="Base前端模块资源|{StateA|模块1}|{StateB|模块2}|{StateC|模块3}"]
        Style
        
        CommonWidget->TemplatePage
        ACL[label="ACL Permission|{PageACL|WidgetACL}"]
        "..."
        Middle[label="Middle Derocation"]
        {"...",ACL}->Middle
        Util[label="Util|{响应式布局|...}"]
        Layout
    }

    subgraph cluster1{
        label = Loader模块加载器
        
        Route-> EventBus
        EventBus->{ SPAConfig, RegisterState}
        
    }
    cli[label="cli|{开发调试|Theme|DataShare|HTTP}"]
    { SPAConfig, RegisterState}->BaseSource
    route->Route

    {BaseSource,cli}->SPA
    {Middle,TemplatePage}->SPA

}
```

1. Route is from cloudConfig? SPAConfig is from cloudConfig. AppPackage version is about resourece
2. RegisterStates is in MatrialApp
3. Midle have many middle, like Permission...
4. There are UUID and some info to make EventBus to log and config Middle
5. SPA is from 基本物料，HTTP生命期响应骨架，物料洋葱层，开发工具