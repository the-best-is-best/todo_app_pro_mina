import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_pro_mina/cubit/app_states.dart';
import 'package:todo_app_pro_mina/presentation/add_a_task/freezed/freezed_add_a_task.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitAppStates());

  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);

  DateTime startSelectedDate = DateTime.now();
  DateTime initialSelectedDate = DateTime.now();
  DateTime dateTimeSelected = DateTime.now();

  void changeDateTimeSelected(DateTime dateTime) {
    dateTimeSelected = dateTime;
    emit(DateTimeSelectedState());
  }

  List<String> categories = ["Development", 'Research', 'Design', 'Backend'];
  FreezedAddATask freezedAddATask = FreezedAddATask(
      title: '',
      category: 'Development',
      date: '',
      description: '',
      endTime: '',
      startTime: '');

  void changeDescription(String category) {
    freezedAddATask = freezedAddATask.copyWith(category: category);
    emit(ChangeDescriptionState());
  }
}
