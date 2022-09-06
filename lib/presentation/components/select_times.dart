import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_pro_mina/app/extensions/extension_build_context.dart';
import 'package:todo_app_pro_mina/app/resources/font_manager.dart';
import 'package:todo_app_pro_mina/app/resources/styles_manger.dart';
import 'package:todo_app_pro_mina/presentation/components/my_text.dart';

class SelectTimes extends StatelessWidget {
  const SelectTimes({
    Key? key,
    required this.dateTimeSelected,
  }) : super(key: key);

  final DateTime dateTimeSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              title: "Select Time",
              style: getRegularStyle(color: Colors.blue),
            ),
            DateTimeField(
              initialValue: DateTime.now(),
              style: getMediumStyle(),
              resetIcon: null,
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.blue,
                  size: FontSize.s40,
                ),
                errorStyle: getRegularStyle(),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.blue),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.blue),
                ),
              ),
              format: DateFormat('hh:mm a'),
              onShowPicker:
                  (BuildContext context, DateTime? currentValue) async {
                TimeOfDay time =
                    await context.showMyTimePicker() ?? TimeOfDay.now();
                return DateTimeField.combine(dateTimeSelected, time);
              },
            ),
          ],
        )),
        const SizedBox(width: 50),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              title: "End Time",
              style: getRegularStyle(color: Colors.blue),
            ),
            DateTimeField(
              initialValue: DateTime.now(),
              style: getMediumStyle(),
              resetIcon: null,
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.blue,
                  size: FontSize.s40,
                ),
                errorStyle: getRegularStyle(),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.blue),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.blue),
                ),
              ),
              format: DateFormat('hh:mm a'),
              onShowPicker:
                  (BuildContext context, DateTime? currentValue) async {
                TimeOfDay time =
                    await context.showMyTimePicker() ?? TimeOfDay.now();
                return DateTimeField.combine(dateTimeSelected, time);
              },
            ),
          ],
        ))
      ],
    );
  }
}
