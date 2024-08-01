import 'dart:math';

import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification/data/data_source/push_notification_data_source.dart';

class FirebasePushNotificationDataSource extends PushNotificationDataSource {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> showNotificaiton(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(10000).toString(),
      'high_importance_notifications',
      importance: Importance.max,
    );
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: 'channel description',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    Future.delayed(
      Duration.zero,
      () {
        _flutterLocalNotificationPlugin.show(
          0,
          message.notification!.title,
          message.notification!.body,
          notificationDetails,
        );
      },
    );
  }

  @override
  Future<String?> getDeviceToken() async {
    String? token = await firebaseMessaging.getToken();
    return token;
  }

  @override
  void requestNotificationPermission() async {
    NotificationSettings notificationSettings =
        await firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      provisional: true,
      sound: true,
    );
    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      print('User permission granted');
    } else if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User provisional permission granted');
    } else {
      AppSettings.openAppSettings();
      print('Permission denied');
    }
  }

  @override
  Future<void> setupInteractMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      print("app is killed: ${initialMessage.toString()}");
    }
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print("app is in background: ${event.notification!.title.toString()}");
    });

    FirebaseMessaging.onMessage.listen((message) {
      if (kDebugMode) {
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
      }
      showNotificaiton(message);
    });
  }
}
