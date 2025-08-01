// controller demo

// import 'package:flutter/material.dart';
// import 'package:flutter_demo/controller/slider_controller.dart';
// import '../../components/choice_clip.dart';
//
// class Category extends StatefulWidget {
//   final SliderController controller;
//
//   const Category({super.key, required this.controller});
//
//   @override
//   State<Category> createState() => _CategoryState();
// }
//
// class _CategoryState extends State<Category> {
//   /// 当前选中的学习状态索引
//   int _selectedStatusIndex = 0;
//
//   /// 当前选中的学习状态
//   String _selectedStatus = '全部';
//
//   /// 处理学习状态选择
//   void _onStatusSelected(int index, String option) {
//     setState(() {
//       _selectedStatusIndex = index;
//       _selectedStatus = option;
//     });
//
//     // 这里可以添加根据选择状态筛选数据的逻辑
//     print('选择了学习状态: $option (索引: $index)');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('分类'),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // 学习状态选择组件
//             const Text(
//               '学习状态',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: Color(0xFF333333),
//               ),
//             ),
//             const SizedBox(height: 12),
//             StudyStatusChoiceClip(
//               selectedIndex: _selectedStatusIndex,
//               onSelected: _onStatusSelected,
//             ),
//             const SizedBox(height: 24),
//
//             // 显示当前选择状态
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF8F9FA),
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(
//                   color: const Color(0xFFE9ECEF),
//                   width: 1,
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     '当前选择:',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Color(0xFF6C757D),
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     _selectedStatus,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFF007AFF),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 24),
//
//             ElevatedButton(
//                 onPressed: widget.controller.setMax, child: Text('按钮')),
//
//             const SizedBox(height: 24),
//
//             // 内容区域 - 这里可以根据选择的状态显示不同的内容
//             Expanded(
//               child: ListenableBuilder(
//                   listenable: widget.controller,
//                   builder: (BuildContext context, Widget? child) {
//                     return Container(
//                       alignment: Alignment.center,
//                       color: Colors.orange,
//                       child: Column(
//                         children: [
//                           FlutterLogo(size: widget.controller.value * 100 + 50),
//                           Slider(
//                               value: widget.controller.value,
//                               onChanged: (value) {
//                                 widget.controller.onSlider(value);
//                               })
//                         ],
//                       ),
//                     );
//                   }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// provider demo
import 'package:flutter/material.dart';
import 'package:flutter_demo/models/logo_model.dart';
import 'package:provider/provider.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    // final model = context.watch<LogoModel>(); // context.watch

    return Consumer<LogoModel>(builder: (context, provider, child) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Transform.flip(
                  flipX: provider.flipX,
                  flipY: provider.flipY,
                  child: FlutterLogo(size: provider.size),
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('flipX: ${provider.flipX}'),
                        Switch(
                            value: provider.flipX,
                            onChanged: (value) {
                              provider.flipX = value;
                            })
                      ],
                    ),
                    Row(
                      children: [
                        Text('flipY: ${provider.flipY}'),
                        Switch(
                            value: provider.flipY,
                            onChanged: (value) {
                              provider.flipY = value;
                            })
                      ],
                    ),
                    Row(
                      children: [
                        Text('size: ${provider.size.ceilToDouble()}'),
                        Slider(
                            min: 50,
                            max: 100,
                            value: provider.size,
                            onChanged: (value) {
                              provider.size = value;
                            })
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
