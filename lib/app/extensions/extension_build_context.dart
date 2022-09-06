import 'package:flutter/material.dart';

extension ExtensionBuildContext on BuildContext {
  Future<DateTime?> showMyDatePicker() async {
    DateTime dateNow = DateTime.now();
    return await showDatePicker(
        context: this,
        initialDate: dateNow,
        firstDate: dateNow,
        lastDate: DateTime.parse(
            DateTime(dateNow.year + 10, dateNow.month - 1, dateNow.day)
                .toString()));
  }

  Future<TimeOfDay?> showMyTimePicker() async {
    TimeOfDay timeOfDay = TimeOfDay.now();
    return await showTimePicker(
      context: this,
      initialTime: timeOfDay,
    );
  }
}
