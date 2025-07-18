// 虚线组件
import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  final Axis axis; // 方向(水平/垂直)
  final double width; // 宽
  final double height; // 高
  final int count; // 数量
  final Color color; // 颜色

  const DashedLine({
    this.axis = Axis.horizontal,
    this.width = 1,
    this.height = 1,
    this.count = 1,
    this.color = const Color(0xff888888),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count, (int index) {
        return Container(
          width: width,
          height: height,
          color: color,
        );
      }),
    );
  }
}
