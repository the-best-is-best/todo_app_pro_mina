// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freezed_add_a_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FreezedAddATask _$$_FreezedAddATaskFromJson(Map<String, dynamic> json) =>
    _$_FreezedAddATask(
      title: json['title'] as String,
      category: json['category'] as String,
      date: json['date'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$_FreezedAddATaskToJson(_$_FreezedAddATask instance) =>
    <String, dynamic>{
      'title': instance.title,
      'category': instance.category,
      'date': instance.date,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'description': instance.description,
    };
