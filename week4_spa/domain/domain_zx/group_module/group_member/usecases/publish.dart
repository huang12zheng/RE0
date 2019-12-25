import 'package:cacart/domain/domain1/who/role/performer.dart';
import 'package:cacart/domain/uml/pronoun.dart';


abstract class Publish<O extends Who,T extends What> extends How with PerformerMixin<O>{
  
}

// class Publisher<T extends Who> extends Performer<T> {
//   Publisher(T performer) : super(performer);
//   // @override
//   // String toId() {
//   //   // TODO: implement toId
//   //   return null;
//   // }
//   // final Who performer;
//   // Publisher(this.performer, 
//   //   {this.which,@required this.how, this.where, this.when = Now}
//   // ) : super(performer);
//   // final What which;
//   // final How how;
//   // final Where where;
//   // final When when;
// }
// // mixin PublishMixin<T extends Publisher>{
// //   // @override
// //   String get id => who.id;

// //   // @override
// //   Who get performer => who;

// //   // @override
// //   String toId() => who.toId().toString();

// //   Who get who;
// //   // final What  which;
// //   // final How   how;
// //   // final Where where;
// //   // final When  when;
// // }
// // class MemberPublishV2 extends Publisher {
// //   MemberPublishV2(Who performer) : super(performer);
// // }
// class MemberPublish with PerformerMixin<Who> implements Publisher{
//   // MemberPublish({this.who, this.which, this.how, this.where, this.when});

//   // final Who   who;
//   // final What  which;
//   // final How   how;
//   // final Where where;
//   // final When  when;

// }