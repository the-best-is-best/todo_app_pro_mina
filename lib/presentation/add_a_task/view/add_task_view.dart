import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_pro_mina/app/extensions/extension_build_context.dart';
import 'package:todo_app_pro_mina/app/resources/font_manager.dart';
import 'package:todo_app_pro_mina/app/resources/styles_manger.dart';
import 'package:todo_app_pro_mina/presentation/components/my_select_date.dart';
import 'package:todo_app_pro_mina/presentation/components/my_text.dart';
import 'package:todo_app_pro_mina/presentation/components/my_text_form_field.dart';
import 'package:todo_app_pro_mina/presentation/components/select_categories.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:todo_app_pro_mina/presentation/components/select_times.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({Key? key}) : super(key: key);

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  late TextEditingController dateController;
  late DateTime dateTimeSelected = DateTime.now();
  @override
  void initState() {
    dateController = TextEditingController();
    dateController.text = DateFormat('EEEE, d , MMMM').format(dateTimeSelected);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ]),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  title: 'Create New Tasks',
                  style: getBoldStyle(fontSize: FontSize.s30),
                ),
                Icon(
                  Icons.sticky_note_2,
                  color: Colors.blue,
                  size: FontSize.s40,
                ),
              ],
            ),
            const SizedBox(height: 25),
            Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyTextFormField(
                  title: 'Task Name',
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      title: 'Select Category',
                      style: getRegularStyle(color: Colors.blue),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: MyText(
                        title: 'See all',
                        style: getLightStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const SelectCategory(),
                const SizedBox(height: 30),
                MySelectDate(
                    dateController: dateController,
                    dateTimeSelected: dateTimeSelected),
                const SizedBox(height: 30),
                SelectTimes(dateTimeSelected: dateTimeSelected),
                const SizedBox(height: 30),
                const MyTextFormField(title: 'Description')
              ],
            )),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyText(
                      title: 'Create Task',
                      style: getBoldStyle(
                          color: Colors.white, fontSize: FontSize.s40),
                    ),
                  )),
            )
          ],
        ),
      )),
    );
  }
}
