import 'index.dart';

class SendCencelDomain extends Domain<SendCencelCase,SendCencelDriven>{
  static final SendCencelDomain _SendCencelBlocSingleton = SendCencelDomain._internal();
  factory SendCencelDomain() {
    return _SendCencelBlocSingleton;
  }
  SendCencelDomain._internal();
  
  @override
  Future<void> close() async{
    super.close();
  }

  SendCencelDriven get initialState => SendCencelDriven.undo();

  @override
  Stream<SendCencelDriven> mapEventToState(
    SendCencelCase event,
  ) async* {
    event.applyAsync();
  }
}
