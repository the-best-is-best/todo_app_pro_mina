import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app_pro_mina/app/app.dart';
import 'package:todo_app_pro_mina/app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AwesomeNotifications()
      .initialize('resource://drawable/res_notification_app_icon', [
    NotificationChannel(
        channelKey: 'schedule_tasks',
        channelName: 'Schedule Tasks',
        channelDescription: 'Schedule Tasks',
        defaultColor: Colors.green,
        importance: NotificationImportance.Max,
        channelShowBadge: true)
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  await initAppModels();
  runApp(const MyApp());
}
