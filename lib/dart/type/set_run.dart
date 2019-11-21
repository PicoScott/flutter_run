void main(List<String> args) {
  var set1 = {'a', 'b', 'c', 'd', 'e'};
  print(set1);
  print(set1.runtimeType.toString());

  var set2 = <String>{};
  print(set2.runtimeType.toString());

  var set3 = <String>{};
  set3.add('a');
  set3.addAll(set1);
  assert(set3.length == 6);
}
