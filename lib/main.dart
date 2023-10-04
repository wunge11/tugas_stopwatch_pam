import 'package:flutter/material.dart';
import 'package:tugas_stopwatch_pam/Home.dart';
import 'package:tugas_stopwatch_pam/stopwatch.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home:StopwatchPage(),
      //home: BottomNavigationBarExampleApp(),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: BottomNavigationBarExample(),
//       ),
//     );
//   }
// }
