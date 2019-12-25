import 'success.dart';
import 'undo.dart';
import 'failure.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

export 'base_driven.dart';
export 'failure.dart';
export 'success.dart';
export 'undo.dart';
export 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

/// Just merge [Success,Fail]
class BaseDriven<Model> extends Union3Impl<SuccessDriven,FailureDriven,Undo>{
  // static final unions = const Doublet<SuccessDriven,FailureDriven>();
  static final unions = const Triplet<SuccessDriven,FailureDriven,Undo>();
  
  BaseDriven(Union3<SuccessDriven,FailureDriven,Undo> union) : super(union);
  factory BaseDriven.success({Model data})=>BaseDriven(unions.first( SuccessDriven(0,[data])));
  factory BaseDriven.failure({String err})=>BaseDriven(unions.second(FailureDriven()));
  factory BaseDriven.undo()=>BaseDriven(unions.third(UndoDriven()));
}