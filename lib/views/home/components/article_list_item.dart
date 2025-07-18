import 'package:flutter/material.dart';
import 'package:flutter_demo/models/home_model.dart';

class ArticleListItem extends StatelessWidget {
  late ArticleItem item;

  ArticleListItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(item.content.title);
  }
}
