import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mit_x/mit_x.dart';
import 'package:todo_app_pro_mina/app/resources/font_manager.dart';
import 'package:todo_app_pro_mina/app/resources/routes_manager.dart';
import 'package:todo_app_pro_mina/cubit/app_cubit.dart';
import 'package:todo_app_pro_mina/presentation/add_a_task/view/add_task_view.dart';
import 'package:todo_app_pro_mina/presentation/home/view/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: ScreenUtilInit(
        designSize: const Size(480, 960),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, widget) => MitXMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              appBarTheme: AppBarTheme(
                  iconTheme:
                      IconThemeData(color: Colors.black, size: FontSize.s30),
                  backgroundColor: Colors.white,
                  elevation: 0),
              scaffoldBackgroundColor: Colors.white),
          routes: GetRoutes.getRoutes,
        ),
      ),
    );
  }
}
