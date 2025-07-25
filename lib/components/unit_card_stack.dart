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
  int _targetIndex = 0; // 动画目标索引

  // 滑动手势跟踪变量
  double _dragStartY = 0.0;
  double _currentDragY = 0.0;

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

    // 使用平滑的加减速曲线
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    // 动画进度监听
    _animationController.addListener(() {
      setState(() {
        // 更新动画进度，用于卡片位置计算
        dragProgress =
            _targetIndex > currentIndex ? -_animation.value : _animation.value;
      });
    });

    // 动画状态监听
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          // 动画完成后，更新当前索引
          currentIndex = _targetIndex;

          // 重置状态
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

  // 启动卡片切换动画
  void _startAnimation(int targetIndex) {
    if (targetIndex < 0 || targetIndex >= unitData.length || isAnimating) {
      return;
    }

    setState(() {
      isAnimating = true;
      _targetIndex = targetIndex;

      // 重置并启动动画
      _animationController.reset();
      _animationController.forward();

      print('Starting animation from $currentIndex to $_targetIndex');
    });
  }

  // 处理垂直滑动开始
  void _handleDragStart(DragStartDetails details) {
    // 记录起始位置，用于判断滑动方向
    if (isAnimating) return;
    _dragStartY = details.globalPosition.dy;
  }

  // 处理垂直滑动
  void _handleVerticalDrag(DragUpdateDetails details) {
    if (isAnimating) return;

    // 只记录滑动方向，不更新UI
    _currentDragY = details.globalPosition.dy;
  }

  // 处理拖动结束
  void _handleDragEnd(DragEndDetails details) {
    if (isAnimating) return;

    // 判断滑动方向
    double dragDistance = _currentDragY - _dragStartY;

    // 打印滑动距离，用于调试
    print('Drag distance: $dragDistance');

    // 只要有明确的方向就触发动画，无需考虑距离大小
    if (dragDistance < 0) {
      // 向上滑动，显示下一张卡片
      if (currentIndex < unitData.length - 1) {
        // 启动到下一张卡片的动画
        _startAnimation(currentIndex + 1);
      }
    } else if (dragDistance > 0) {
      // 向下滑动，显示上一张卡片
      if (currentIndex > 0) {
        // 启动到上一张卡片的动画
        _startAnimation(currentIndex - 1);
      }
    }
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
            onVerticalDragStart: _handleDragStart,
            onVerticalDragUpdate: _handleVerticalDrag,
            onVerticalDragEnd: _handleDragEnd,
            child: SizedBox(
              height: containerHeight * 3, // 三个卡片的总高度
              child: Stack(
                children: List.generate(unitData.length, (index) {
                  // 计算相对位置
                  int relativeIndex;

                  // 如果正在动画，需要特殊处理相对索引
                  if (isAnimating) {
                    if (_targetIndex > currentIndex) {
                      // 向上滑动，显示下一张卡片
                      if (index == currentIndex) {
                        // 当前卡片正在离开
                        relativeIndex = 0;
                      } else if (index == currentIndex + 1) {
                        // 下一张卡片正在进入
                        // 使用动画进度影响卡片位置，但保持相对索引为整数
                        relativeIndex = 1;
                      } else if (index == currentIndex + 2) {
                        // 下下张卡片正在上移
                        relativeIndex = 2;
                      } else if (index == currentIndex + 3) {
                        // 再下一张卡片正在显示
                        relativeIndex = 3;
                      } else {
                        // 其他卡片保持原有相对位置
                        relativeIndex = index - currentIndex;
                      }
                    } else {
                      // 向下滑动，显示上一张卡片
                      if (index == currentIndex) {
                        // 当前卡片正在离开
                        relativeIndex = 0;
                      } else if (index == currentIndex - 1) {
                        // 上一张卡片正在进入
                        relativeIndex = -1;
                      } else if (index == currentIndex + 1) {
                        // 下一张卡片正在下移
                        relativeIndex = 1;
                      } else if (index == currentIndex + 2) {
                        // 下下张卡片正在下移
                        relativeIndex = 2;
                      } else {
                        // 其他卡片保持原有相对位置
                        relativeIndex = index - currentIndex;
                      }
                    }

                    // 在卡片位置计算中使用animProgress，而不是在相对索引中
                  } else {
                    // 非动画状态，直接计算相对索引
                    relativeIndex = index - currentIndex;
                  }

                  // 计算卡片位置和变换
                  double topPosition;
                  double scale;
                  double rotation;
                  double opacity;

                  // 获取动画进度，用于计算过渡效果
                  double animProgress = isAnimating ? _animation.value : 0.0;

                  if (relativeIndex < 0) {
                    // 已经滚动过的卡片（不可见）
                    topPosition = -containerHeight;
                    scale = 0.8;
                    rotation = -0.1;
                    opacity = 0;

                    // 如果是向下滑动时的上一张卡片，添加过渡动画
                    if (isAnimating &&
                        _targetIndex < currentIndex &&
                        index == currentIndex - 1) {
                      // 从不可见到可见的过渡
                      topPosition =
                          -containerHeight + animProgress * containerHeight;
                      scale = 0.8 + animProgress * 0.2;
                      rotation = -0.1 + animProgress * 0.05;
                      opacity = animProgress;
                    }
                  } else if (relativeIndex == 0) {
                    // 第一个可见卡片（顶部）
                    topPosition = 0 + dragProgress * containerHeight;
                    scale = 1.0 - dragProgress.abs() * 0.1;
                    rotation = -0.05 - dragProgress * 0.05;
                    opacity = 1.0 - dragProgress.abs() * 0.5;

                    // 如果正在动画，添加过渡效果
                    if (isAnimating) {
                      if (_targetIndex > currentIndex) {
                        // 向上滑动，当前卡片向上移出
                        topPosition = -animProgress * containerHeight;
                        scale = 1.0 - animProgress * 0.2;
                        rotation = -0.05 - animProgress * 0.05;
                        opacity = 1.0 - animProgress * 0.5;
                      } else {
                        // 向下滑动，当前卡片向下移出
                        topPosition = animProgress * containerHeight;
                        scale = 1.0 - animProgress * 0.05;
                        rotation = -0.05 + animProgress * 0.05;
                        opacity = 1.0 - animProgress * 0.3;
                      }
                    }
                  } else if (relativeIndex == 1) {
                    // 第二个可见卡片（中间）
                    topPosition =
                        containerHeight * 0.9 + dragProgress * containerHeight;
                    scale = 0.95 + dragProgress * 0.05;
                    rotation = 0;
                    opacity = 1.0;

                    // 如果正在动画，添加过渡效果
                    if (isAnimating) {
                      if (_targetIndex > currentIndex) {
                        // 向上滑动，中间卡片移到顶部
                        topPosition = containerHeight * 0.9 -
                            animProgress * containerHeight * 0.9;
                        scale = 0.95 + animProgress * 0.05;
                        rotation = 0 - animProgress * 0.05;
                      } else {
                        // 向下滑动，中间卡片移到底部
                        topPosition = containerHeight * 0.9 +
                            animProgress * containerHeight * 0.9;
                        scale = 0.95 - animProgress * 0.05;
                        rotation = 0 + animProgress * 0.05;
                      }
                    }
                  } else if (relativeIndex == 2) {
                    // 第三个可见卡片（底部，部分可见）
                    topPosition =
                        containerHeight * 1.8 + dragProgress * containerHeight;
                    scale = 0.9 + dragProgress * 0.05;
                    rotation = 0.05;
                    opacity = 1.0;

                    // 如果正在动画，添加过渡效果
                    if (isAnimating) {
                      if (_targetIndex > currentIndex) {
                        // 向上滑动，底部卡片移到中间
                        topPosition = containerHeight * 1.8 -
                            animProgress * containerHeight * 0.9;
                        scale = 0.9 + animProgress * 0.05;
                      } else {
                        // 向下滑动，底部卡片移出视图
                        topPosition = containerHeight * 1.8 +
                            animProgress * containerHeight * 0.5;
                        scale = 0.9 - animProgress * 0.05;
                      }
                    }
                  } else {
                    // 第四个及以后的卡片（都堆叠在第三张卡片下方）
                    topPosition = containerHeight * 1.8 +
                        dragProgress * containerHeight; // 与第三张卡片位置相同
                    scale = 0.85;
                    rotation = 0.05;
                    opacity = 0; // 增加透明度区分

                    // 如果是向上滑动时的下一张卡片，添加过渡动画
                    if (isAnimating &&
                        _targetIndex > currentIndex &&
                        index == currentIndex + 3) {
                      // 从不可见到可见的过渡
                      topPosition = containerHeight * 2.3 -
                          animProgress * containerHeight * 0.5;
                      opacity = 0; // 保持透明
                    }
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
                  if (relativeIndex >= 2) {
                    // 计算可见比例
                    double visibleFraction;

                    if (relativeIndex == 2) {
                      // 第三张卡片可见比例（0.3-1.0之间）
                      visibleFraction =
                          0.3 + (dragProgress < 0 ? -dragProgress : 0) * 0.7;
                      visibleFraction = visibleFraction.clamp(0.3, 1.0);
                    } else {
                      // 第四张及以后的卡片只显示很小一部分
                      visibleFraction = 0.15;
                    }

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
