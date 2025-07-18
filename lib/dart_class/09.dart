void main(List<String> args) {
  final person = Person();
  person.name = 'Alice';
  person.getEating();
}

// 隐式接口 implements: 所有方法必须被重写
class Eating {
  void getEating() {
    print("Eating food");
  }
}

class Person implements Eating {
  String? name;

  @override
  void getEating() {
    print("$name is eating food");
  }
}
