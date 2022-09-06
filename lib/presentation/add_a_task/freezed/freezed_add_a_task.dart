import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_add_a_task.freezed.dart';
part 'freezed_add_a_task.g.dart';

@freezed
class TaskModel with _$TaskModel {
  factory TaskModel(
      {int? id,
      required String title,
      required String category,
      required String date,
      required String startTime,
      required String endTime,
      required String description}) = _TaskModel;

  factory TaskModel.fromJson(Map<String, Object?> json) =>
      _$TaskModelFromJson(json);
}
