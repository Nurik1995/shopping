import 'package:flutter/material.dart';

// String ipAddress = 'http://192.168.100.15';
// String ipAddress = 'http://172.30.36.117';
// String ipAddress = 'http://172.30.36.137';
String ipAddress = 'http://172.30.36.195';
snackbarMessage(BuildContext context, String message) {
  var snackBar = SnackBar(
    content: Text(message),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
