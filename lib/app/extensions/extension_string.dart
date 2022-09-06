import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ExtensionString on String {
  DateTime toDate() {
    DateTime outputDate = DateFormat('yyyy/MM/dd').parse(this);
    return outputDate;
  }

  TimeOfDay convertTimeStringToTimeOfDay() {
    DateTime dateTime = DateFormat(
      "hh:mm a",
    ).parse(this);

    return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }

  DateTime toDateTime() {
    DateTime outputDate = DateFormat('yyyy/MM/dd hh:mm a').parse(this);
    return outputDate;
  }
}
