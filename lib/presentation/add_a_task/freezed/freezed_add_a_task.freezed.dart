// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'freezed_add_a_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FreezedAddATask _$FreezedAddATaskFromJson(Map<String, dynamic> json) {
  return _FreezedAddATask.fromJson(json);
}

/// @nodoc
mixin _$FreezedAddATask {
  String get title => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FreezedAddATaskCopyWith<FreezedAddATask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreezedAddATaskCopyWith<$Res> {
  factory $FreezedAddATaskCopyWith(
          FreezedAddATask value, $Res Function(FreezedAddATask) then) =
      _$FreezedAddATaskCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String category,
      String date,
      String startTime,
      String endTime,
      String description});
}

/// @nodoc
class _$FreezedAddATaskCopyWithImpl<$Res>
    implements $FreezedAddATaskCopyWith<$Res> {
  _$FreezedAddATaskCopyWithImpl(this._value, this._then);

  final FreezedAddATask _value;
  // ignore: unused_field
  final $Res Function(FreezedAddATask) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? category = freezed,
    Object? date = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_FreezedAddATaskCopyWith<$Res>
    implements $FreezedAddATaskCopyWith<$Res> {
  factory _$$_FreezedAddATaskCopyWith(
          _$_FreezedAddATask value, $Res Function(_$_FreezedAddATask) then) =
      __$$_FreezedAddATaskCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String category,
      String date,
      String startTime,
      String endTime,
      String description});
}

/// @nodoc
class __$$_FreezedAddATaskCopyWithImpl<$Res>
    extends _$FreezedAddATaskCopyWithImpl<$Res>
    implements _$$_FreezedAddATaskCopyWith<$Res> {
  __$$_FreezedAddATaskCopyWithImpl(
      _$_FreezedAddATask _value, $Res Function(_$_FreezedAddATask) _then)
      : super(_value, (v) => _then(v as _$_FreezedAddATask));

  @override
  _$_FreezedAddATask get _value => super._value as _$_FreezedAddATask;

  @override
  $Res call({
    Object? title = freezed,
    Object? category = freezed,
    Object? date = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_FreezedAddATask(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FreezedAddATask implements _FreezedAddATask {
  _$_FreezedAddATask(
      {required this.title,
      required this.category,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.description});

  factory _$_FreezedAddATask.fromJson(Map<String, dynamic> json) =>
      _$$_FreezedAddATaskFromJson(json);

  @override
  final String title;
  @override
  final String category;
  @override
  final String date;
  @override
  final String startTime;
  @override
  final String endTime;
  @override
  final String description;

  @override
  String toString() {
    return 'FreezedAddATask(title: $title, category: $category, date: $date, startTime: $startTime, endTime: $endTime, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FreezedAddATask &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality().equals(other.endTime, endTime) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(startTime),
      const DeepCollectionEquality().hash(endTime),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$$_FreezedAddATaskCopyWith<_$_FreezedAddATask> get copyWith =>
      __$$_FreezedAddATaskCopyWithImpl<_$_FreezedAddATask>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FreezedAddATaskToJson(
      this,
    );
  }
}

abstract class _FreezedAddATask implements FreezedAddATask {
  factory _FreezedAddATask(
      {required final String title,
      required final String category,
      required final String date,
      required final String startTime,
      required final String endTime,
      required final String description}) = _$_FreezedAddATask;

  factory _FreezedAddATask.fromJson(Map<String, dynamic> json) =
      _$_FreezedAddATask.fromJson;

  @override
  String get title;
  @override
  String get category;
  @override
  String get date;
  @override
  String get startTime;
  @override
  String get endTime;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_FreezedAddATaskCopyWith<_$_FreezedAddATask> get copyWith =>
      throw _privateConstructorUsedError;
}
