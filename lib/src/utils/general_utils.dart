import 'package:device_id/device_id.dart';
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

  static Future<String> getDeviceId() {
    return DeviceId.getID;
  }

}
