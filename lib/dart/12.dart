void main(List<String> args) {
  // 使用Object类的示例
  final person = Person();
  print('Person instance: $person');

  // Object类的方法示例
  print('Person runtime type: ${person.runtimeType}');
  print('Person hash code: ${person.hashCode}');
  print('Person toString: ${person.toString()}');
}

// Dart中所有的类都隐式地继承自Object类
// 因此，所有的类都可以使用Object类的方法和属性
class Person {}
