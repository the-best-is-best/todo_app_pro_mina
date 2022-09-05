import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app_pro_mina/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  runApp(const MyApp());
}
