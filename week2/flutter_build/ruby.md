# Ruby fast handbook

## Module
Module is just like mixin
```ruby
class S
    inclue XModule
end
```
## String
1. `#{xx}` is like `${xx}` in ruby,using it rather than +
2. `str =~ obj` 根据正则表达式模式 obj 匹配 str。返回匹配开始的位置，否则返回 false
3. str[position] 
4. str[start, length]
> \# 注意返回的是ASCII码而不是字符
## Symbol
`:key => value`
:key is a class of `Symbol`
## IO
1. puts or print
2. gets

* other
```ruby
 read write  gets  readline  getc  printf
```
## File
|metho|说明|
|-|--|
|File::basename( path[, suffix])|末尾的文件名,且删除suffix|
|File::exist?( path)|如果 path 存在，则返回 true。|
|File::ftype( path)|...|
|File::split( path)|dirname+basename|
|File::symlink?|如果 path 是一个符号链接，则返回 true。|
|File::symlink( old, new)|创建一个指向文件 old 的符号链接。|
|File::join(item...)|使用 File::Separator 进行分隔连接|
|File::expand_path( path[, dir])|返回相对于dir的绝对路径|
> ~ 为进程所有者的主目录，~user 为用户的主目录
> dir 被省略则相对于当前工作目录 
## Re
/pattern/
/pattern/im    # 可以指定选项
%r!/usr/local! # 使用分隔符的正则表达式
> Re 能过滤字符串中的ruby注释
## abbreviation 简写
1. 方法调用的最外层括号可省略
> 属于函数的最后一个参数  # In my point

puts "hi" $\equiv$ puts("hi")
2. 函数最后一行默认有return
3. hash最外面的{}大多数下可以省略
A.create :name=>'a', :color=>'r' $\equiv$ A.create({name:'a',color:'r'})
> it is most important
4. App.all.map{ |apple| apple.name } $\equiv$ App.all.map(&:name)
> you wouldn't search anything with `&:`
5. 多个`def xxx end` $\equiv$ 
```ruby
['mn1','mn2','mn3'].each do |name|
    define_method "#{name}" do
        # detail
    end
```
## 类方法