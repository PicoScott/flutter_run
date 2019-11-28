import 'package:flutter_run/utils/collections.dart';

void main(List<String> args) {
  var map = {
    // 键:    值
    "a": 1,
    "b": 2,
  };
  print(map.runtimeType);

// 1. 创建方法
  // 根据给定的 Map 生成一个新的 map
  var fromMap = Map<String, int>.from(map);
  assert(equals(fromMap, map));

  // 根据给定的 Map 生成一个新的 map，若类型与预期类型不符会产生一个编译期错误
  var ofMap = Map.of(map);
  // var ofMap = Map<int, int>.of(map); //类型与预期类型不符产生一个编译期错误
  assert(equals(ofMap, map));

  var fromIterable = [1, 2, 3];
  // 根据给定的 Iterable 对象生成 Map，map 的 key 与 value 通过传入的 Function 生成
  var fromIterableMap = Map.fromIterable(fromIterable,
      key: (element) => element, value: (element) => element * 2);
  assert(equals(fromIterableMap, {1: 2, 2: 4, 3: 6}));

  var keyFromIterable = [1, 2, 3];
  var valueFromIterable = [2, 3, 4];
  // 根据给定的 keyFromIterable 与 valueFromIterable 一一对应生成一个 Map，若 List 从存在重复元素以最后一个为准
  var fromIterablesMap = Map.fromIterables(keyFromIterable, valueFromIterable);
  assert(equals(fromIterablesMap, {1: 2, 2: 3, 3: 4}));

  var entries = [MapEntry(1, 2), MapEntry(2, 3)];
  // 从 Iterable MapEntry 生成 Map
  var fromEntriesMap = Map.fromEntries(entries);
  assert(equals(fromEntriesMap, {1: 2, 2: 3}));

  // 是否包含制定 value
  var containsValue = map.containsValue(1);
  assert(containsValue);

  // 是否包含指定 key
  var containsKey = map.containsKey("a");
  assert(containsKey);

  var mapMap = {1: 1, 2: 2};
  // 将原有的 MapEntry 通过 Fuction 变换为新的 Map
  mapMap = mapMap.map((key, value) => MapEntry(key, key * 2));
  assert(equals(mapMap, {1: 2, 2: 4}));

  var addEntriesMap = {1: 1, 2: 2};
  // 将 Iterable<MapEntry> 添加至 addEntriesMap 中
  addEntriesMap.addEntries([MapEntry(3, 3), MapEntry(4, 4)]);
  assert(equals(addEntriesMap, {1: 1, 2: 2, 3: 3, 4: 4}));

  var updateMap = {1: 1, 2: 2};
  // 更新给定 key 的值
  updateMap.update(
    1,
    (value) => value * 2,
  );
  assert(equals(updateMap, {1: 2, 2: 2}));

  var updateAllMap = {1: 1, 2: 2};
  // 更新 Map 所有值
  updateAllMap.updateAll((key, value) => key * 2);
  assert(equals(updateAllMap, {1: 2, 2: 4}));

  var removeWhereMap = {1: 1, 2: 2, 3: 3};
  // 移除所有 key 为偶数的 Entry
  removeWhereMap.removeWhere((key, value) => key.isEven);
  assert(equals(removeWhereMap, {1: 1, 3: 3}));

  var putIfAbsentMap = {1: 1, 2: 2};
  // 如果不存在 3 则添加 MapEntry(3,3)
  putIfAbsentMap.putIfAbsent(3, () => 3);
  assert(equals(putIfAbsentMap, {1: 1, 2: 2, 3: 3}));

  var addAllMap = {1: 1, 2: 2};
  // 将 Map 添加到原有 Map 中，若存在相同 key 则覆盖之
  addAllMap.addAll({2: 3, 3: 3});
  assert(equals(addAllMap, {1: 1, 2: 3, 3: 3}));

  var removeMap = {1: 1, 2: 2};
  // 移除 1 对应的 value，并返回 value
  var removeValue = removeMap.remove(1);
  assert(equals(removeMap, {2: 2}));
  assert(removeValue == 1);

  var clearMap = {1: 1};
  clearMap.clear();
  assert(equals(clearMap, {}));

  var iterableMap = {1: 2, 2: 4, 3: 6};
  var keys = iterableMap.keys;
  assert(equals(keys, {1, 2, 3}));
  var values = iterableMap.values;
  assert(equals(values, [2, 4, 6]));

  // 获取 Map 长度
  assert(map.length == 2);

  // 判断 Map 是否有元素
  var isEmpty = map.isEmpty;
  assert(!isEmpty);

  // 判断 Map 是否不为空
  var isNotEmpty = map.isNotEmpty;
  assert(isNotEmpty);
}
