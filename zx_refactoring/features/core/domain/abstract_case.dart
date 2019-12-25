import 'package:cacart/features/core/aggregate/abstract_repository.dart';
import 'package:cacart/features/core/domain/abstract_driven.dart';
import 'package:equatable/equatable.dart';
import 'abstract_domain.dart';

// abstract class UseCase extends Equatable {

//   UseCase();
//   Stream<Driven> loadAsync(Domain domain);
// }

/// [Passive] is [VO]
/// [Repositorys],[Domain] is [DO]
abstract class UseCase<Rs extends Repositorys,Passive extends Driven,Field extends Domain> extends Equatable {
  final Rs reposiroties;
  UseCase(this.reposiroties);
  Stream<Passive> loadAsync(Field domain);

  @override
  List<Object> get props => null;
}