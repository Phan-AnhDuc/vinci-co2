extension ListExtension<T> on List<T> {
  List<T> addBetween(T element, {bool withBound = false}) {
    if (withBound) {
      return [
        element,
        ...expand((e) => [e, element])
      ];
    } else {
      return expand((e) => [e, element]).toList()..removeLast();
    }
  }
}
