import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowDialog {
  ShowDialog({
    required this.title,
    required this.content,
    required this.actions,
  });

  final List<TextButton> actions;
  final Text title;
  final Text content;

  showAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: title,
      content: content,
      actions: actions,
    );

    CupertinoAlertDialog cupertinoAlert = CupertinoAlertDialog(
      title: title,
      content: content,
      actions: actions,
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Platform.isIOS ? cupertinoAlert : alert;
      },
    );
  }
}
