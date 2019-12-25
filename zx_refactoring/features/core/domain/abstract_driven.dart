import 'package:equatable/equatable.dart';

/// [propss] is to control response,
/// in case, UseCase SendCencel [Driven]s, you could get just one.
/// [version] is for developer checking.
abstract class Driven extends Equatable {
  Driven(this.version, [this.propss]);
  Future call();

  final int version;
  final List propss;

  Driven getStateCopy()=> null;

  Driven getNewVersion()=> null;

  @override
  List<Object> get props => (propss);
}