import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

bool isDateSelectionEqualDateNow(TextEditingController dateController) {
  return DateFormat("EEEE, d MMMM").parse(dateController.text) ==
      DateFormat("EEEE, d MMMM")
          .parse(DateFormat("EEEE, d MMMM").format(DateTime.now()));
}
