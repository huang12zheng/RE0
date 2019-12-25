import 'index.dart';

class SendDomain extends Domain<SendCase,SendDriven>{
  static final SendDomain _sendBlocSingleton = SendDomain._internal();
  factory SendDomain() {
    return _sendBlocSingleton;
  }
  SendDomain._internal();
  
  @override
  Future<void> close() async{
    super.close();
  }

  SendDriven get initialState => SendDriven.undo();

  @override
  Stream<SendDriven> mapEventToState(
    SendCase event,
  ) async* {
    yield* event.applyAsync();
  }

}
