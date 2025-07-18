import 'package:flutter/material.dart';
import 'package:flutter_demo/models/home_model.dart';

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
    return Center(
      child: ListView.builder(
          itemCount: articleList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Image.network(articleList[index].author.avatar),
              title: Text(articleList[index].content.title),
            );
          }),
    );
  }
}
