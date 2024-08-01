import 'package:flutter/material.dart';
import 'config/service_locator/service_locator.dart';
import 'config/services/firebase_service.dart';
import 'features/push_notification/domain/use_case/send_push_notification_use_case.dart';
import 'features/push_notification/presentation/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.initializeFirebase();
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(serviceLocator<SendPushNotificationUseCase>()),
    );
  }
}
