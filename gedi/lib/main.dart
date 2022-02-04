import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gedi/screens/dictionary_screen.dart';
import 'package:gedi/widgets/side_navigationbar.dart';

import 'firebase_options.dart';
import 'models/global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(home: GediApp()));
}

class GediApp extends StatefulWidget {
  const GediApp({Key? key}) : super(key: key);

  static List<Widget> pageList = [
    const DictionaryScreen(),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.red,
    ),
    const Text("qwerqwerqwer")
  ];

  @override
  State<GediApp> createState() => _GediAppState();
}

class _GediAppState extends State<GediApp> {
  // This widget is the root of your application.

  int idx = 1;

  void callback(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GEDI',
      theme: ThemeData(
        primaryColor: const Color(0xffa3a4cd),
      ),
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('GEDI'),
        //   backgroundColor: const Color(0xffa3a4cd),
        //   actions: [
        //     IconButton(
        //       onPressed: () => DictionaryScreen.show(context),
        //       icon: const Icon(Icons.double_arrow),
        //     )
        //   ],
        // ),
        body: Stack(
          children: [
            Row(
              children: <Widget>[
                const SizedBox(
                  height: double.infinity,
                  width: 55,
                ),
                Expanded(
                  child: GediApp.pageList[pageIndex],
                )
              ],
            ),
            Row(
              children: <Widget>[
                LeftWidget(
                  callback: callback,
                ),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
