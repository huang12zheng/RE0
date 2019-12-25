import 'dart:async';
import 'dart:developer' as developer;

import 'package:cacart/features/module/send/domain/bean/article_db_bean.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class SendCase {
  Stream<SendDriven> applyAsync(
      {SendDriven currentState, SendDomain bloc});
  final SendArticleRepositoryImpl _sendRepository = SendArticleRepositoryImpl();
}

class LoadSendCase extends SendCase {
  final PublishArticleDbBean bean; 

  @override
  String toString() => 'LoadSendCase';

  LoadSendCase(this.bean);
  // undo -> send -> success
  @override
  Stream<SendDriven> applyAsync(
      {SendDriven currentState, SendDomain bloc}) async* {
    try {
      yield SendDriven.undo();
      await _sendRepository.send(bean);
      yield SendDriven.success();
      _sendRepository.clearCache(bean); // do it need to await?
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadSendCase', error: _, stackTrace: stackTrace);
      bloc.state.continued(
        (success)=> bloc.add(ReClearCacheCase(bean)), 
        // (failure)=> null,
        // (undo)=>null 
        null,  // failure is never happen
        null,  // undo is never happen
        /// (state)=>null // [state] would be happen, but we do nothing.
      );
      // bloc
      yield SendDriven.failure();
    }
  }
}

class ReClearCacheCase extends SendCase {
  final PublishArticleDbBean bean; 
  @override
  String toString() => 'LoadClearCacheCase';

  ReClearCacheCase(this.bean);

  @override
  Stream<SendDriven> applyAsync(
      {SendDriven currentState, SendDomain bloc}) async* {
    try {
      /// [_sendRepository] would error if class is outside -_-
      await _sendRepository.clearCache(bean);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadClearCacheCase', error: _, stackTrace: stackTrace);
      yield SendDriven.failure();
    }
  }
}