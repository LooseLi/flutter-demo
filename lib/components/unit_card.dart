import 'package:flutter/material.dart';

/// 单元卡片组件
///
/// 展示单个Unit的卡片，包含标题、副标题、进度指示器等
class UnitCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final int unitNumber;
  final int totalPages;
  final int currentPage;

  const UnitCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.unitNumber,
    required this.totalPages,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          // 单元标题
          Positioned(
            left: 20,
            top: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Unit $unitNumber',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                if (subtitle.isNotEmpty)
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
              ],
            ),
          ),

          // 进度指示器
          Positioned(
            bottom: 20,
            left: 20,
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 100 * (currentPage / totalPages),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '$currentPage/$totalPages',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // 右侧卡通形象
          Positioned(
            right: 20,
            bottom: 20,
            child: _buildCartoonCharacter(unitNumber),
          ),
        ],
      ),
    );
  }

  /// 根据单元号构建不同的卡通形象
  Widget _buildCartoonCharacter(int unitNumber) {
    // 这里可以根据不同的单元号返回不同的卡通形象
    // 简单示例，实际项目中可以替换为图片资源
    final colors = [
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.purple,
      Colors.teal,
    ];

    final color = colors[(unitNumber - 1) % colors.length];

    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          '${String.fromCharCode(0x1F600 + unitNumber)}',
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
