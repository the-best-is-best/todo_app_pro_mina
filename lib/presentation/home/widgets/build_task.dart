import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mit_x/mit_x.dart';
import 'package:todo_app_pro_mina/app/extensions/extension_date_time.dart';
import 'package:todo_app_pro_mina/app/resources/font_manager.dart';
import 'package:todo_app_pro_mina/app/resources/styles_manger.dart';
import 'package:todo_app_pro_mina/app/cubit/app_cubit.dart';
import 'package:todo_app_pro_mina/app/cubit/app_states.dart';
import 'package:todo_app_pro_mina/gen/assets.gen.dart';
import 'package:todo_app_pro_mina/presentation/add_a_task/freezed/freezed_add_a_task.dart';
import 'package:todo_app_pro_mina/presentation/components/my_text.dart';
import 'package:todo_app_pro_mina/presentation/home/widgets/custom_scroll_widget.dart';

class BuildTask extends StatelessWidget {
  const BuildTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child:
                  BlocBuilder<AppCubit, AppStates>(builder: (context, states) {
                final AppCubit appCubit = AppCubit.get(context);
                return BuildCondition(
                    condition: appCubit.tasksInDate.isNotEmpty,
                    fallback: (context) => Center(
                            child: MyText(
                          title: 'No Tasks Avalible',
                          style: getMediumStyle(color: Colors.white),
                        )),
                    builder: (context) {
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          TaskModel task = appCubit.tasksInDate[index];
                          return SizedBox(
                              height: 210.h,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: 200.h,
                                    child: Card(
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      clipBehavior: Clip.hardEdge,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  appCubit.categoriesImage[
                                                          task.category] ??
                                                      AssetGenImage(
                                                        const $AssetsImagesGen()
                                                            .imageTask
                                                            .path,
                                                      ).image(
                                                          fit: BoxFit.cover,
                                                          width: context.width *
                                                              .3)
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, top: 10),
                                              child: Column(
                                                children: [
                                                  MyText(
                                                    title: task.title,
                                                    style: getBoldStyle(),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  SizedBox(
                                                    width: context.width * .58 -
                                                        40,
                                                    child: MyText(
                                                      title: task.description,
                                                      style: getLightStyle(),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              bottomRight: Radius.circular(15),
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: MyText(
                                            title: task.startTime,
                                            style: getMediumStyle(
                                                fontSize: FontSize.s20,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ))
                                ],
                              ));
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20),
                        itemCount: appCubit.tasksInDate.length,
                      );
                    });
              }),
            ),
          ),
        ],
      ),
    );
  }
}
