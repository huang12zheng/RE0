
import 'package:cacart/features/core/domain/abstract_driven.dart';

abstract class Undo extends Driven {
  Undo([List propss]) : super(0,[propss]);

  Future call() => null;
}

// General Undo
class UndoDriven extends Undo {
  UndoDriven([List propss]) : super([propss]);
}