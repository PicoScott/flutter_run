import 'dart:math';

void main(List<String> args) {
  var i1 = 10;
  assert("int" == i1.runtimeType.toString());

  int i2 = 10;
  assert("int" == i2.runtimeType.toString());

  var i3 = 0xaf;
  assert("int" == i3.runtimeType.toString());
  assert(i3 == 175.0);

  var modPow = 10.modPow(
      2, 6); //返回 int 的 exponent 次幂并对 modulus 取余(`int^component%modulus`)
  assert(modPow == 4);

  var modInverse = 10.modInverse(3); //返回 int 对 modulus 乘法逆元
  assert(modInverse == 1);

  var gcd = 10.gcd(4); //最大公约数
  assert(gcd == 2);

  var even = 2.isEven; // 是否为偶数
  assert(even == true);

  var odd = 9.isOdd; // 是否为奇数
  assert(odd == true);

  var bitLength1 = 3.bitLength; //最少需要几位存储这个整数  000000011 => 2
  assert(bitLength1 == 2);

  var bitLength2 = (-2).bitLength; //11111110 => 1
  assert(bitLength2 == 1);

  var unsinged = (-1).toUnsigned(5); // 转为无符号整数，参数为位宽 11111111  ->  00011111
  assert(unsinged == 31);

  var signed = 239.toSigned(5); // 转化为有符号整数， 11101111 -> 00001111
  assert(signed == 15);

  var abs = (-2).abs(); // 绝对值 => x < 0 ? -x : x
  assert(abs == 2);

  var sign = (-10).sign; // 获取整数的符号，整数返回 1， 负数返回 -1
  assert(sign == -1);

  var string = 10.toString(); // int 的字符串, 此处为 10 的字符串
  assert(string == "10");

  var hex = 100
      .toRadixString(16); // 参数m (2<=m<=36), 返回 int 的 m 进制下的字符串， 此处为 100 的 16 进制
  assert(hex == "64");

  var parse = int.parse("111", radix: 10); // 将参数转化为整数, radix 为进制
  assert(parse == 111);
}
