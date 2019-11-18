void main(List<String> args) {
  var intValue = 10;
  print(intValue); // 10

  var abs = (-10).abs();
  assert(abs == 10);

  var modPow = intValue.modPow(2, 6); //返回 int 的 exponent 次幂并对 modulus 取余(`int^component%modulus`)
  assert(modPow == 4);

  var modInverse = intValue.modInverse(3); //返回 int 对 modulus 取余的相反数 (`-(int%modulus)`)
  print(modInverse);
//  assert(modInverse == -1);
}

