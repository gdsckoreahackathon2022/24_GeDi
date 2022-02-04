import 'package:flutter/material.dart';
import 'package:gedi/screens/dictionary_screen.dart';
import 'package:gedi/screens/mypage.dart';

void main() => runApp(GediApp());


class GediApp extends StatelessWidget {
  const GediApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GEDI',
      theme: ThemeData(
        primaryColor: const Color(0xffa3a4cd),
      ),
      initialRoute: "/",
      routes : {
        '/' : (context) => MyPage(),
        '/main' : (context) => MyPage(),
        "/dict" : (context) => DictionaryScreen(),
      }
    );
  }
}
