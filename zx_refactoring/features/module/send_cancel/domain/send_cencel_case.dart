import 'dart:async';
import 'dart:developer' as developer;


import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class SendCencelCase {
  Stream<SendCencelDriven> applyAsync(
      {SendCencelDriven currentState, SendCencelDomain bloc});
  final SendCencelCancelRepository _sendcencelRepository = SendCencelCancelRepositoryImpl();
}

class LoadSendCencelCase extends SendCencelCase {
  final PublishArticleDbBean bean; 

  @override
  String toString() => 'LoadSendCencelCase';

  LoadSendCencelCase(this.bean);
  @override
  Stream<SendCencelDriven> applyAsync(
      {SendCencelDriven currentState, SendCencelDomain bloc}) async* {
    try {
      yield SendCencelDriven.undo();
      await _sendcencelRepository.saveData(bean);
      yield SendCencelDriven.success();
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadSendCencelCase', error: _, stackTrace: stackTrace);
      yield SendCencelDriven.failure();
    }
  }
}
