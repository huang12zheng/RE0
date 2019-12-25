import 'package:cacart/features/core/domain/abstract_driven.dart';

abstract class Failure extends Driven {
  // String info;
  Failure() : super(null);
  Future call() => null;
}

/// General failures
class FailureDriven extends Failure {
}

class ServerFailure extends Failure {
}

class CacheFailure extends Failure {
}

// class ServerException implements Exception {}

// class CacheException implements Exception {}