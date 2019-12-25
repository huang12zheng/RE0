
import 'package:cacart/features/core/domain/abstract_driven.dart';

abstract class Success extends Driven {
  Success(int version,[List propss]) : super(version,[propss]);

  Future call() => null;
}

// General success
class SuccessDriven extends Success {
  SuccessDriven(int version,[List propss]) : super(version,[propss]);

  SuccessDriven getNewVersion() => SuccessDriven(version+1,[propss]);
  /// version => 0?
  Driven getStateCopy([List propss])=> SuccessDriven(version+1,[propss??this.propss]);
}