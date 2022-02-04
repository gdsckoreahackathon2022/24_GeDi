import 'package:flutter/material.dart';

class DictionaryDetailScreen extends StatelessWidget {
  const DictionaryDetailScreen({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const DictionaryDetailScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(),
    );
  }
}
