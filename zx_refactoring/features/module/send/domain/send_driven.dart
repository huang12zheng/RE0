import 'package:cacart/features/core/commom/base_driven.dart';

class SendDriven<Model> extends BaseDriven<Model> {
  static final unions = const Triplet<SuccessDriven,FailureDriven,Undo>();
  SendDriven(Union3<SuccessDriven, FailureDriven, Undo> union) : super(union);

  factory SendDriven.success({Model data})=>SendDriven(unions.first( SuccessDriven(0,[data])));
  factory SendDriven.failure({String err})=>SendDriven(unions.second(FailureDriven()));
  factory SendDriven.undo()=>SendDriven(unions.third(UndoDriven()));
}