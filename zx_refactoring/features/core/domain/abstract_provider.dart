import 'package:cacart/features/core/aggregate/abstract_repository.dart';
import 'package:cacart/features/core/domain/abstract_driven.dart';
import 'package:equatable/equatable.dart';
import 'abstract_domain.dart';

/// [Passive] is [VO]
/// [Repositorys],[Domain] is [DO]
abstract class DBProvider<T>{
  // Future insert<T>(T bean);
  // Future<T> getData<T>(T bean);
  // Future delete<T>(T bean);
  Future insert(T bean);
  Future<T> getData(T bean);
  Future delete(T bean);
  
}