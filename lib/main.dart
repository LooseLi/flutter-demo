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
        // body: const ContentWidget(),
        body: const UserInfoWidget(),
      ),
    );
  }
}

// Widget TextField 输入框
class UserInfoWidget extends StatefulWidget {
  const UserInfoWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return UserInfoWidgetState();
  }
}

class UserInfoWidgetState extends State<UserInfoWidget> {
  final textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    textEditingController.text = '默认值';
    textEditingController.addListener(() {
      print('监听事件: ${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
                icon: Icon(Icons.people),
                labelText: 'username',
                hintText: '请输入用户名',
                border: OutlineInputBorder(borderSide: BorderSide(width: 3))),
            onChanged: (value) {
              print('当前值：$value');
            },
            onSubmitted: (value) {
              print('当前值：$value'); // 手机键盘按下完成done键触发
            },
            controller: textEditingController, // 监听事件
          )
        ],
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
    // return const ButtonDemo();
    // return const ImageNetworkDemo();
    // return const ImageAssetDemo();
    // return const ImageClipOvalDemo();
    return const ImageClipRRectDemo();
  }
}

// Widget ClipRRect 圆角图片
class ImageClipRRectDemo extends StatelessWidget {
  const ImageClipRRectDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12), // 圆角大小
        child: Image.network(
          'https://img.beingfine.cn/Channel/i_16335410014_opt.jpg',
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}

// Widget ClipOval 圆形图片(圆形头像)
class ImageClipOvalDemo extends StatelessWidget {
  const ImageClipOvalDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        'https://img.beingfine.cn/Channel/i_16335410014_opt.jpg',
        width: 100,
        height: 100,
      ),
    );
  }
}

// Widget Image.asset
class ImageAssetDemo extends StatelessWidget {
  const ImageAssetDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/header.jpg',
      // fit: BoxFit.cover, // Image的填充模式
      // repeat: ImageRepeat.repeatY, // Image重复
    );
  }
}

// Widget Image.network
class ImageNetworkDemo extends StatelessWidget {
  const ImageNetworkDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
        child: Image.network(
          'https://img.beingfine.cn/Channel/i_10331310018_opt.png',
          fit: BoxFit.cover, // Image的填充模式
          // repeat: ImageRepeat.repeatY, // Image重复
        ),
      ),
    );
  }
}

// Widget Button
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
