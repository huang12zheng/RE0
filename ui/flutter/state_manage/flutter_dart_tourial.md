* init
    ref.watch(repositoryInitializerProvider).when(  //构建图关系和...
* save:
    Task(title: value).save();
* fetch
    final state = ref.tasks.watchAll();
    for (final task in state.model) Text(task.title),
    > DataState<List<T>?>.model

* reload or clear_data
    final state = ref.tasks.watchAll(params: {'_limit': 5}, syncLocal: true);
    + or
    ProviderScope(
      child: TasksApp(),
      overrides: [configureRepositoryLocalStorage(clear: true)],
    ),
    + or
    RefreshIndicator(
      onRefresh: () => ref.tasks.findAll(params: {'_limit': 5}, syncLocal: true),
* override local value
  ```dart
  final _currentTodo = Provider<Todo>((ref) => throw UnimplementedError());
  final todo = ref.watch(_currentTodo);
  
  for (final todo in filteredTodos)
    child: ProviderScope(
        overrides: [
        _currentTodo.overrideWithValue(todo),
        ],
        child: const TodoItem(),
    ),
  ```
* get data by relationship
  ```date
  final state = ref.watch(userProvider);  //DataState<User?> state
  final todos = state.model!.todos.toList(); // todos is HasMany<Todo> todos
  ```
* logLevel
  ```dart
  final userProvider = StateNotifierProvider.autoDispose<DataStateNotifier<User?>,
    DataState<User?>>((ref) {
      ref.users.logLevel = 3;
      ref.todos.logLevel = 3;
      return ref.users.watchOneNotifier(1,
      ...

  ```