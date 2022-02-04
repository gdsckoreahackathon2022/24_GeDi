import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gedi/screens/dictionary_screen.dart';
import 'package:gedi/screens/login_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
              onPressed: () => SignInDemo.show(context),
              icon: const Icon(Icons.double_arrow),
            )
          ],
        ),
      ),
    );
  }
}
