import 'package:cacart/domain/uml/index.dart';

// class Performer<T extends Who> extends Who {
//   final T performer;
//   Performer(this.performer);
//   @override
//   String toId() => performer.toId();
// }

// abstract class Performer<T extends Who> extends Who {
//   final T performer;
//   Performer(this.performer);
//   String toId() => performer.toId();

//   // @override
//   // How get how => null;
//   // @override
//   //  When get when => null;
//   // @override
//   //  Where get where => null;
//   // @override
//   //  What get which => null;
//   // @override
//   //  Who get who => null;
// }
// mixin PerformerMixin<O extends Who,H extends How> on How{
mixin PerformerMixin<O extends Who> on How{
  //  P     get who   => null;
  //  What  get what  => null;
  //  H     get how   => null;
  //  Where get where => null;
  //  When  get when  => null;
  O     get who;
  What  get what; 
  // H     get how;
  Where get where;
  When  get when;
}
mixin SimplePerformerMixin<O extends Who> on How{
  //  P  who;
   Where get where => null;
   When  get when  => null;
   /// [implement] `how`, it is no good
  //  List toStep()=>null;
   List steps=[];

}

mixin HENMixin<O extends Who> on How{
   Where get where => null;
   When  get when  => null;
   List steps=[];
}

// mixin PerformerMixin<T extends Who>{
//   String get id => who.id;
//   Who get performer => who;
//   String toId() => who.toId().toString();

//   T get who;
// }