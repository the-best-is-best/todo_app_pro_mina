// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ExtensionDateTime on DateTime {
  String getNameOfWeek() {
    return this.day == DateTime.now().day
        ? "Today"
        : this.day == DateTime.now().day + 1
            ? "Tomorrow"
            : DateFormat('EEEE').format(this);
  }

  String getNameOfWeekAndDayAndMonth() {
    return DateFormat('EEEE, d MMMM').format(this);
  }

  String getTime() {
    return DateFormat('hh:mm a').format(this);
  }
}
