import 'package:flutter/material.dart';
import 'package:flutter_demo/models/home_model.dart';
import 'package:flutter_demo/components/dashed_line.dart';

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
        getDetailWidget(),
        getDashedLineWidget(),
        iconWidget(),
      ],
    );
  }

  // 作者头像 Widget
  Widget avatarWidget() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.network(
          item.author.avatar,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ));
  }

  // 内容详情 Widget
  Widget getDetailWidget() {
    return Expanded(
      // Expanded: 占据剩余空间
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("文章: ${item.content.title}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            const SizedBox(height: 3),
            Text('作者: ${item.author.name}',
                style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  // 虚线组件 Widget
  Widget getDashedLineWidget() {
    return const SizedBox(
      width: 1,
      height: 60,
      child: DashedLine(
        axis: Axis.vertical,
        height: 5,
        count: 8,
        color: Color(0xffaaaaaa),
      ),
    );
  }

  // 搜索图标 Widget
  Widget iconWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: const Column(
        children: [Icon(Icons.search), Text('搜索')],
      ),
    );
  }

  // 底部文章标题显示区 Widget
  Widget getUserIdWidget() {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity, // 占满一行
      decoration: BoxDecoration(
        color: const Color(0xffeeeeee),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        item.content.title,
        style: const TextStyle(fontSize: 14, color: Colors.black54),
      ),
    );
  }
}
