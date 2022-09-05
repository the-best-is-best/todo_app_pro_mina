import 'package:flutter/material.dart';
import 'package:todo_app_pro_mina/app/resources/font_manager.dart';
import 'package:todo_app_pro_mina/app/resources/styles_manger.dart';
import 'package:todo_app_pro_mina/presentation/components/my_text.dart';

class MyAppBarFirstPage extends StatelessWidget {
  const MyAppBarFirstPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText(
          title: 'My Tasks',
          style: getBoldStyle(fontSize: FontSize.s40),
        ),
        SizedBox(
          height: 50,
          width: 50,
          child: TextButton(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.blue),
            onPressed: () {},
            child: Icon(
              Icons.add,
              size: FontSize.s40,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
