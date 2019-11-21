import 'package:collection/collection.dart';

void main(List<String> args) {
  var list = [1, 2, 3];
  assert(list.runtimeType.toString() == "List<int>");

  var list2 = [1, 2, 3];
  var list3 = [0, ...list2]; // 扩展操作符 ... 将 list2 展开
  assert(list3.length == 4);
  assert(ListEquality().equals(list3, [0, 1, 2, 3]));

  var nullList;
  var list4 = [0, ...?nullList]; // null-aware 扩展操作符可以避免空指针异常
  assert(list4.length == 1);
  print(list4.runtimeType.toString());

  var ifTrue = true;
  var ifList = [1, 2, if (ifTrue) 3]; // 使用 collection if 创建集合， 该集合包含 3 或 4 个元素
  assert(ifList.length == 3);

  var forList1 = [1, 2, 3];
  var forList2 = [
    0,
    for (var i in forList1) i
  ]; // 使用 collection for 将集合中元素添加到另外一个集合中
  assert(forList2.length == 4);

  var filledList = List.filled(10, 1);
  assert(ListEquality().equals(filledList, [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]));
  assert(filledList.length == 10);

  var fromList = [1, 2, 3, 4];
  var toList = List.from(fromList); // 使用 fromList 生成一个新的 List， 两个 List 中元素相同
  assert(ListEquality().equals(fromList, toList));

  var generateList =
      List.generate(4, (index) => index * 2 + 1); // 根据给定的生成器生成 List
  assert(generateList.length == 4);
  assert(ListEquality().equals(generateList, [1, 3, 5, 7]));

  var unmodifiableList = List.unmodifiable(list); // 生成一个不可修改的 List
  assert(unmodifiableList.length == list.length);
  assert(unmodifiableList != list);
  assert(ListEquality().equals(unmodifiableList, list));
  // unmodifiableList.add(3); // List 不可修改: Unsupported operation: Cannot add to an unmodifiable list

  var castList = List.castFrom(list);
  var result = castList.cast<num>();
  print(result.runtimeType);
//  print(result);
//  print(castList.runtimeType.toString());
//  print(castList);

  var rangeList = List(2);
  List.copyRange(rangeList, 0, list, 0,
      2); // 从 list 的 [0, 2) 区间中拷贝之 rangeList（需保证 rangeList 有足够空间）
  assert(rangeList.length == 2);
  assert(ListEquality().equals(rangeList, [1, 2]));

  var expandList = List(list.length);
  List.writeIterable(expandList, 0,
      list); // 将 list 插入到 expandList 第 0 个位置之后（需保证 expandList 有足够空间）
  assert(expandList.length == 3);
  assert(ListEquality().equals(expandList, list));

  List<num> castTypeList = list.cast();
  print(castTypeList.runtimeType);

  var firstList = [1, 2, 3];
  firstList.first = 0; // 通过 first 设置 firstList 第一个元素值，相当于 firstList[0] = 0
  assert(firstList[0] == 0);

  var lastList = [1, 2, 3];
  lastList.last =
      0; // 通过 lastList.last 将 lastList 的最后一个值设置为 0，相当于 lastList[lastList.length - 1] = 0
  assert(lastList[lastList.length - 1] == 0);

  assert(list.length == 3); // 获取 list 的长度

  var setLengthList = [1, 2, 3];
  setLengthList.length = 5; // 将 setLengthList 的长度设置为 5，超过原长度的部分用 null 填充
  assert(setLengthList.length == 5);
  // TODO 包含 null 的两个 list 比较
//  assert(ListEquality().equals(expandList, [1, 2, 3, null, null]));
  setLengthList.length = 2; // 将 setLengthList 的长度设置为 2，移除尾部溢出元素
  // TODO 包含 null 的两个 list 比较
// assert(ListEquality().equals(expandList, [1, 2]));

  var addList = [1, 2, 3];
  addList.add(4); // 在 addList 尾部添加元素 4
  assert(ListEquality().equals(addList, [1, 2, 3, 4]));

  var addAllList = [...list];
  addAllList.addAll(list); // 将 list 添加到 addAllList 的尾部
  assert(ListEquality().equals(addAllList, [...list, ...list]));

  var reverseList = list.reversed;
  assert(IterableEquality().equals(reverseList, [3, 2, 1]));

  var unsortList = [2, 1, 3];
  unsortList.sort(); // 将 unsortList 按照给定比较方式(可选参数)排序
  assert(ListEquality().equals(unsortList, [1, 2, 3]));

  var unshuffleList = [1, 2, 3];
  unshuffleList.shuffle(); // 将 unshuffleList 洗牌(弄乱内部顺序)
//  print(unshuffleList);

  var indexOfOne = list.indexOf(1); // 返回 list 中索引为 0 的元素
  assert(indexOfOne == 0);

  // TODO 似乎输出的位置从 1 开始
  var firstWhereList = [1, 2, 3, 2];
//   根据给定的条件在 firstWhereList 查找第一个符合的位置，若查找失败返回 -1
//  var firstWhere = firstWhereList.firstWhere((element) {
//    print(element);
//    return element == 2;
//  });
//  print(firstWhere);
//  assert(firstWhere == 1);
//  var firstWhereNotFound = firstWhereList.firstWhere((element) => element == 5);
//  assert(firstWhereNotFound == -1);
//
  var clearList = [1];
  clearList.clear(); // 将 unclearList 中的元素全部移除
  assert(clearList.length == 0);

  var insertList = [1, 2, 3];
  insertList.insert(0, 0); // 在索引为 0 的位置插入元素 0
  assert(ListEquality().equals(insertList, [0, 1, 2, 3]));

  var insertAllList = [1, 2, 3];
  insertAllList.insertAll(0, [0, 1]); // 在索引位置为 0 的位置插入 list([0,1]) 所有元素
  assert(ListEquality().equals(insertAllList, [0, 1, 1, 2, 3]));

  var setAllList = [1, 2, 3];
  setAllList
      .setAll(0, [0, 1]); // 从 setAllList 中索引为 0 的元素起，以此将其元素替换为 List([0,1]) 中的元素
  assert(ListEquality().equals(setAllList, [0, 1, 3]));

  var removeList = ['a', 'b', 'c'];
  removeList.remove('a'); // 移除 removeList 中的 a
  assert(ListEquality().equals(removeList, ['b', 'c']));

  var removeAtList = ['a', 'b', 'c'];
  removeAtList.removeAt(0);
  assert(ListEquality().equals(removeAtList, ['b', 'c']));

  var removeLastList = [1, 2, 3];
  removeLastList.removeLast();
  assert(ListEquality().equals(removeLastList, [1, 2]));

  var removeWhereList = ['a', 'b', 'c', 'a'];
  removeWhereList.removeWhere(
      (element) => element == 'a'); // 移除 removeWhereList 中所有 'a' 元素
  assert(ListEquality().equals(removeWhereList, ['b', 'c']));

  var retainWhereList = ['a', 'b', 'c', 'a'];
  retainWhereList.retainWhere((element) => element == 'a');
  assert(ListEquality()
      .equals(retainWhereList, ['a', 'a'])); // 移除 retainWhereList 中非 'a' 元素

  var plusList = [1, 2, 3];
  var plusList2 =
      plusList + [2, 3]; // 将 plusList 连接 List([2,3]) 并生成一个新的 List 返回
  assert(plusList2 != plusList);
  assert(ListEquality().equals(plusList2, [1, 2, 3, 2, 3]));

  var subList = list.sublist(0, 1); // 返回一个新的 List 包含 list 中的 [0, 1) 元素
  assert(subList.length == 1);
  assert(ListEquality().equals(subList, [1]));

  var rangeIterable =
      list.getRange(0, 1); //返回一个新的 Iterable 包含 list 中的 [0, 1) 元素
  assert(rangeIterable.length == 1);
  assert(IterableEquality().equals(rangeIterable, [1]));

  var setRangeList = [0, 1, 2, 3, 4];
  // 将 iterable 中的元素（从第 skipCount 起）拷贝至 setRangeList 中的 [start,end) 对应位置
  setRangeList.setRange(
      /*start*/
      1,
      /*end*/ 3,
      /*iterable*/ [3, 2, 1],
      /*skipCount*/ 1);
  assert(ListEquality().equals(setRangeList, [0, 2, 1, 3, 4]));

  var removeRangeList = [0, 1, 2, 3];
  removeRangeList.removeRange(0, 2); // 将 removeRangeList 区间为[0,2)的元素移除
  assert(ListEquality().equals(removeRangeList, [2, 3]));

  var fillRangeList = [0, 1, 2, 3, 4];
  fillRangeList.fillRange(0, 2, 0); // 将 fillRangeList 区间 [0,2) 的元素填充为 0
  assert(ListEquality().equals(fillRangeList, [0, 0, 2, 3, 4]));

  var replaceRangeList = [1, 2, 3, 4];
  replaceRangeList.replaceRange(
      0, 2, [0, 1]); // 替换 replaceRangeList 中区间在 [0,2) 之间的元素为 List([0,1])

  var asMapList = ['a', 'b', 'c'];
  var asMap =
      asMapList.asMap(); // 将 asMapList 转为 Map，对应的 key 为元素在 asMapList 中的索引
  assert(MapEquality().equals(asMap, {0: 'a', 1: 'b', 2: 'c'}));

  test(removeRangeList);
}

void test(List<num> list) => print(list);
