void main(List<String> args) {
  // 泛型的使用示例
  final person = Person<String>('Alice', '30');
  print('Name: ${person.name}, Age: ${person.age}');

  final intPerson = Person<int>('12345', 25);
  print('Name: ${intPerson.name}, Age: ${intPerson.age}');

  List<String> stringList = ['Hello', 'World'];
  List<int> intList = [1, 2, 3];
  print('First string: ${getValue(stringList)}');
  print('First int: ${getValue(intList)}');
}

class Person<T> {
  String name;
  T age;

  Person(this.name, this.age);
}

// 泛型方法
T getValue<T>(List<T> list) {
  return list[0];
}
