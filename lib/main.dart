import 'package:flutter/material.dart';

// Text组件
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
    // return const TextDemo();
    // return const TextRichDemo();
    return const ButtonDemo();
  }
}

// Widget Text
class ButtonDemo extends StatelessWidget {
  const ButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () => print('ElevatedButton'),
            child: const Text('ElevatedButton')),
        OutlinedButton(
            onPressed: () => print('OutlinedButton'),
            child: const Text('OutlinedButton')),
        IconButton(
            onPressed: () => print('IconButton'), icon: const Icon(Icons.add)),
        FloatingActionButton(
            onPressed: () => print('FloatingActionButton'),
            child: const Text('FloatingActionButton')),
      ],
    );
  }
}

// Widget Text
class TextDemo extends StatelessWidget {
  const TextDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '这是一段很长的文本文案，请你看完;这是一段很长的文本文案，请你看完;这是一段很长的文本文案，请你看完;这是一段很长的文本文案，请你看完',
      style: TextStyle(fontSize: 20, color: Color(0xFFDE7953)),
      textAlign: TextAlign.center, // 文本对齐方式
      maxLines: 1, // 最大显示行数
      overflow: TextOverflow.ellipsis, // 超出部分显示方式
    );
  }
}

// Widget Text.rich
class TextRichDemo extends StatelessWidget {
  const TextRichDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(children: [
        TextSpan(
          text: '《三体》',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        TextSpan(
            text: '刘慈欣',
            style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
        TextSpan(
            text: '\n主要内容主要内容主要内容主要内容主要内容主要内容\n主要内容主要内容主要内容主要内容主要内容',
            style: TextStyle(fontSize: 24, color: Colors.brown))
      ]),
      textAlign: TextAlign.center,
    );
  }
}
