void main(List<String> args) {
  //
  // 抽象类和抽象方法的使用示例
  final person = Person();
  person.name = 'Alice';
  final dog = Dog();
  eatFood(person); // 调用抽象类方法
  eatFood(dog); // 调用抽象类方法
}

// 抽象类
/// 特点一：抽象类不能被实例化
/// 特点二：抽象类可以包含抽象方法和非抽象方法
/// 抽象方法：只有方法的定义，没有方法的实现
// abstract class Person {
//   void eat(); // 抽象方法，没有方法体
// }

// 普通的类中不能定义抽象方法

abstract class Eating {
  getEating();
}

class Person extends Eating {
  String? name;

  @override
  getEating() {
    print("$name is eating food");
  }
}

class Dog extends Eating {
  @override
  getEating() {
    print("Dog is eating bone");
  }
}

void eatFood(Eating eat) {
  eat.getEating();
}
