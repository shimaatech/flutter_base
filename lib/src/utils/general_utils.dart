import 'package:flutter/material.dart';

class GeneralUtils {
  static void showSnackMessage(BuildContext context, String message) {
    if (message != null) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }
  }
}
