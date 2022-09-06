import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_pro_mina/app/cubit/app_cubit.dart';
import 'package:todo_app_pro_mina/app/extensions/extension_build_context.dart';
import 'package:todo_app_pro_mina/app/extensions/extension_date_time.dart';
import 'package:todo_app_pro_mina/app/resources/styles_manger.dart';
import 'package:todo_app_pro_mina/gen/assets.gen.dart';
import 'package:todo_app_pro_mina/presentation/components/my_text.dart';
import 'package:todo_app_pro_mina/presentation/components/my_text_form_field.dart';

// ignore: must_be_immutable
class MySelectDate extends StatelessWidget {
  MySelectDate({
    Key? key,
    required this.dateController,
    required this.dateTimeSelected,
  }) : super(key: key);
  final TextEditingController dateController;
  DateTime dateTimeSelected;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: MyTextFormField(
            controller: dateController,
            onSaved: (val) {
              AppCubit appCubit = AppCubit.get(context);

              appCubit.addDate(dateTimeSelected.toDateString());
            },
            onTap: () async {
              DateTime val = await context.showMyDatePicker();
              dateTimeSelected = val;
              dateController.text = val.getNameOfWeekAndDayAndMonth();
            },
            title: "Select Date",
            validator: (String? value) {
              return null;
            },
          ),
        ),
        Expanded(
            child: IconButton(
          icon: SvgGenImage(const $AssetsSvgGen().calender.path).svg(),
          onPressed: () async {
            dateController.text = DateFormat('EEEE, d  MMMM')
                .format(await context.showMyDatePicker());
          },
        ))
      ],
    );
  }
}
