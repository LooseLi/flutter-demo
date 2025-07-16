import 'package:flutter/material.dart';

// 1.创建 main 函数
// 2.在 main 函数中调用 runApp 函数

// void main() {
//   runApp(MyApp());
// }

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('导航栏标题'),
        ),
        body: const ContentWidget(),
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Hello Flutter',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 24,
          color: Colors.red,
        ),
      ),
    );
  }
}
