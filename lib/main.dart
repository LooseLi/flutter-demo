import 'package:flutter/material.dart';

// 1.创建 main 函数
// 2.在 main 函数中调用 runApp 函数

void main() {
  runApp(const Center(
    child: Text(
      'Hello Flutter',
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontSize: 24,
        color: Colors.white,
      ),
    ),
  ));
}
