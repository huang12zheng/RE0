# What's Coding?
coding is like building a house or writing an article. Grnerally speaking, your code should be creative, is easy used, is stable, is lightweight,
## coding is building indicator
1. lightweight, you can use `collection literal`, `var`, `support recovery mechanism`.
2. stable and easy-used,Defined by `class`,`interfaces`,`method`,`dispatch`,`encapsulation`,`mixin`
3. use async to impove  performance.
## coding is a article
coding is article,which is to make you know something. Then, how to writing it?
1. how to writing it;
 + Point is why you write for other,and it is `including many subPoints`. Code is a list of function, which has a list of subfunction.
2. Moreover
 UI = Widget(Data).
 UInm = Widget_m(Data_n).
 there is a map from data=>UI. How do it(func) look like?

 > M V VM
 1. M is data layer,
 2. V is What user look.
 3. VM is including some method to change M, 
   BusinessLogic and UILogic, it can use in many place.
 > I think VM is mixin

 > MVP
  P is business layer, which is change data of M, and get data of M,
  <font color=red>interface</font> of V is IV,which send event to P, and P change M. M changed, and V is depending by P with data of model, then V is change. 

  Moreover, how V to get a P without too many time init. Provider. P with Steam, which I think is a clone of Model.
## some thing important
* stream
    - The pipe is the Stream and the water is the asynchronous data
    - how to write a stream?
    ```dart
    Stream<int> countStream(int max) async* {
        for (int i = 0; i < max; i++) {
            yield i;
        }
    }
    ```
* bloc
    - it is a component which converts a Stream of incoming `Events` into a Stream of outgoing `States`
    https://felangel.github.io/bloc/#/architecture?id=data-layer