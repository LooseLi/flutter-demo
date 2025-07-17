import 'package:flutter/material.dart';

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
        body: ContentWidget(),
      ),
    );
  }
}

class ContentWidget extends StatefulWidget {
  ContentWidget() {
    print('ContentWidget的构造函数被调用');
  }

  @override
  State<StatefulWidget> createState() {
    print('ContentWidget的createState被调用');
    return ContentWidgetState();
  }
}

class ContentWidgetState extends State<ContentWidget> {
  int counter = 0;

  ContentWidgetState() {
    print('ContentWidgetState的构造函数被调用');
  }

  @override
  // 初始化操作，经常使用
  void initState() {
    super.initState();
    print('ContentWidgetState的initState被调用');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('ContentWidgetState的didChangeDependencies被调用');
  }

  @override
  // 父类状态发生改变时，才会调用该方法
  void didUpdateWidget(covariant ContentWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('ContentWidgetState的didUpdateWidget被调用');
  }

  @override
  Widget build(BuildContext context) {
    print('ContentWidgetState的build被调用');
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              child: const Text('+1')),
          Text('计数: $counter', style: const TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
