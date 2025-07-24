import 'package:flutter/material.dart';

/// 选择组件 - 用于显示多个选项并支持单选功能
/// 包含四个选项：全部、未学、错过、已学
class ChoiceClip extends StatefulWidget {
  /// 选项列表
  final List<String> options;

  /// 当前选中的索引
  final int selectedIndex;

  /// 选择回调函数
  final Function(int index, String option) onSelected;

  /// 组件背景色
  final Color backgroundColor;

  /// 选中项背景色
  final Color selectedBackgroundColor;

  /// 未选中项文字颜色
  final Color textColor;

  /// 选中项文字颜色
  final Color selectedTextColor;

  const ChoiceClip({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onSelected,
    this.backgroundColor = const Color.fromRGBO(55, 47, 43, 0.05),
    this.selectedBackgroundColor = const Color(0xFF007AFF),
    this.textColor = const Color(0xFF333333),
    this.selectedTextColor = Colors.white,
  });

  @override
  State<ChoiceClip> createState() => _ChoiceClipState();
}

class _ChoiceClipState extends State<ChoiceClip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          widget.options.length,
          (index) => _buildChoiceItem(index),
        ),
      ),
    );
  }

  /// 构建单个选择项
  Widget _buildChoiceItem(int index) {
    final bool isSelected = index == widget.selectedIndex;

    return GestureDetector(
      onTap: () {
        // 调用选择回调函数
        widget.onSelected(index, widget.options[index]);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color:
              isSelected ? widget.selectedBackgroundColor : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          widget.options[index],
          style: TextStyle(
            color: isSelected ? widget.selectedTextColor : widget.textColor,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

/// 预定义的学习状态选择组件
/// 包含：全部、未学、错过、已学 四个选项
class StudyStatusChoiceClip extends StatelessWidget {
  /// 当前选中的索引
  final int selectedIndex;

  /// 选择回调函数
  final Function(int index, String option) onSelected;

  const StudyStatusChoiceClip({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  /// 学习状态选项列表
  static const List<String> studyStatusOptions = [
    '全部',
    '未学',
    '错过',
    '已学',
  ];

  @override
  Widget build(BuildContext context) {
    return ChoiceClip(
      options: studyStatusOptions,
      selectedIndex: selectedIndex,
      onSelected: onSelected,
    );
  }
}
