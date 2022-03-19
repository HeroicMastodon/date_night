class StackedSet<Type> implements Iterable<Type> {
  late List<Type> _value;

  StackedSet([List<Type>? value]) {
    _value = value ?? [];
  }

  void add(Type item) {
    _value = [
      item,
      for (var element in _value)
        if (element != item) element
    ];
  }

  Type top() {
    return _value.elementAt(0);
  }

  void pop() {
    _value = _value.skip(1).toList();
  }

  Type operator[](int index) {
    return _value.elementAt(index);
  }

  void clear() {
    _value.clear();
  }

  @override
  bool any(bool Function(Type element) test) {
    return _value.any(test);
  }

  @override
  Iterable<R> cast<R>() {
    return _value.cast<R>();
  }

  @override
  bool contains(Object? element) {
    return _value.contains(element);
  }

  @override
  Type elementAt(int index) {
    return _value.elementAt(index);
  }

  @override
  bool every(bool Function(Type element) test) {
    return _value.every(test);
  }

  @override
  Iterable<T> expand<T>(Iterable<T> Function(Type element) toElements) {
    return _value.expand(toElements);
  }

  @override
  Type get first => _value.first;

  @override
  Type firstWhere(bool Function(Type element) test, {Type Function()? orElse}) {
    return _value.firstWhere(test, orElse: orElse);
  }

  @override
  T fold<T>(T initialValue, T Function(T previousValue, Type element) combine) {
    return _value.fold(initialValue, combine);
  }

  @override
  Iterable<Type> followedBy(Iterable<Type> other) {
    return _value.followedBy(other);
  }

  @override
  void forEach(void Function(Type element) action) {
    return _value.forEach(action);
  }

  @override
  bool get isEmpty => _value.isEmpty;

  @override
  bool get isNotEmpty => _value.isNotEmpty;

  @override
  Iterator<Type> get iterator => _value.iterator;

  @override
  String join([String separator = ""]) {
    return _value.join(separator);
  }

  @override
  Type get last => _value.last;

  @override
  Type lastWhere(bool Function(Type element) test, {Type Function()? orElse}) {
    return _value.lastWhere(test, orElse: orElse);
  }

  @override
  int get length => _value.length;

  @override
  Iterable<T> map<T>(T Function(Type e) toElement) {
    return _value.map(toElement);
  }

  @override
  Type reduce(Type Function(Type value, Type element) combine) {
    return _value.reduce(combine);
  }

  @override
  Type get single => _value.single;

  @override
  Type singleWhere(bool Function(Type element) test,
      {Type Function()? orElse}) {
    return _value.singleWhere(test, orElse: orElse);
  }

  @override
  Iterable<Type> skip(int count) {
    return _value.skip(count);
  }

  @override
  Iterable<Type> skipWhile(bool Function(Type value) test) {
    return _value.skipWhile(test);
  }

  @override
  Iterable<Type> take(int count) {
    return _value.take(count);
  }

  @override
  Iterable<Type> takeWhile(bool Function(Type value) test) {
    return _value.takeWhile(test);
  }

  @override
  List<Type> toList({bool growable = true}) {
    return _value.toList(growable: growable);
  }

  @override
  Set<Type> toSet() {
    return _value.toSet();
  }

  @override
  Iterable<Type> where(bool Function(Type element) test) {
    return _value.where(test);
  }

  @override
  Iterable<T> whereType<T>() {
    return _value.whereType<T>();
  }
}
