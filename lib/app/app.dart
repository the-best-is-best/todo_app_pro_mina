import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mit_x/mit_x.dart';
import 'package:todo_app_pro_mina/cubit/app_cubit.dart';
import 'package:todo_app_pro_mina/presentation/first_page/view/first_page_view.dart';

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
          ),
          routes: {'/': (_) => const FirstPageView()},
        ),
      ),
    );
  }
}
