import 'package:flutter/material.dart';
import 'package:todo_app_pro_mina/app/resources/styles_manger.dart';

class MyText extends StatelessWidget {
  const MyText({
    Key? key,
    required this.title,
    this.style,
  }) : super(key: key);
  final String title;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style ?? getRegularStyle(),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
