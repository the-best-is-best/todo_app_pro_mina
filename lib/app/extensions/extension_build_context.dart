import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ExtensionBuildContext on BuildContext {
  Future<DateTime> showMyDatePicker() async {
    DateTime dateNow = DateTime.now();
    DateTime? date = await showDatePicker(
        context: this,
        initialDate: dateNow,
        firstDate: dateNow,
        lastDate: DateTime.parse(
            DateTime(dateNow.year + 10, dateNow.month - 1, dateNow.day)
                .toString()));

    return date ?? dateNow;
  }

  Future<String> showMyTimePicker() async {
    TimeOfDay timeOfDay = TimeOfDay.now();
    TimeOfDay? time = await showTimePicker(
      context: this,
      initialTime: timeOfDay,
    );
    return time?.format(this) ?? "";
  }

  Future<void> showAlerts<T>(
      {required String title,
      required TextStyle textStyle,
      TextStyle? contentTextStyle,
      required EdgeInsetsGeometry paddingTitle,
      required List<Widget> content,
      bool barrierDismissible = false,
      List<Widget>? actions,
      Color? backgroundColor}) {
    return showDialog<T>(
      context: this,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) => AlertDialog(
        titlePadding: paddingTitle,
        titleTextStyle: textStyle,
        contentTextStyle: contentTextStyle ?? textStyle,
        backgroundColor: backgroundColor,
        title: Center(child: Text(title)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: content,
        ),
        actions: actions,
      ),
    );
  }
}
