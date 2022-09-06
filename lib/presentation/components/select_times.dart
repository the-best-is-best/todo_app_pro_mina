import 'package:flutter/material.dart';
import 'package:todo_app_pro_mina/app/extensions/extension_build_context.dart';
import 'package:todo_app_pro_mina/presentation/components/my_text_form_field.dart';

class SelectTimes extends StatefulWidget {
  const SelectTimes({
    Key? key,
    required this.dateTimeSelected,
    this.onSavedStartTime,
    this.onSavedEndTime,
    required this.validatorStartTime,
    required this.validatorEndTime,
    required this.startTimeController,
    required this.endTimeController,
  }) : super(key: key);

  final DateTime dateTimeSelected;
  final void Function(String?)? onSavedStartTime;
  final void Function(String?)? onSavedEndTime;
  final FormFieldValidator<String> validatorStartTime;
  final FormFieldValidator<String> validatorEndTime;
  final TextEditingController startTimeController;
  final TextEditingController endTimeController;
  @override
  State<SelectTimes> createState() => _SelectTimesState();
}

class _SelectTimesState extends State<SelectTimes> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: MyTextFormField(
          controller: widget.startTimeController,
          validator: widget.validatorStartTime,
          title: "Select Time",
          onTap: () async {
            String val = await context.showMyTimePicker();
            widget.startTimeController.text = val;
          },
          onSaved: widget.onSavedStartTime,
        )),
        const SizedBox(width: 50),
        Expanded(
            child: MyTextFormField(
          controller: widget.endTimeController,
          title: "End Time",
          validator: widget.validatorEndTime,
          onSaved: widget.onSavedEndTime,
          onTap: () async {
            String val = await context.showMyTimePicker();
            widget.endTimeController.text = val;
          },
        ))
      ],
    );
  }
}
