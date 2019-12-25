import 'package:cacart/features/core/commom/base_driven.dart';

class SendCencelDriven<Model> extends BaseDriven<Model> {
  static final unions = const Triplet<SuccessDriven,FailureDriven,Undo>();
  SendCencelDriven(Union3<SuccessDriven, FailureDriven, Undo> union) : super(union);

  factory SendCencelDriven.success({Model data})=>SendCencelDriven(unions.first( SuccessDriven(0,[data])));
  factory SendCencelDriven.failure({String err})=>SendCencelDriven(unions.second(FailureDriven()));
  factory SendCencelDriven.undo()=>SendCencelDriven(unions.third(UndoDriven()));
}