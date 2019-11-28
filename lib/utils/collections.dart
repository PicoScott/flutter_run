
bool equals(Object param1, Object param2) {
  if (param1 is List && param2 is List) {
    return _listEquals(param1, param2);
  } else if (param1 is Set && param2 is Set) {
    return _setEquals(param1, param2);
  } else if (param1 is Iterable && param2 is Iterable) {
    return _iterableEquals(param1, param2);
  } else if (param1 is Map && param2 is Map) {
    return _mapEquals(param1, param2);
  } else {
    return param1 == param2;
  }
}

bool _listEquals(List list1, List list2) {
  if (list1 == null && list2 == null) return true;
  if (list1 == null || list2 == null) return false;
  if (list1.length != list2.length) return false;
  for (var i = 0; i < list1.length; i++) {
    if (!equals(list1[i], list2[i])) return false;
  }
  return true;
}

bool _setEquals(Set set1, Set set2) {
  if (set1 == null && set2 == null) return true;
  if (set1 == null || set2 == null) return false;
  if (set1.length != set2.length) return false;
  var iterator = set1.iterator;
  while (iterator.moveNext()) {
    if (!set2.contains(iterator.current)) return false;
  }
  return true;
}

bool _iterableEquals(Iterable iterable1, Iterable iterable2) {
  // if (iterable1 == null && iterable2 == null) return true;
  // if (iterable1 == null || iterable2 == null) return false;
  // if (iterable1.length != iterable2.length) return false;
  // return _setEquals(iterable1.toSet(), iterable2.toSet());
  throw UnsupportedError("不支持 iterable 比较");
}

bool _mapEquals(Map map1, Map map2) {
  if (identical(map1, map2)) return true;
  if (map1 == null && map2 == null) return true;
  if (map1 == null || map2 == null) return false;
  if (map1.length != map2.length) return false;
  for (Object key in map1.keys) {
    if (!equals(map1[key], map2[key])) return false;
  }
  return true;
}

main(List<String> args) {
  // List
  assert(!equals([1, 2, 3], [2, 3, 4]));
  assert(equals([1, 2, 3], [1, 2, 3]));
  assert(!equals([1, 2, 3], [3, 2, 1]));
  assert(equals([1, 2, null], [1, 2, null]));

  // Set
  assert(equals({1, 2, 3}, {3, 2, 1}));
  assert(equals({1, 2, 3}, {1, 2, 3}));
  assert(!equals({1, 2, 3}, {1, 2, 3, 4}));
  assert(!equals({1, 2, 3, 4}, {1, 2, 3}));
  assert(equals({1, 2, null}, {1, 2, null}));

  // Map
  assert(equals({1: 1, 2: 2}, {1: 1, 2: 2}));
  assert(equals({1: 1, 2: 2}, {2: 2, 1: 1}));
  assert(!equals({1: 2, 2: 2}, {1: 1, 2: 2}));
  assert(equals({}, {}));
}
