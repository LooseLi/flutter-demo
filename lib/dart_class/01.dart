void main(List<String> args) {
  /**
   * Dart是强类型的语言: 变量有自己的类型
   */
  // 1.显式声明(指定类型)
  String name = 'Flutter';
  int age = 3;
  double height = 1.75;
  bool isAwesome = true;
  print("$name $age $height $isAwesome");
  print(name.runtimeType); // 打印变量类型

  // 2.隐式声明(类型推断)
  var city = 'Beijing';
  print(city);
  print(city.runtimeType);

  // var/const/final的区别
  // var: 变量声明, 可以修改
  var score = 100; // 可修改
  score = 95; // 修改变量
  print(score);
  // const: 常量声明, 编译时常量, 不可修改
  const pi = 3.14; // 编译时常量
  print(pi);
  // final: 运行时常量, 不可修改
  final currentYear = DateTime.now().year; // 运行时常量
  print(currentYear);

  // 3.动态类型
  dynamic dynamicVar = 'Hello'; // 动态类型, 可以是任意类型
  dynamicVar = 42; // 可以修改为其他类型
  print(dynamicVar);
}
