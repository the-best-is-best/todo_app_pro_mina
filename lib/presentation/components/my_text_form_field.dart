import 'package:flutter/material.dart';
import 'package:todo_app_pro_mina/app/resources/styles_manger.dart';
import 'package:todo_app_pro_mina/presentation/components/my_text.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          title: title,
          style: getRegularStyle(color: Colors.blue),
        ),
        const SizedBox(height: 12),
        TextFormField(
          style: getMediumStyle(),
          decoration: InputDecoration(
              errorStyle: getRegularStyle(),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.blue),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.blue),
              )),
        ),
      ],
    );
  }
}
