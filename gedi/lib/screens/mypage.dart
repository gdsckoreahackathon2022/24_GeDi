import 'package:flutter/material.dart';
import 'package:gedi/screens/dictionary_screen.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GEDI',
      theme: ThemeData(
        primaryColor: const Color(0xffa3a4cd),
      ),
      home: Scaffold(
        body: Container(
          child: Row(
            children: <Widget>[
            ]
          )
        ),
      ),
    );
  }
}