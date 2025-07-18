void main(List<String> args) {
  // 数字类型: int/double
  int integer = 42; // 整数
  int hexValue = 0x2A; // 十六进制整数
  print("Hex: $hexValue");

  double decimal = 3.14; // 浮点数
  print("Integer: $integer, Decimal: $decimal");

  // 字符串和数字之间的转化
  String numberString = '123';
  int numberFromString = int.parse(numberString); // 字符串转整数
  double doubleFromString = double.parse(numberString); // 字符串转浮点数
  print(
      "String to Int: $numberFromString, String to Double: $doubleFromString");

  String intToString = integer.toString(); // 整数转字符串
  String doubleToString = decimal.toString(); // 浮点数转字符串
  print("Int to String: $intToString, Double to String: $doubleToString");

  // 布尔类型
  bool isTrue = true; // 布尔值
  bool isFalse = false; // 布尔值
  print("Boolean values: $isTrue, $isFalse");

  // dart的判断语句中没有非空即真
  var isAdd = 'test';
  if (isAdd.isNotEmpty) {
    print("This is true");
  } else {
    print("This is false");
  }

  // 字符串定义方式
  String singleQuote = 'Hello, Dart!'; // 单引号字符串
  String doubleQuote = "Hello, Dart!"; // 双引号字符串
  String multiLine = '''This is a
  multi-line string.
  '''; // 多行字符串
  print(singleQuote);
  print(doubleQuote);
  print(multiLine);

  // 字符串拼接
  String firstName = 'John';
  String lastName = 'Doe';
  String fullName = '$firstName $lastName'; // 使用$符号拼接
  print("Full Name: $fullName"); // $跟变量可以直接拼接
  print("Full Name: ${fullName.runtimeType}"); // 表达式不能直接拼接, 需要用{}包裹
}
