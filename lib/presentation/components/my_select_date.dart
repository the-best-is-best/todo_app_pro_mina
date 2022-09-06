import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_pro_mina/app/extensions/extension_build_context.dart';
import 'package:todo_app_pro_mina/app/resources/font_manager.dart';
import 'package:todo_app_pro_mina/app/resources/styles_manger.dart';
import 'package:todo_app_pro_mina/presentation/components/my_text.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          title: 'Date',
          style: getRegularStyle(color: Colors.blue),
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: DateTimeField(
                initialValue: DateTime.now(),
                style: getMediumStyle(),
                controller: dateController,
                resetIcon: null,
                decoration: InputDecoration(
                  errorStyle: getRegularStyle(),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.blue),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.blue),
                  ),
                ),
                format: DateFormat('EEEE, d  MMMM'),
                onShowPicker:
                    (BuildContext context, DateTime? currentValue) async {
                  dateTimeSelected =
                      await context.showMyDatePicker() ?? DateTime.now();
                  return dateTimeSelected;
                },
              ),
            ),
            Expanded(
                child: IconButton(
              icon: CircleAvatar(
                child: Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                  size: FontSize.s28,
                ),
              ),
              onPressed: () async {
                dateController.text = DateFormat('EEEE, d  MMMM')
                    .format(await context.showMyDatePicker() ?? DateTime.now());
              },
            ))
          ],
        ),
      ],
    );
  }
}
