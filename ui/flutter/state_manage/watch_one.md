* repository.watchOne

remoteAdapter.internalWatch!(
repository.watchOneProvider()
)

* usage
```dart
Repository<Task> get tasks => watch(tasksRepositoryProvider)..remoteAdapter.internalWatch = watch;
final tasksRepositoryProvider =
    Provider<Repository<Task>>((ref) => Repository<Task>(ref.read));
> now we get repository just by short magic label 'tasks'
// https://flutterdata.dev/docs/repositories/#watchone
```


final b = Provider((ref) => ref.watch(a), dependencies: [a]);

_internalHolder =
InternalHolder
( final _tasksFinders = <String, dynamic>{};
)

DataModel哪里保存? 在构造函数中初始化时的init()会去看是否有save=true.

* was
model = deserialized.model!.was(model).saveLocal();