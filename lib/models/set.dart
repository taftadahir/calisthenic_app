import 'package:calisthenic_app/models/model.dart';

class Set extends Model {
  @override
  String get tableName => table;
  static String get table => 'sets';
  
  final int? id;
  final String sysId;
  final String workoutSysId;
  final String? prevSetSysId;
  final int? reps;
  final int? time;
  final int? weight;
  final int? restTime;
  final bool completed;

  Set({
    this.id,
    required this.sysId,
    required this.workoutSysId,
    this.prevSetSysId,
    this.reps,
    this.time,
    this.weight,
    this.restTime,
    this.completed = false,
  });

  @override
  Map<String, Object?> toJson() => {
        SetFields.id: id,
        SetFields.sysId: sysId,
        SetFields.workoutSysId: workoutSysId,
        SetFields.prevSetSysId: prevSetSysId,
        SetFields.reps: reps,
        SetFields.time: time,
        SetFields.weight: weight,
        SetFields.restTime: restTime,
        SetFields.completed: completed ? 1 : 0,
      };

  static Set fromJson(Map<String, Object?> json) => Set(
        id: json[SetFields.id] as int?,
        sysId: json[SetFields.sysId] as String,
        workoutSysId: json[SetFields.workoutSysId] as String,
        prevSetSysId: json[SetFields.prevSetSysId] as String?,
        reps: json[SetFields.reps] as int?,
        time: json[SetFields.time] as int?,
        weight: json[SetFields.weight] as int?,
        restTime: json[SetFields.restTime] as int?,
        completed: (json[SetFields.completed] as int) == 1,
      );

  @override
  Set copy({
    int? id,
    String? sysId,
    String? workoutSysId,
    String? prevSetSysId,
    int? reps,
    int? time,
    int? weight,
    int? restTime,
    bool? completed,
  }) =>
      Set(
        id: id ?? this.id,
        sysId: sysId ?? this.sysId,
        workoutSysId: workoutSysId ?? this.workoutSysId,
        prevSetSysId: prevSetSysId ?? this.prevSetSysId,
        reps: reps ?? this.reps,
        time: time ?? this.time,
        weight: weight ?? this.weight,
        restTime: restTime ?? this.restTime,
        completed: completed ?? this.completed,
      );
}

class SetFields {
  static final List<String> values = [
    id,
    sysId,
    workoutSysId,
    prevSetSysId,
    reps,
    time,
    weight,
    restTime,
    completed,
  ];
  static const String id = '_id';
  static const String sysId = 'sys_id';
  static const String workoutSysId = 'workout_sys_id';
  static const String prevSetSysId = 'prev_set_sys_id';
  static const String reps = 'reps';
  static const String time = 'time';
  static const String weight = 'weight';
  static const String restTime = 'rest_time';
  static const String completed = 'completed';
}
