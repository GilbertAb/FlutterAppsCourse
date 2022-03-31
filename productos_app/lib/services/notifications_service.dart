import 'package:flutter/material.dart';

class NotificationsService {
  static late GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
