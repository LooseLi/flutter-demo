void main(List<String> args) {
  // 函数

  print("Sum: ${add(3, 5)}"); // 调用函数并打印

  multiply(4); // 调用函数, 使用默认值
  multiply(4, 2); // 调用函数, 使用自定义值

  divide("Hello");
  divide("Hello", b: 50); // 调用函数, 使用命名参数
  divide("Hello", b: 50, c: "World"); // 调用函数, 使用命名参数

  higherOrderFunction(anotherFunction); // 将函数作为参数传递

  Function func = test(); // 获取函数
  func(); // 调用返回的函数

  fun(); // 调用匿名函数示例
}

/// 函数定义格式:
/// 返回值 函数的名称(参数列表) {
///   函数体
///   return 返回值; // 可选
/// }
///

/// 函数的参数
/// 必传参数和可选参数
/// 可选参数可以有默认值
/// 可选参数:
///   1.位置可选参数: 使用[]包裹
///   2.命名可选参数: 使用{}包裹
///   3.可变参数: 使用...包裹

int add(int a, int b) {
  return a + b; // 返回两个整数的和
}

/// 位置可选参数
void multiply(int a, [dynamic b, int c = 1]) {
  print("位置可选参数: $a and $b and $c");
}

/// 命名可选参数
void divide(String a, {int b = 100, dynamic c}) {
  print("命名可选参数: $a and $b and $c");
}

/// 函数是一等公民
/// 可以作为参数传递给其他函数
/// 可以作为返回值返回
void higherOrderFunction(Function func) {
  func(); // 调用传入的函数
}

Function test() {
  return anotherFunction; // 返回一个函数
}

void anotherFunction() {
  print("函数是一等公民");
}

/// 匿名函数
void fun() {
  var list = [1, 2, 3, 4, 5];

  // 使用匿名函数打印列表中的每个元素
  list.forEach((element) {
    print("Element: $element");
  });

  // 使用箭头函数简化匿名函数
  list.forEach((element) => print("Arrow Element: $element"));
}
