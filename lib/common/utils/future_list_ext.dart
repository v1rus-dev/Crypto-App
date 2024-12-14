extension FutureListExt<T, R> on Future<Iterable<T>> {
  Future<Iterable<R>> mapList(R Function(T) mapper) async {
    final value = await this;
    return value.map((item) => mapper.call(item));
  }
}

extension FutureNullableListExt<T> on Future<Iterable<T>?> {
  Future<Iterable<R>> mapNullableList<R>(R Function(T) mapper) async {
    final value = await this;
    return value?.map((item) => mapper.call(item)) ?? <R>[];
  }
}
