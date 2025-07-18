import 'package:flutter/material.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('loose.li'),
        ),
        body: const HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: const <Widget>[
          ProductItem('Apple1', 'MacBook Pro',
              'https://img.beingfine.cn/Channel/i_10331310018_opt.png'),
          ProductItem('Apple2', 'iPhone 14 Pro',
              'https://img.beingfine.cn/Channel/i_10331310018_opt.png'),
          ProductItem('Apple3', 'iPad Pro',
              'https://img.beingfine.cn/Channel/i_10331310018_opt.png'),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imageUrl;

  const ProductItem(this.title, this.subTitle, this.imageUrl, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            subTitle,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 10),
          Image.network(imageUrl),
        ],
      ),
    );
  }
}
