import 'dart:async';

class BaseStreamController<T> {
  final StreamController _streamController = StreamController<T>();

  Stream<T> get stream => _streamController.stream as Stream<T>;

  add(T value) {
    _streamController.add(value);
  }

  close() {
    _streamController.close();
  }
}