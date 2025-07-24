# Flutter App Demo

一个Flutter学习应用演示项目，包含分类页面和选择组件功能。

## 项目结构

```
lib/
├── components/          # 可复用组件
│   ├── choice_clip.dart # 选择组件
│   ├── dashed_line.dart # 虚线组件
│   └── tabbar_item.dart # 标签栏项目组件
├── views/              # 页面视图
│   ├── category/       # 分类页面
│   ├── home/          # 首页
│   └── person/        # 个人页面
├── models/            # 数据模型
├── api/              # API接口
└── main.dart         # 应用入口
```

## 核心组件

### ChoiceClip 选择组件

`ChoiceClip` 是一个可复用的选择组件，支持多选项单选功能，具有流畅的动画效果。

#### 功能特性
- ✅ 支持自定义选项列表
- ✅ 流畅的选择动画效果
- ✅ 可自定义颜色主题
- ✅ 响应式设计
- ✅ 回调函数支持

#### 使用方法

```dart
import 'package:flutter_app_demo/components/choice_clip.dart';

// 基础用法
ChoiceClip(
  options: ['选项1', '选项2', '选项3'],
  selectedIndex: 0,
  onSelected: (index, option) {
    print('选择了: $option (索引: $index)');
  },
)

// 自定义样式
ChoiceClip(
  options: ['全部', '未学', '错过', '已学'],
  selectedIndex: selectedIndex,
  onSelected: onSelected,
  backgroundColor: Color(0xFFF5F5F5),
  selectedBackgroundColor: Color(0xFF007AFF),
  textColor: Color(0xFF333333),
  selectedTextColor: Colors.white,
)
```

#### 参数说明

| 参数名 | 类型 | 必填 | 默认值 | 说明 |
|--------|------|------|--------|------|
| `options` | `List<String>` | ✅ | - | 选项列表 |
| `selectedIndex` | `int` | ✅ | - | 当前选中的索引 |
| `onSelected` | `Function(int, String)` | ✅ | - | 选择回调函数 |
| `backgroundColor` | `Color` | ❌ | `Color(0xFFF5F5F5)` | 组件背景色 |
| `selectedBackgroundColor` | `Color` | ❌ | `Color(0xFF007AFF)` | 选中项背景色 |
| `textColor` | `Color` | ❌ | `Color(0xFF333333)` | 未选中项文字颜色 |
| `selectedTextColor` | `Color` | ❌ | `Colors.white` | 选中项文字颜色 |

### StudyStatusChoiceClip 学习状态选择组件

预定义的学习状态选择组件，包含「全部、未学、错过、已学」四个选项。

```dart
StudyStatusChoiceClip(
  selectedIndex: _selectedStatusIndex,
  onSelected: (index, option) {
    setState(() {
      _selectedStatusIndex = index;
      _selectedStatus = option;
    });
  },
)
```

## 页面功能

### 分类页面 (Category)

位置：`lib/views/category/category.dart`

#### 功能特性
- 学习状态筛选：支持按「全部、未学、错过、已学」状态筛选内容
- 实时状态显示：显示当前选择的筛选状态
- 响应式布局：适配不同屏幕尺寸

#### 使用示例
```dart
// 在分类页面中使用学习状态选择
class _CategoryState extends State<Category> {
  int _selectedStatusIndex = 0;
  String _selectedStatus = '全部';

  void _onStatusSelected(int index, String option) {
    setState(() {
      _selectedStatusIndex = index;
      _selectedStatus = option;
    });
    // 根据选择状态筛选数据的逻辑
  }
}
```

## 开发指南

### 代码规范
- 使用驼峰命名法
- 为所有公共方法和属性添加注释
- 遵循Flutter官方代码风格
- 使用const构造函数优化性能

### 组件设计原则
- **可复用性**：组件应该能在不同场景下复用
- **可配置性**：提供足够的参数来自定义外观和行为
- **性能优化**：使用AnimatedContainer等优化动画性能
- **用户体验**：提供流畅的交互动画和视觉反馈

## Getting Started

### 环境要求
- Flutter SDK: >=3.0.0
- Dart SDK: >=3.0.0

### 运行项目
```bash
# 获取依赖
flutter pub get

# 运行项目
flutter run
```

### 参考资源
- [Flutter官方文档](https://docs.flutter.dev/)
- [Dart语言指南](https://dart.dev/guides)
- [Flutter组件库](https://docs.flutter.dev/development/ui/widgets)
