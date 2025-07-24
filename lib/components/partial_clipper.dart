import 'package:flutter/material.dart';

/// 部分可见裁剪器
///
/// 用于控制底部卡片的可见部分，实现"慢慢显示全"的效果
class PartialClipper extends CustomClipper<Path> {
  final double visibleFraction; // 0.0到1.0，表示可见部分的比例

  PartialClipper(this.visibleFraction);

  @override
  Path getClip(Size size) {
    return Path()
      ..addRect(Rect.fromLTRB(0, 0, size.width, size.height * visibleFraction));
  }

  @override
  bool shouldReclip(PartialClipper oldClipper) =>
      visibleFraction != oldClipper.visibleFraction;
}
