import 'package:flutter/material.dart';
import 'package:flutter_demo/models/home_model.dart';
import 'package:flutter_demo/views/home/components/article_list_item.dart';

import '../../api/http_request.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('首页'),
        ),
        body: const HomeBody());
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<ArticleItem> articleList = [];

  @override
  void initState() {
    super.initState();
    HttpRequest.request(
            "https://api.juejin.cn/content_api/v1/content/article_rank?category_id=1&type=hot&count=50&from=0&aid=2608&uuid=7030358660171187744&spider=0")
        .then((res) {
      final list = res.data['data'];
      List<ArticleItem> articles = [];
      for (var sub in list) {
        articles.add(ArticleItem.fromMap(sub));
      }
      setState(() {
        articleList = articles;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 文章列表
        Center(
          child: ListView.builder(
              itemCount: articleList.length,
              itemBuilder: (BuildContext context, int index) {
                return ArticleListItem(articleList[index]);
              }),
        ),

        // 底部悬浮按钮区域
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: 170, // 区域高度为170像素
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.50, 0.00),
                end: Alignment(0.50, 0.17),
                colors: [Color(0x00F9F9EF), Color(0xFFF9F9EF)],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // 按钮点击事件
                    print('底部按钮被点击');
                  },
                  style: ElevatedButton.styleFrom(
                    // minimumSize: Size(200, 63), // 按钮宽度200，高度63像素
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(31.5), // 圆角效果
                    ),
                  ),
                  child: Text(
                    '开始学习',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
