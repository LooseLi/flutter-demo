import 'package:flutter/material.dart';

import 'views/home/home.dart';
import 'views/person/person.dart';
import 'components/tabbar_item.dart';
import 'views/category/category.dart';

// 豆瓣项目demo

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '豆瓣app',
      theme: ThemeData(
          primaryColor: Colors.green,
          highlightColor: Colors.transparent, // 高亮效果
          splashColor: Colors.transparent), // 水波纹效果
      home: const Scaffold(
        body: MyStackPage(),
      ),
    );
  }
}

class MyStackPage extends StatefulWidget {
  const MyStackPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyStackPageState();
  }
}

class MyStackPageState extends State<MyStackPage> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 14, // 选中字体大小
        unselectedFontSize: 14, // 未选中字体大小
        type: BottomNavigationBarType.fixed, // 固定展示
        items: [
          TabBarItem(const Icon(Icons.home), '首页'),
          TabBarItem(const Icon(Icons.category), '分类'),
          TabBarItem(const Icon(Icons.person), '我的'),
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ), // 底部导航栏
      body: IndexedStack(
        index: _currentIndex,
        children: const <Widget>[
          Home(),
          Category(),
          Person(),
        ],
      ),
    );
  }
}
