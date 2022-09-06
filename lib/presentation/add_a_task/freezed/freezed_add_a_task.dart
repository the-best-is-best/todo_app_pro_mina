import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_add_a_task.freezed.dart';
part 'freezed_add_a_task.g.dart';

@freezed
class FreezedAddATask with _$FreezedAddATask {
  factory FreezedAddATask(
      {required String title,
      required String category,
      required String date,
      required String startTime,
      required String endTime,
      required String description}) = _FreezedAddATask;
  factory FreezedAddATask.fromJson(Map<String, Object?> json) =>
      _$FreezedAddATaskFromJson(json);
}
