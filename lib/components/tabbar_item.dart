import 'package:flutter/material.dart';

class TabBarItem extends BottomNavigationBarItem {
  TabBarItem(Widget iconName, String label)
      : super(
          // icon: Image.asset(''), // 引用本地icon资源
          // activeIcon: Image.asset(''), // 引用本地icon资源：选中图片
          icon: iconName,
          label: label,
        );
}
