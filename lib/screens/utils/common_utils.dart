import 'package:flutter/material.dart';

abstract class CommonUtils {
  static void showSnackBar(
      String text, Color backgroundColor, BuildContext context) {
    final snackBar = SnackBar(
      content: Center(
        child: Text(text),
      ),
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
