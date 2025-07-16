void main(List<String> args) {
  // 类的定义
  /// class 类名 {
  ///   类型 成员名:
  ///   返回值类型 方法名 (参数列表) {
  ///     方法体
  ///   }
  /// }
  final person = Person(); // 创建Person类的实例
  person.name = 'Alice'; // 设置属性
  person.age = 30; // 设置属性
  person.introduce(); // 调用方法

  Map<String, dynamic> info = {
    'name': 'Bob',
    'age': 25,
  };
  // final person2 = Person.fromMap(info); // 使用命名构造函数创建实例
  // person2.introduce(); // 调用方法
}

class Person {
  // 属性
  String name;
  int age;

  // 构造函数
  Person({this.name = '', this.age = 0});

  // 命名构造函数
  // Person.fromMap(Map<String, dynamic> map) {
  //   this.name = map['name'];
  //   this.age = map['age'];
  // }

  // 方法
  void introduce() {
    print("My name is $name and I am $age years old.");
  }
}
