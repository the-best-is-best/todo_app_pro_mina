import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mit_x/mit_x.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app_pro_mina/app/di.dart';
import 'package:todo_app_pro_mina/app/extensions/Extension_string.dart';
import 'package:todo_app_pro_mina/app/extensions/extension_date_time.dart';
import 'package:todo_app_pro_mina/app/cubit/app_states.dart';
import 'package:todo_app_pro_mina/app/model/received_notification.dart';
import 'package:todo_app_pro_mina/gen/assets.gen.dart';
import 'package:todo_app_pro_mina/presentation/add_a_task/freezed/freezed_add_a_task.dart';
import 'package:todo_app_pro_mina/services/notification_services.dart';

class AppCubit extends Cubit<AppStates> {
  final Database db;
  AppCubit(this.db) : super(InitAppStates());

  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);

  DateTime startSelectedDate = DateTime.now();
  DateTime initialSelectedDate = DateTime.now();
  DateTime dateTimeSelected = DateTime.now();

  void changeDateTimeSelected(DateTime dateTime) {
    dateTimeSelected = dateTime;
    getTasksInDate();
    emit(DateTimeSelectedState());
  }

  List<String> categories = ["Development", 'Research', 'Design', 'Code'];

  Map<String, Widget> categoriesImage = {
    "Development": AssetGenImage(const $AssetsImagesGen().development.path)
        .image(fit: BoxFit.cover, width: MitX.width * .3),
    'Research': AssetGenImage(const $AssetsImagesGen().research.path)
        .image(fit: BoxFit.cover, width: MitX.width * .3),
    'Design': AssetGenImage(const $AssetsImagesGen().design.path)
        .image(fit: BoxFit.cover, width: MitX.width * .3),
    'Code': AssetGenImage(const $AssetsImagesGen().code.path)
        .image(fit: BoxFit.cover, width: MitX.width * .3)
  };

  TaskModel freezedAddATask = TaskModel(
      title: '',
      category: 'Development',
      date: DateTime.now().toDateString(),
      description: '',
      endTime: '',
      startTime: '');
  int totalDays = 366 * 2;

  List<TaskModel> tasks = [];
  List<TaskModel> tasksInDate = [];

  void getTasks() async {
    tasks = [];

    emit(AppLoadingTaskState());
    List<Map<String, Object?>> list = await db.rawQuery('SELECT * FROM tasks');

    for (Map<String, Object?> value in list) {
      tasks.add(TaskModel.fromJson(value));
    }

    if (tasks.isNotEmpty) {
      DateTime firstDate = tasks[0].date.toDate();
      startSelectedDate =
          firstDate.isAfter(DateTime.now()) ? DateTime.now() : firstDate;
      initialSelectedDate =
          firstDate.isAfter(DateTime.now()) ? DateTime.now() : firstDate;
      dateTimeSelected =
          firstDate.isAfter(DateTime.now()) ? DateTime.now() : firstDate;
      DateTime lastDate = tasks[tasks.length - 1].date.toDate();

      int totalDaysBetweenFistAndLastDays =
          lastDate.difference(firstDate).inDays;
      totalDays = totalDaysBetweenFistAndLastDays >= 360
          ? totalDaysBetweenFistAndLastDays + 1 + 360 * 2
          : 366 * 2;
    }
    getTasksInDate();

    emit(GetAllTasksState());
  }

  void getTasksInDate() {
    tasksInDate = [];
    String dateFormat = DateFormat("yyyy/MM/dd").format(dateTimeSelected);
    for (TaskModel task in tasks) {
      if (task.date.contains(dateFormat)) {
        tasksInDate.add(task);
      }
    }
  }

  void changeDescription(String category) {
    freezedAddATask = freezedAddATask.copyWith(category: category);
    emit(ChangeDescriptionState());
  }

  void addTitle(String title) {
    freezedAddATask = freezedAddATask.copyWith(title: title);
  }

  void addDescription(String desc) {
    freezedAddATask = freezedAddATask.copyWith(description: desc);
  }

  void addDate(String date) {
    freezedAddATask = freezedAddATask.copyWith(date: date);
  }

  void addStartTime(String startTime) {
    freezedAddATask = freezedAddATask.copyWith(startTime: startTime);
  }

  void addEndTime(String endTime) {
    freezedAddATask = freezedAddATask.copyWith(endTime: endTime);
  }

  void addNewTask() async {
    int id = await db.transaction((txn) async => await txn.rawInsert(
        """INSERT INTO tasks(title, description, date, startTime ,endTime , category) 
        VALUES("${freezedAddATask.title}", "${freezedAddATask.description}" ,"${freezedAddATask.date}", "${freezedAddATask.startTime}",
       "${freezedAddATask.endTime}" ,  "${freezedAddATask.category}")"""));

    TaskModel newTaskData = TaskModel(
        id: id,
        title: freezedAddATask.title,
        description: freezedAddATask.description,
        date: freezedAddATask.date,
        startTime: freezedAddATask.startTime,
        endTime: freezedAddATask.endTime,
        category: freezedAddATask.category);

    tasks.add(newTaskData);
    freezedAddATask = TaskModel(
        title: '',
        category: 'Development',
        date: DateTime.now().toDateString(),
        description: '',
        endTime: '',
        startTime: '');
    getTasksInDate();

    emit(TaskAddedState());
  }
}
