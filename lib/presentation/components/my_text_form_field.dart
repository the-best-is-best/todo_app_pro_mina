import 'package:flutter/material.dart';

import '../../app/resources/styles_manger.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    Key? key,
    required this.title,
    required this.onSaved,
    this.controller,
    this.onTap,
    this.keyboardType,
    required this.validator,
    this.suffixIcon,
    this.multiline = false,
    this.enable = true,
  }) : super(key: key);
  final bool multiline;

  final bool enable;
  final String title;
  final FormFieldSetter<String>? onSaved;
  final TextEditingController? controller;
  final GestureTapCallback? onTap;
  final TextInputType? keyboardType;
  final FormFieldValidator<String> validator;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: getRegularStyle(color: Colors.blue),
        ),
        const SizedBox(height: 12),
        TextFormField(
          style: getMediumStyle(),
          enabled: enable,
          controller: controller,
          onTap: onTap,
          keyboardType: onTap == null ? keyboardType : TextInputType.none,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              errorStyle: getLightStyle(color: Colors.red),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.blue,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.blue),
              )),
          validator: validator,
          onSaved: onSaved,
        ),
      ],
    );
  }
}
