import 'package:flutter/material.dart';
import 'package:flutter_demo/components/unit_card.dart';
import 'package:flutter_demo/components/unit_indicator.dart';
import 'package:flutter_demo/components/partial_clipper.dart';

/// 卡片堆叠组件
///
/// 实现卡片堆叠效果和动画
class UnitCardStack extends StatefulWidget {
  const UnitCardStack({Key? key}) : super(key: key);

  @override
  _UnitCardStackState createState() => _UnitCardStackState();
}

class _UnitCardStackState extends State<UnitCardStack>
    with SingleTickerProviderStateMixin {
  // 卡片数据
  final List<Map<String, dynamic>> unitData = [
    {
      'title': 'Look at My Nose',
      'subtitle': '',
      'color': const Color(0xFFFFC3B0), // 粉色
      'unitNumber': 2,
      'totalPages': 8,
      'currentPage': 6,
    },
    {
      'title': 'We Love Animals',
      'subtitle': '',
      'color': const Color(0xFF9DDCDC), // 蓝色
      'unitNumber': 3,
      'totalPages': 8,
      'currentPage': 4,
    },
    {
      'title': 'Unit 4',
      'subtitle': '',
      'color': const Color(0xFFE8E4C9), // 浅黄色
      'unitNumber': 4,
      'totalPages': 8,
      'currentPage': 2,
    },
    {
      'title': 'Unit 5',
      'subtitle': '',
      'color': const Color(0xFFB5D8EB), // 浅蓝色
      'unitNumber': 5,
      'totalPages': 8,
      'currentPage': 0,
    },
    // 可以添加更多单元
  ];

  // 动画控制器
  late AnimationController _animationController;
  late Animation<double> _animation;

  // 当前索引和拖动进度
  int currentIndex = 0;
  double dragProgress = 0.0;
  bool isAnimating = false;

  // 容器高度和卡片高度
  final double containerHeight = 180;
  final double cardHeight = 160;

  @override
  void initState() {
    super.initState();

    // 初始化动画控制器
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    );

    _animationController.addListener(() {
      setState(() {
        dragProgress = _animation.value;
      });
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          // 动画完成后，更新当前索引并重置进度
          if (_animationController.value > 0) {
            // 向下滑动
            if (currentIndex > 0) {
              currentIndex--;
            }
          } else {
            // 向上滑动
            if (currentIndex < unitData.length - 3) {
              currentIndex++;
            }
          }

          dragProgress = 0.0;
          isAnimating = false;
          _animationController.reset();
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // 处理垂直滑动
  void _handleVerticalDrag(DragUpdateDetails details) {
    if (isAnimating) return;

    setState(() {
      // 计算拖动进度，限制在-1.0到1.0之间
      double dragDelta = details.delta.dy / containerHeight;
      dragProgress += dragDelta;
      dragProgress = dragProgress.clamp(-1.0, 1.0);
    });
  }

  // 处理拖动结束
  void _handleDragEnd(DragEndDetails details) {
    if (isAnimating) return;

    if (dragProgress > 0.3) {
      // 向下滑动超过阈值，显示上一张卡片
      if (currentIndex > 0) {
        isAnimating = true;
        _animationController.value = dragProgress;
        _animationController.animateTo(1.0);
      } else {
        // 已经是第一张，恢复原位
        _resetPosition();
      }
    } else if (dragProgress < -0.3) {
      // 向上滑动超过阈值，显示下一张卡片
      if (currentIndex < unitData.length - 3) {
        isAnimating = true;
        _animationController.value = -dragProgress;
        _animationController.animateTo(1.0);
      } else {
        // 已经是最后一张，恢复原位
        _resetPosition();
      }
    } else {
      // 未滑动超过阈值，恢复原位
      _resetPosition();
    }
  }

  // 重置位置
  void _resetPosition() {
    setState(() {
      isAnimating = true;
      _animationController.value = dragProgress.abs();
      _animationController.animateTo(0.0).then((_) {
        setState(() {
          dragProgress = 0.0;
          isAnimating = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 左侧指示器
        UnitIndicator(
          totalUnits: unitData.length,
          currentUnit: currentIndex,
        ),

        // 间距
        const SizedBox(width: 29),

        // 右侧卡片堆叠区域
        Expanded(
          child: GestureDetector(
            onVerticalDragUpdate: _handleVerticalDrag,
            onVerticalDragEnd: _handleDragEnd,
            child: SizedBox(
              height: containerHeight * 3, // 三个卡片的总高度
              child: Stack(
                children: List.generate(unitData.length, (index) {
                  // 计算相对位置
                  int relativeIndex = index - currentIndex;

                  // 计算卡片位置和变换
                  double topPosition;
                  double scale;
                  double rotation;
                  double opacity;

                  if (relativeIndex < 0) {
                    // 已经滚动过的卡片（不可见）
                    topPosition = -containerHeight;
                    scale = 0.8;
                    rotation = -0.1;
                    opacity = 0;
                  } else if (relativeIndex == 0) {
                    // 第一个可见卡片（顶部）
                    topPosition = 0 + dragProgress * containerHeight;
                    scale = 1.0 - dragProgress.abs() * 0.1;
                    rotation = -0.05 - dragProgress * 0.05;
                    opacity = 1.0 - dragProgress.abs() * 0.5;
                  } else if (relativeIndex == 1) {
                    // 第二个可见卡片（中间）
                    topPosition =
                        containerHeight * 0.9 + dragProgress * containerHeight;
                    scale = 0.95 + dragProgress * 0.05;
                    rotation = 0;
                    opacity = 1.0;
                  } else if (relativeIndex == 2) {
                    // 第三个可见卡片（底部，部分可见）
                    topPosition =
                        containerHeight * 1.8 + dragProgress * containerHeight;
                    scale = 0.9 + dragProgress * 0.05;
                    rotation = 0.05;
                    opacity = 1.0;
                  } else {
                    // 其他卡片（堆叠在底部容器后面，不可见）
                    topPosition = containerHeight * 2.5;
                    scale = 0.85;
                    rotation = 0.1;
                    opacity = relativeIndex == 3 ? 0.5 : 0;
                  }

                  // 如果卡片不在可见范围内，不渲染它
                  if (relativeIndex < 0 || relativeIndex > 3) {
                    return const SizedBox.shrink();
                  }

                  // 创建卡片变换
                  Widget card = RepaintBoundary(
                    child: Opacity(
                      opacity: opacity,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateZ(rotation)
                          ..scale(scale),
                        alignment: Alignment.topCenter,
                        child: UnitCard(
                          title: unitData[index]['title'],
                          subtitle: unitData[index]['subtitle'],
                          backgroundColor: unitData[index]['color'],
                          unitNumber: unitData[index]['unitNumber'],
                          totalPages: unitData[index]['totalPages'],
                          currentPage: unitData[index]['currentPage'],
                        ),
                      ),
                    ),
                  );

                  // 对底部卡片应用裁剪效果
                  if (relativeIndex == 2) {
                    // 计算可见比例（0.3-1.0之间）
                    double visibleFraction =
                        0.3 + (dragProgress < 0 ? -dragProgress : 0) * 0.7;
                    visibleFraction = visibleFraction.clamp(0.3, 1.0);

                    card = ClipPath(
                      clipper: PartialClipper(visibleFraction),
                      child: card,
                    );
                  }

                  return Positioned(
                    top: topPosition,
                    left: 0,
                    right: 0,
                    height: cardHeight,
                    child: card,
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
