import 'package:flutter/material.dart';
import 'package:gedi/screens/dictionary_screen.dart';

void main() {
  runApp(const MaterialApp(home: GediApp()));
}

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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GEDI'),
          backgroundColor: const Color(0xffa3a4cd),
          actions: [
            IconButton(
              onPressed: () => DictionaryScreen.show(context),
              icon: const Icon(Icons.double_arrow),
            )
          ],
        ),
      ),
    );
  }
}
