// SHA1: 7B:28:BB:1C:4A:83:BA:89:FD:FF:FE:64:0C:0C:C7:B2:A3:E6:39:EB

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _messageStream =
      StreamController.broadcast();
  // Getter
  static Stream<String> get messagesStream => _messageStream.stream;

  static Future initializeApp() async {
    // Push Notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('Token: $token');

    // Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);

    // Local Notifications
  }

  static Future _backgroundHandler(RemoteMessage message) async {
    print('onBackgroundHandler ${message.messageId}');
    _messageStream.add(message.data['Product'] ?? 'No product');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print('onMessageHandler ${message.messageId}');
    _messageStream.add(message.data['Product'] ?? 'No product');
  }

  static Future _onMessageOpenedApp(RemoteMessage message) async {
    print('onMessageOpenedApp ${message.messageId}');
    _messageStream.add(message.data['Product'] ?? 'No product');
  }

  static closeStream() {
    _messageStream.close();
  }
}
