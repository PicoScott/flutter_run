void main(List<String> args) {
  double d1 = 1;
  assert("double" == d1.runtimeType.toString());

  var d2 = 1.0;
  assert("double" == d2.runtimeType.toString());

  var d3 = 1.12e10;
  assert("double" == d3.runtimeType.toString());
  assert(d3 == 11200000000.0);


  var abs = (-10.0).abs(); // double 的绝对值
  assert(abs == 10.0);

  var sign = -10.0.sign; // double 的符号，正数返回 1.0，负数返回 -1.0
  assert(sign == -1.0);

  var round = (5.4).round(); // 四舍五入后的整数
  assert(round == 5.0);

  var floor = (5.4).floor(); // 向下取整
  assert(floor == 5);

  var ceil = (5.4).ceil(); // 向上取整
  assert(ceil == 6);

  var truncate = 5.4.truncate(); // 舍弃小数后的整数
  assert(truncate == 5.0);

  var roundToDouble = 5.4.roundToDouble(); // 四舍五入后整数的浮点值
  assert(roundToDouble == 5.0);

  var floorToDouble = 5.4.floorToDouble(); // 向下取整后的浮点值
  assert(floorToDouble == 5.0);

  var ceilToDouble = 5.4.ceilToDouble(); // 向上取整后的浮点值
  assert(ceilToDouble == 6.0);

  var truncateToDouble = 5.4.truncateToDouble(); // 舍弃小数后整数的浮点值
  assert(truncateToDouble == 5.0);

  var string = 10.0.toString(); // 将 double 转化为字符串
  assert(string == "10.0");

  var parse = double.parse("10.0"); // 尝试将字符串转化为 double，若转换失败则返回 null
  assert(parse == 10.0);
}
