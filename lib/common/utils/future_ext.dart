extension FutureExt<T, R> on Future<T> {
  Future<R> map(R Function(T) mapper) async {
    final value = await this;
    return mapper.call(value);
  }
}

