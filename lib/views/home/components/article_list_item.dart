import 'package:flutter/material.dart';
import 'package:flutter_demo/models/home_model.dart';

class ArticleListItem extends StatelessWidget {
  late ArticleItem item;

  ArticleListItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 10, color: Color(0xffe2e2e2)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getRankWidget(),
          const SizedBox(height: 12),
          getContentWidget(),
          const SizedBox(height: 12),
          getUserIdWidget(),
        ],
      ),
    );
  }

  // 索引 Widget
  Widget getRankWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
      // color: Color.fromARGB(255, 238, 205, 144), // 当decoration存在时，color必须移到decoration中，否则会报错
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 238, 205, 144),
          borderRadius: BorderRadius.circular(3)),
      child: Text(
        "No.${item.rank}",
        style: const TextStyle(
            fontSize: 14, color: Color.fromARGB(255, 131, 95, 36)),
      ),
    );
  }

  // 内容展示 Widget
  Widget getContentWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // 交叉轴
      children: [
        avatarWidget(),
        Expanded(
          // 占据剩余空间
          child: Text('2'),
        ),
        Text('3'),
        iconWidget(),
      ],
    );
  }

  // 头像 Widget
  Widget avatarWidget() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.network(item.author.avatar, width: 60));
  }

  Widget iconWidget() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 4, 10, 0),
      child: const Column(
        children: [Icon(Icons.search), Text('搜索')],
      ),
    );
  }

  // user_id Widget
  Widget getUserIdWidget() {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity, // 占满一行
      decoration: BoxDecoration(
        color: const Color(0xffeeeeee),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        item.author.userId,
        style: const TextStyle(fontSize: 14, color: Colors.black54),
      ),
    );
  }
}
