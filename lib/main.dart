import 'package:flutter/material.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('导航栏标题'),
        ),
        body: const ContentWidget(),
      ),
    );
  }
}

// class ContentWidget extends StatelessWidget {
//   const ContentWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//         child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         TextButton(
//           onPressed: () {},
//           child: Text('计数+1'),
//         ),
//         Text(
//           'Hello Flutter',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 24,
//             color: Colors.red,
//           ),
//         ),
//       ],
//     ));
//   }
// }

class ContentWidget extends StatefulWidget {
  const ContentWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ContentWidgetState();
  }
}

class ContentWidgetState extends State<ContentWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              child: const Text('计数+1'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  counter--;
                });
              },
              child: const Text('计数-1'),
            ),
          ],
        ),
        Text(
          '当前计数: $counter',
          textDirection: TextDirection.ltr,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.red,
          ),
        ),
      ],
    ));
  }
}
