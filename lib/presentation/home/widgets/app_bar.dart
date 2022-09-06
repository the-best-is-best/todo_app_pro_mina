import 'package:date_picker_timeline_fixed/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mit_x/mit_x.dart';
import 'package:todo_app_pro_mina/app/extensions/extension_date_time.dart';
import 'package:todo_app_pro_mina/app/resources/font_manager.dart';
import 'package:todo_app_pro_mina/app/resources/routes_manager.dart';
import 'package:todo_app_pro_mina/app/resources/styles_manger.dart';
import 'package:todo_app_pro_mina/app/cubit/app_cubit.dart';
import 'package:todo_app_pro_mina/app/cubit/app_states.dart';
import 'package:todo_app_pro_mina/gen/assets.gen.dart';
import 'package:todo_app_pro_mina/presentation/components/my_text.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(15))),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(0)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15) +
              const EdgeInsets.only(top: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon:
                              AssetGenImage(const $AssetsImagesGen().menu.path)
                                  .image()),
                      IconButton(
                        icon: AssetGenImage(
                                const $AssetsImagesGen().notification.path)
                            .image(),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    title: 'My Tasks',
                    style: getBoldStyle(fontSize: FontSize.s40),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.blue),
                      onPressed: () {
                        MitX.toNamed(GetRoutes.addATask);
                      },
                      child: Icon(
                        Icons.add,
                        size: FontSize.s40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              BlocBuilder<AppCubit, AppStates>(builder: (context, states) {
                AppCubit appCubit = AppCubit.get(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          title: appCubit.dateTimeSelected.getNameOfWeek(),
                          style: getBoldStyle(),
                        ),
                        MyText(
                          title: appCubit.dateTimeSelected
                              .getNameOfWeekAndDayAndMonth(),
                          style: getLightStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    DatePicker(
                      appCubit.startSelectedDate,
                      daysCount: appCubit.totalDays,
                      monthTextStyle: getBoldStyle(fontSize: 0),
                      dateTextStyle: getBoldStyle(fontSize: FontSize.s24),
                      dayTextStyle: getRegularStyle(fontSize: FontSize.s18),
                      width: 70,
                      height: 70,
                      initialSelectedDate: appCubit.initialSelectedDate,
                      selectionColor: Colors.blue,
                      selectedTextColor: Colors.white,
                      onDateChange: (date) {
                        // New date selected
                        appCubit.changeDateTimeSelected(date);
                      },
                    ),
                  ],
                );
              }),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
