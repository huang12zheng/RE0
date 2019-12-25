import 'package:hydrated_bloc/hydrated_bloc.dart';

abstract class Domain<Case,Driven> extends HydratedBloc<Case,Driven>{
  @override
  Driven fromJson(Map<String, dynamic> json) => null;

  // @override
  // Stream<Driven> mapEventToState(Case event) => null;

  @override
  Map<String, dynamic> toJson(Driven state) => null;

}