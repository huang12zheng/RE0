http://122.51.89.245:8880/hz/architecture.git
# Hydrated
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();
  await di.init();
  runApp(MyApp());
}

  final HydratedStorage storage;
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    final state = transition.nextState;
    if (bloc is HydratedBloc) {
      final stateJson = bloc.toJson(state);
      if (stateJson != null) {
        storage.write(
          '${bloc.runtimeType.toString()}${bloc.id}',
          json.encode(stateJson),
        );
      }
    }
  }

```
```dart
abstract class HydratedStorage {
  /// Returns value for key
  dynamic read(String key);

  /// Persists key value pair
  Future<void> write(String key, dynamic value);

  /// Deletes key value pair
  Future<void> delete(String key);

  /// Clears all key value pairs from storage
  Future<void> clear();
}

/// Implementation of `HydratedStorage` which uses `PathProvider` and `dart.io`
/// to persist and retrieve state changes from the local device.
class HydratedBlocStorage implements HydratedStorage {
  static HydratedBlocStorage _instance;
  Map<String, dynamic> _storage;
  File _file;

  /// Returns an instance of `HydratedBlocStorage`.
  /// `storageDirectory` can optionally be provided.
  /// By default, `getTemporaryDirectory` is used.
  static Future<HydratedBlocStorage> getInstance({
    Directory storageDirectory,
  }) async {
    if (_instance != null) {
      return _instance;
    }

    final directory = storageDirectory ?? await getTemporaryDirectory();
    final file = File('${directory.path}/.hydrated_bloc.json');
    var storage = <String, dynamic>{};

    if (await file.exists()) {
      try {
        storage =
            json.decode(await file.readAsString()) as Map<String, dynamic>;
      } on dynamic catch (_) {
        await file.delete();
      }
    }

    _instance = HydratedBlocStorage._(storage, file);
    return _instance;
  }

  HydratedBlocStorage._(this._storage, this._file);

  @override
  dynamic read(String key) {
    return _storage[key];
  }

  @override
  Future<void> write(String key, dynamic value) async {
    _storage[key] = value;
    await _file.writeAsString(json.encode(_storage));
    return _storage[key] = value;
  }

  @override
  Future<void> delete(String key) async {
    _storage[key] = null;
    return await _file.writeAsString(json.encode(_storage));
  }

  @override
  Future<void> clear() async {
    _storage = <String, dynamic>{};
    _instance = null;
    return await _file.exists() ? await _file.delete() : null;
  }
}

```

```dart
class NumberTriviaBloc extends HydratedBloc<NumberTriviaEvent, NumberTriviaState> {
  @override
  NumberTriviaState fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return null;
  }

  @override
  Map<String, dynamic> toJson(NumberTriviaState state) {
    // TODO: implement toJson
    return null;
  }
}
```

-----

# sealed_flutter_bloc

```dart
class NumberTriviaState extends Union4Impl<Empty,Loading,Loaded,Error> {
  static final unions = const Quartet<Empty,Loading,Loaded,Error>();
  NumberTriviaState._(Union4<Empty, Loading, Loaded, Error> union) : super(union);

  factory NumberTriviaState.initial() => NumberTriviaState._(unions.first(Empty()));

  factory NumberTriviaState.loading() => NumberTriviaState._(unions.second(Loading()));

  factory NumberTriviaState.success({NumberTrivia data}) =>
      NumberTriviaState._(unions.third(Loaded(trivia: data)));

  factory NumberTriviaState.failure({String error}) =>
      NumberTriviaState._(unions.fourth(Error(message: error)));
}


class Loaded {
  final NumberTrivia trivia;
  Loaded({@required this.trivia});

  @override
  List<Object> get props => [trivia];

  Widget build() {
    return TriviaDisplay(numberTrivia: trivia);
  }
}
```

> base
```dart
# base
class Empty {
  @override
  List<Object> get props => [];

  Widget build() {
    return MessageDisplay(message: 'Start searching!');
  }
}

class Loading {
  @override
  List<Object> get props => [];

  Widget build() {
    return LoadingWidget();
  }
}


class Error {
  final String message;
  Error({@required this.message});

  @override
  List<Object> get props => [message];

  Widget build() {
    return MessageDisplay(message: message);
  }
}
```

```dart
return SealedBlocBuilder4<NumberTriviaBloc, NumberTriviaState, Empty, Loading, Loaded,
Error>(
    builder: (context, states) => states(
        (initial) => initial.build(),
        (loading) => loading.build(),
        (success) => success.build(),
        (failure) => failure.build(),
    ),
);
```

```dart
class SliverEvent extends Union2Impl<FetchEvent,LoadEvent>{
  static final unions = const Doublet<FetchEvent,LoadEvent>();
  SliverEvent._(Union2<FetchEvent,LoadEvent> unions) : super(unions);

  factory SliverEvent.fetch() => SliverEvent._(unions.first(FetchEvent()));
  factory SliverEvent.load() => SliverEvent._(unions.second(LoadEvent()));
}

Stream<SliverState> mapEventToState(
    SliverEvent event,
  ) async* {
    yield* event.join(
      (FetchEvent event) async* {
        yield* state.join(
          (EmptyState initail) => event.fetch(initail, this),
          (success) => null,
          (failure) => null,
        );
      },
      (event) async* {
        yield* state.join(
          (initail) => null,
          (success) => null,
          (failure) => null,
        );
      }
    );
```