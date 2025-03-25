import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditation/core/services/local_notification.dart';
import 'package:meditation/core/utils/responsiveness.dart';
import 'package:meditation/presentation/home/home.dart';

void main() async{
  AwesomeNotifications().initialize(
    'resource://drawable/logo',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic notifications',
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.white,
        importance: NotificationImportance.High,
      ),
    ],
  );

  LocalNotification.requestNotificationPermission();

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
