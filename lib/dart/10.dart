void main(List<String> args) {
  // mixin的使用示例
  final person = Person();
  person.name = 'Alice';
  person.getEating(); // 调用mixin方法
  print(person); // 打印Person对象
}

// mixin
mixin Eating {
  void getEating() {
    print("Eating food");
  }
}

class Person with Eating {
  String? name;

  @override
  String toString() {
    return "Person(name: $name)";
  }
}
