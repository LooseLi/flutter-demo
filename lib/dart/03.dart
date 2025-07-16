void main(List<String> args) {
  // 集合
  // List类型
  List<String> fruits = ['Apple', 'Banana', 'Cherry']; // 列表
  // Set类型
  Set<int> numbers = {1, 2, 3, 4}; // 集合
  // Map类型
  Map<String, dynamic> ages = {'Alice': 30, 'Bob': 25}; // 映射(键值对)
  print("Fruits: $fruits");
  print("Numbers: $numbers");
  print("Ages: $ages");

  // 集合的常用操作
  fruits.add('Date'); // 添加元素
  numbers.remove(2); // 移除元素
  ages['Charlie'] = 28; // 添加键值对
  print("Updated Fruits: $fruits");
  print("Updated Numbers: $numbers");
  print("Updated Ages: $ages");
}
