main(List<String> args) {
  finalAndConst();
}

void declareVariable() {
//   var a = "123";
//   a = 123; // 无法编译，A value of type 'int' can't be assigned to a variable of type 'String'

//   String a = "123";
//   a = 123;  // 无法编译， A value of type 'int' can't be assigned to a variable of type 'String'

  dynamic a = "123";
  a = 123; // 正常运行

  print(a);
}

void varivalbeDefaultValue() {
  //Dart 中一切皆为对象, 所有类型的默认值均为 null
  int intValue;
  assert(intValue == null);
  String stringValue;
  assert(stringValue == null);
  bool boolValue;
  assert(boolValue == null);
}


void finalAndConst() {
  // final finalValue = 1;
  // finalValue = 2; // final 变量只能赋值一次   Error: Setter not found: 'intValue'
  // assert(finalValue == 2)

  // const constValue = 1;
  // constValue = 2; // 常量不可修改   Error: Setter not found: 'constValue'
  // assert(constValue == 1);

  // var array =[1, 2, 3];
  // array.add(4);
  // assert(array == [1, 2, 3, 4]);

  // const array1 = [1,2,3];
  // array1.add(4); // 常量不可修改。const Unsupported operation: Cannot add to an unmodifiable list
  // assert(array1 == [1,2,3,4]);

  // var array2 = const [1,2,3];
  // array2.add(4);// 常量值不可修改。const Unsupported operation: Cannot add to an unmodifiable list
  // array2 = [1,2,3,4]; // array2 没有使用 final 或 const 修饰， 可以改变
  // assert(array2 == [1,2,3,4]);

  const array3 = [[1,2],[3,4]];
  array3[0].add(3);// Const 变量具有传递性。 Cannot add to an unmodifiable list
  assert( array3 == [[1,2,3], [3,4]]);
}

class Point{
  static const a = 1; //修饰成员变量时，需在必须与 `static` 一起使用
  // const b = 2; //Error: Only static fields can be declared as const
  // var x;
  // var y;
  // Point(int x, int y){
  //   this. x= x;
  //   this.y = y;
  // }
}