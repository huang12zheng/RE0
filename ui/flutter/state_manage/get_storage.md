https://github.com/jonataslaw/getx/issues/2361
```sh
I find a package get_storage.
It would refresh on you do _getRealBox().write(key, newVal) and write local with queue.

refresh is also in GetListenable<T> set value

and
call notifyChildrens when get value

also would notifyChildrens() which is read() in get is 5.0.0-beta.30

but it's dependencies[>=4.0.0 <5.0.0] is outdate, due to get is 5.0.0-beta.30
```


```dart
T get val => _getRealBox().read(key) ?? defaultValue;
    return _concrete.read(key);
        return subject.value![key] as T?;
            Value<T>
            @override
            T? get value {
                notifyChildrens();
                return _value;
            }


set val(T newVal) => _getRealBox().write(key, newVal);
    writeInMemory(key, value);
        _concrete.write(key, value);
            subject
                ..value![key] = value
                ..changeValue(key, value);

            void changeValue(String key, dynamic value) {
                changes = {key: value};
                refresh();
            }

    return _tryFlush();
        return microtask.exec(_addToQueue);
            return queue.add(_flush);
                _flush
                await _concrete.flush();
                    return _writeToStorage(subject.value!);
                        localStorage.update(fileName,

```