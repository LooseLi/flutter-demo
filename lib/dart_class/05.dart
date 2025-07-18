void main(List<String> args) {
  // 运算符
  // 除法
  var a = 10;
  print("除法: ${a / 3}");
  // 整除
  print("整除: ${a ~/ 3}");
  // 取模运算
  print("取模: ${a % 3}");

  // 特殊运算符??=
  var b = null;
  b ??= 5; // 如果b为null, 则赋值为5
  print("赋值??=: $b");

  // 特殊运算符??: 如果左侧为null, 则返回右侧
  var c = null;
  var d = c ?? 10; // 如果c为null, 则d为10
  print("??: $d");
}
