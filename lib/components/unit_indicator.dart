import 'package:flutter/material.dart';

/// 单元指示器组件
///
/// 显示在左侧的指示器，用于指示当前查看的单元
class UnitIndicator extends StatelessWidget {
  final int totalUnits;
  final int currentUnit;

  const UnitIndicator({
    Key? key,
    required this.totalUnits,
    required this.currentUnit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalUnits, (index) {
          final isActive = index == currentUnit;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(vertical: 4),
            width: isActive ? 8 : 6,
            height: isActive ? 8 : 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? Colors.red : Colors.grey.withOpacity(0.5),
            ),
          );
        }),
      ),
    );
  }
}
