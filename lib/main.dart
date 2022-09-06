import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app_pro_mina/app/app.dart';
import 'package:todo_app_pro_mina/app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  await initAppModels();
  runApp(const MyApp());
}
