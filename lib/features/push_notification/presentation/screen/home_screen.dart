import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notification/features/push_notification/domain/use_case/send_push_notification_use_case.dart';

class HomeScreen extends StatefulWidget {
  final SendPushNotificationUseCase _sendPushNotificationUseCase;

  const HomeScreen(this._sendPushNotificationUseCase, {super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget._sendPushNotificationUseCase.requestNotificationPermission();
    widget._sendPushNotificationUseCase.setupInteractMessage();
    widget._sendPushNotificationUseCase.getDeviceToken().then((token) {
      print(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("home-screen"),
        centerTitle: true,
      ),
    );
  }
}
