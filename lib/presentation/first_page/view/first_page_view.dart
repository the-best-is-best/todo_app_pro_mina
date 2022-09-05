import 'package:date_picker_timeline_fixed/date_picker_timeline_fixed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mit_x/mit_x.dart';
import 'package:todo_app_pro_mina/app/extensions/extension_date_time.dart';
import 'package:todo_app_pro_mina/app/resources/font_manager.dart';
import 'package:todo_app_pro_mina/app/resources/styles_manger.dart';
import 'package:todo_app_pro_mina/cubit/app_cubit.dart';
import 'package:todo_app_pro_mina/cubit/app_states.dart';
import 'package:todo_app_pro_mina/gen/assets.gen.dart';
import 'package:todo_app_pro_mina/presentation/components/my_text.dart';
import 'package:todo_app_pro_mina/presentation/first_page/widgets/app_bar.dart';

class FirstPageView extends StatefulWidget {
  const FirstPageView({Key? key}) : super(key: key);

  @override
  State<FirstPageView> createState() => _FirstPageViewState();
}

class _FirstPageViewState extends State<FirstPageView> {
  late final ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(15))),
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
                        const EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.menu, size: FontSize.s40),
                                Icon(Icons.notifications, size: FontSize.s40),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const MyAppBarFirstPage(),
                        BlocBuilder<AppCubit, AppStates>(
                            builder: (context, states) {
                          AppCubit appCubit = AppCubit.get(context);
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MyText(
                                    title: appCubit.dateTimeSelected
                                        .getNameOfWeek(),
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
                                monthTextStyle: getBoldStyle(fontSize: 0),
                                dateTextStyle:
                                    getBoldStyle(fontSize: FontSize.s24),
                                dayTextStyle:
                                    getRegularStyle(fontSize: FontSize.s18),
                                width: 70,
                                height: 70,
                                initialSelectedDate:
                                    appCubit.initialSelectedDate,
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
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: ListView.separated(
                              controller: scrollController,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => SizedBox(
                                  height: 160,
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        height: 150,
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20, top: 10),
                                                  child: Column(
                                                    children: [
                                                      MyText(
                                                        title: 'Title task',
                                                        style: getBoldStyle(),
                                                      ),
                                                      SizedBox(
                                                        width: context.width *
                                                                .58 -
                                                            40,
                                                        child: MyText(
                                                          title:
                                                              'Body task Body task Body task Body task Body task Body task Body task Body task',
                                                          style:
                                                              getLightStyle(),
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
                                                  bottomRight:
                                                      Radius.circular(15),
                                                )),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: MyText(
                                                title: DateTime.now().getTime(),
                                                style: getMediumStyle(
                                                    fontSize: FontSize.s20,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ))
                                    ],
                                  )),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 20),
                              itemCount: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            right: 0,
            child: Container(
              margin: const EdgeInsets.all(15),
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(30))),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: AssetGenImage(const $AssetsImagesGen().userProfile.path)
                    .image(width: 30, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
