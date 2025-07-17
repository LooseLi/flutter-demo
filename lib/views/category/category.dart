import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('分类'),
      ),
      body: const Center(
        child: Text(
          '分类',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
