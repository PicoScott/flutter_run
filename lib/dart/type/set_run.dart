import 'package:flutter_run/utils/collections.dart';

void main(List<String> args) {
  var set1 = {'a', 'b', 'c', 'd', 'e'};
  print(set1);
  print(set1.runtimeType.toString());

  var set2 = <String>{};
  print(set2.runtimeType.toString());

  // 从 Iterable 中生成一个新的 Set
  var fromSet = Set.from(set1);
  assert(equals(fromSet, set1));

  var ofSet = Set.of(set1);
  // 从 Iterable 中生成一个新的 Set
  assert(equals(set1, ofSet));

  // 判断 set 中是否包含 a
  var contains = set1.contains('a');
  assert(contains);

  var addSet = {'a', 'b', 'c'};
  // 将元素 d 天加至 addSet 中， 成功添加后返回 true， 失败返回 false
  var add = addSet.add('d');
  assert(add);
  assert(equals(addSet, {'a', 'b', 'c', 'd'}));

  var addAllSet = {'a', 'b', 'c'};
  // 将所有元素添加值 addAllSet 中
  addAllSet.addAll({'d', 'e'});
  assert(equals(addAllSet, {'a', 'b', 'c', 'd', 'e'}));

  var removeSet = {'a', 'b', 'c'};
  // 从 removeSet 移除元素 a， 若成功返回 true， 失败返回 false
  var remove = removeSet.remove('a');
  assert(remove);
  assert(equals(removeSet, {'b', 'c'}));

  var lookupSet = {'a', 'b', 'c'};
  // 查看对应元素是否存在，存在返回对应元素，否则返回 null
  var lookup1 = lookupSet.lookup('a');
  assert(lookup1 == 'a');
  var lookup2 = lookupSet.lookup('d');
  assert(lookup2 == null);

  var removeAllSet = {1, 2, 3, 4};
  // 移除 removeAllSet 与传入的 Iterable 交集部分
  removeAllSet.removeAll([1, 2, 3]);
  assert(equals(removeAllSet, {4}));

  var retainAllSet = {1, 2, 3, 4};
  // 保留 retainAllSet 与传入的 Iterable 交集部分
  retainAllSet.retainAll({1, 2, 3});
  assert(equals(retainAllSet, {1, 2, 3}));

  var removeWhereSet = {1, 2, 3, 4};
  // 移除符合条件的元素
  removeWhereSet.removeWhere((element) => element.isEven);
  assert(equals(removeWhereSet, {1, 3}));

  var retainWhereSet = {1, 2, 3, 4};
  // 保留符合条件的元素
  retainWhereSet.retainWhere((element) => element.isEven);
  assert(equals(retainWhereSet, {2, 4}));

  var containsAllSet = {1, 2, 3, 4};
  // 判断 containsAllSet 中是否包含给定的 Iterable 中的所有元素
  var containAll = containsAllSet.containsAll({1, 2, 3});
  assert(containAll);

  var set4 = {1, 2, 3};
  var set5 = {2, 3, 4};
  // 返回 set4 与 sest5 中的交集
  var intersectionSet = set4.intersection(set5);
  assert(equals(intersectionSet, {2, 3}));

  var unionSet = set4.union(set5);
  // 返回 set4 与 set5 的并集
  assert(equals(unionSet, {1, 2, 3, 4}));

  var differenceSet = set4.difference(set5);
  // 返回 set4 与 set5 的差集
  assert(equals(differenceSet, {1}));

  var clearSet = {1, 2, 3};
  // 清除 clearSet 中的所有元素
  clearSet.clear();
  print(clearSet.length.toString() + " ------ " + clearSet.toString());
  assert(clearSet.length == 0);
  assert(equals(clearSet, Set()));
}
