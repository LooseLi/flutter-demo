void main(List<String> args) {
  // 类的继承
  // final person = Person();
  // person.name = 'Alice';
  // person.age = 30;
  // person.eating();

  final person = Person('Bob', 25);
  person.eating(); // 调用父类方法
  print(person); // 打印Person对象
}

class Animal {
  int? age;

  Animal(this.age);

  void eating() {
    print("正在吃东西");
  }
}

class Person extends Animal {
  String? name;

  Person(this.name, int age) : super(age);

  @override
  void eating() {
    print("$name正在吃饭");
  }

  @override
  String toString() {
    return "Person(name: $name, age: $age)";
  }
}
