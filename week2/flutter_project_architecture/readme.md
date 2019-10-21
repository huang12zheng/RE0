
```
# run under /lib
mkdir plugin store route util compnents page
mkdir config res
mkdir mock
cd store
mkdir beans data_provider repository bloc presentation
cd ..

cd config
touch constanst.dart
cd ..
cd res
touch color.dart theme.dart 
cd ..

cd .. #root
mkdir locale res readme docs #assets
```

## 1.描述界面而不要操作界面
## 2.基于共同祖先通信
数据上行，通知下行
## 函数式数据流
rxdart+stream
## 网络上的闲鱼早期结构
![闲鱼结构](https://pic3.zhimg.com/80/v2-b9286a44884383e287faf1e74615414a_hd.jpg "闲鱼结构")


```dot
digraph{
    node[shape=record]
    subgraph cluster1{
        label=Component
        UIstate[label="UIstate"]
        UIInheritedWidget[shape=circle,label="InheritedWidget"]
        // View
        UIstate->UIInheritedWidget[label="is"]
        UIInheritedWidget->Widget[label="child"]
    }
    subgraph cluster2{
        label=Page
        UIProvider
        BusinessLogic
        subgraph cluster3{
            label=sub
            a
        
        }
        
    }
    UIInheritedWidget->UIProvider[label="hold"]
    
}

```
1. uiState 
uiState is a part of component, and it would change by something. 
I think it is just a data.so using inherited, make data up.
2. 