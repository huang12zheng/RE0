import 'package:cacart/features/base/entity_factory.dart';
import 'package:cacart/features/core/aggregate/abstract_repository.dart';
import 'package:cacart/features/core/domain/abstract_provider.dart';

abstract class SendCencelCancelRepository extends Repositorys {
  Future saveData<T>(T bean);
}
class SendCencelCancelRepositoryImpl extends SendCencelCancelRepository{
  @override
  Future<T> saveData<T>(T bean) async {
    return (EntityFactory.generateProvider<T>() as DBProvider).insert(bean);
  }
}