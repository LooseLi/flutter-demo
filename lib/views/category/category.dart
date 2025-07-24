import 'package:flutter/material.dart';
import '../../components/choice_clip.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  /// 当前选中的学习状态索引
  int _selectedStatusIndex = 0;

  /// 当前选中的学习状态
  String _selectedStatus = '全部';

  /// 处理学习状态选择
  void _onStatusSelected(int index, String option) {
    setState(() {
      _selectedStatusIndex = index;
      _selectedStatus = option;
    });

    // 这里可以添加根据选择状态筛选数据的逻辑
    print('选择了学习状态: $option (索引: $index)');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('分类'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 学习状态选择组件
            const Text(
              '学习状态',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 12),
            StudyStatusChoiceClip(
              selectedIndex: _selectedStatusIndex,
              onSelected: _onStatusSelected,
            ),
            const SizedBox(height: 24),

            // 显示当前选择状态
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xFFE9ECEF),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '当前选择:',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6C757D),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _selectedStatus,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF007AFF),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 内容区域 - 这里可以根据选择的状态显示不同的内容
            Expanded(
              child: Center(
                child: Text(
                  '显示 "$_selectedStatus" 相关内容',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF6C757D),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
