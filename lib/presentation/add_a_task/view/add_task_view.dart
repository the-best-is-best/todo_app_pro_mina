import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mit_x/mit_x.dart';
import 'package:todo_app_pro_mina/app/extensions/Extension_string.dart';
import 'package:todo_app_pro_mina/app/extensions/extension_date_time.dart';
import 'package:todo_app_pro_mina/app/extensions/form_state_extension.dart';
import 'package:todo_app_pro_mina/app/extensions/time_of_day_extension.dart';
import 'package:todo_app_pro_mina/app/functions/functions.dart';
import 'package:todo_app_pro_mina/app/resources/font_manager.dart';
import 'package:todo_app_pro_mina/app/resources/styles_manger.dart';
import 'package:todo_app_pro_mina/app/cubit/app_cubit.dart';
import 'package:todo_app_pro_mina/app/cubit/app_states.dart';
import 'package:todo_app_pro_mina/gen/assets.gen.dart';
import 'package:todo_app_pro_mina/presentation/components/my_select_date.dart';
import 'package:todo_app_pro_mina/presentation/components/my_text.dart';
import 'package:todo_app_pro_mina/presentation/components/my_text_form_field.dart';
import 'package:todo_app_pro_mina/presentation/components/select_categories.dart';
import 'package:todo_app_pro_mina/presentation/components/select_times.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({Key? key}) : super(key: key);

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  late TextEditingController _dateController;
  late DateTime _dateTimeSelected;
  late GlobalKey<FormState> _formKey;
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  @override
  void initState() {
    _dateTimeSelected = DateTime.now();
    _formKey = GlobalKey<FormState>();

    _dateController = TextEditingController();
    _dateController.text = DateFormat('EEEE, d MMMM').format(_dateTimeSelected);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon:
                AssetGenImage(const $AssetsImagesGen().arrowBack.path).image(),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
              icon: AssetGenImage(const $AssetsImagesGen().menu.path).image(),
              onPressed: () {},
            ),
          ]),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  title: 'Create New Tasks',
                  style: getBoldStyle(fontSize: FontSize.s30),
                ),
                SvgGenImage(const $AssetsSvgGen().noteIcon.path).svg()
              ],
            ),
            const SizedBox(height: 25),
            BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
              if (state is TaskAddedState) {
                MitX.back();
              }
            }, builder: (context, state) {
              AppCubit appCubit = AppCubit.get(context);
              return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextFormField(
                        title: 'Task Name',
                        onSaved: (value) {
                          appCubit.addTitle(value ?? "");
                        },
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "Required";
                          } else if (val.length < 5) {
                            return "Title length less than 5";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            title: 'Select Category',
                            style: getRegularStyle(color: Colors.blue),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: MyText(
                              title: 'See all',
                              style: getLightStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      const SelectCategory(),
                      const SizedBox(height: 30),
                      MySelectDate(
                        dateController: _dateController,
                        dateTimeSelected: _dateTimeSelected,
                      ),
                      const SizedBox(height: 30),
                      SelectTimes(
                        startTimeController: _startTimeController,
                        endTimeController: _endTimeController,
                        dateTimeSelected: _dateTimeSelected,
                        onSavedStartTime: (val) {
                          appCubit.addStartTime(
                            val ?? DateTime.now().toTimeString(),
                          );
                        },
                        onSavedEndTime: (val) {
                          appCubit
                              .addEndTime(val ?? DateTime.now().toTimeString());
                        },
                        validatorStartTime: (val) {
                          if (val == null || val.isEmpty) {
                            return "Required";
                          }
                          TimeOfDay timeValue =
                              val.convertTimeStringToTimeOfDay();
                          if (_dateController.text.isEmpty) {
                            return "Select Date";
                          }
                          if (_dateController.text.isNotEmpty &&
                              isDateSelectionEqualDateNow(_dateController)) {
                            if (timeValue.isBeforeTimeNow()) {
                              return "Time less Than Time Now";
                            }
                          }
                          if (_endTimeController.text.isEmpty) {
                            return "Select End Time";
                          }
                          TimeOfDay timeEndValue = _endTimeController.text
                              .convertTimeStringToTimeOfDay();
                          if (timeValue.isAfterAnotherTime(timeEndValue)) {
                            return "Time After Than End Time";
                          } else {
                            return null;
                          }
                        },
                        validatorEndTime: (val) {
                          if (val == null || val.isEmpty) {
                            return "Required";
                          }
                          TimeOfDay timeValue =
                              val.convertTimeStringToTimeOfDay();
                          if (_dateController.text.isEmpty) {
                            return "Select Date";
                          }
                          if (_dateController.text.isNotEmpty &&
                              isDateSelectionEqualDateNow(_dateController)) {
                            if (timeValue.isBeforeTimeNow()) {
                              return "Time Less Than Time Now";
                            }
                            if (_startTimeController.text.isEmpty) {
                              return "Select End Time";
                            }
                            TimeOfDay timeStartValue = _startTimeController.text
                                .convertTimeStringToTimeOfDay();
                            if (timeValue.isBeforeAnotherTime(timeStartValue)) {
                              return "Time Less Than Start Time";
                            } else {
                              return null;
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      MyTextFormField(
                        title: 'Description',
                        onSaved: (val) {
                          appCubit.addDescription(val ?? '');
                        },
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "Required";
                          } else if (val.length < 5) {
                            return "Title length less than 5";
                          } else {
                            return null;
                          }
                        },
                      )
                    ],
                  ));
            }),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                  ),
                  onPressed: () {
                    if (_formKey.isValid()) {
                      _formKey.save();
                      AppCubit appCubit = AppCubit.get(context);
                      appCubit.addNewTask();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyText(
                      title: 'Create Task',
                      style: getBoldStyle(
                          color: Colors.white, fontSize: FontSize.s40),
                    ),
                  )),
            )
          ],
        ),
      )),
    );
  }
}
