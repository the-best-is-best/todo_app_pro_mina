import 'package:flutter/material.dart';
import 'package:todo_app_pro_mina/presentation/home/widgets/app_bar.dart';
import 'package:todo_app_pro_mina/presentation/home/widgets/build_task.dart';
import 'package:todo_app_pro_mina/presentation/home/widgets/user_profile.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              AppBarHome(),
              Expanded(
                child: BuildTask(),
              )
            ],
          ),
          const UserProfile(),
        ],
      ),
    );
  }
}
