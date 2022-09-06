import 'package:flutter/material.dart';
import 'package:todo_app_pro_mina/presentation/add_a_task/view/add_task_view.dart';
import 'package:todo_app_pro_mina/presentation/home/view/home_view.dart';

class GetRoutes {
  static String main = '/';
  static String addATask = '/add_a_task';

  static Map<String, Widget Function(BuildContext)> get getRoutes {
    return {
      main: (_) => const HomeView(),
      addATask: (_) => const AddTaskView()
    };
  }
}
