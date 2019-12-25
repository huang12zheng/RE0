// abstract class Who{ String        get id =>  toId();      String toId(); }
// abstract class How{ List<dynamic> get steps=>toStep();    List<dynamic> toStep();}
// abstract class What{ String       get desc;               String toDesc(); }
// abstract class When{ dynamic      get time=> toTime();    dynamic toTime();}
// abstract class Where{dynamic      get place=>toPlace();   dynamic toPlace();}

// abstract class Which{ dynamic     get desc=>toDesc;       dynamic toDesc();}  // Value
abstract class Who{  String        get id;   }  
abstract class What{ String        get desc; }
abstract class When{ dynamic       get time; }
abstract class Where{dynamic       get place;}
abstract class How<Who,What>{ dynamic call(); }

abstract class Which{ dynamic     get desc=>toDesc;       dynamic toDesc();}  // Value
abstract class EachOther{}
abstract class Another{}
abstract class Whatever{}
abstract class Whichever{}
abstract class Whoever{}

/// [BaseImpl] is like 
/// ```dart
/// final Who   who;
/// final What  which;
/// final How   how;
/// final Where where;
/// final When  when;
/// ```
// mixin BaseMixin {
//    Who   get who   => null;
//    What  get which => null;
//    How   get how   => null;
//    Where get where => null;
//    When  get when  => null;
// }
class WhoImpl implements Who{

  const WhoImpl();

  @override
  String get id => null;

  @override
  String toId() => null;
}
/// To generate `const`
class HowImpl implements How{

  const HowImpl();

  @override
  call() =>null;
  
}
/// To generate `const`
class WhenImpl implements When{

  const WhenImpl();
  @override
  get time => null;
  @override
  toTime() {
    return null;
  }
}