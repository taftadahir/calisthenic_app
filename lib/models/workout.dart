import 'package:calisthenic_app/models/model.dart';

class Workout extends Model {
  @override
  String get tableName => table;
  static String get table => 'workouts';

  final int? id;
  final String sysId;
  final String programSysId;
  final String exerciseSysId;
  final String? prevWorkoutSysId;
  final WorkoutType workoutType;
  final int? reps;
  final int? time;
  final int? weight;
  final int restTime;
  final int day;
  bool completed;
  bool skipped;

  Workout({
    this.id,
    required this.sysId,
    required this.programSysId,
    required this.exerciseSysId,
    required this.day,
    this.prevWorkoutSysId,
    this.workoutType = WorkoutType.workout,
    this.reps,
    this.time,
    this.weight,
    required this.restTime,
    this.completed = false,
    this.skipped = false,
  });

  @override
  Map<String, Object?> toJson() {
    String workoutTypeString = '';
    switch (workoutType) {
      case WorkoutType.warmUp:
        workoutTypeString = 'warm_up';
        break;
      case WorkoutType.coolDown:
        workoutTypeString = 'cool_down';
        break;
      default:
        {
          workoutTypeString = 'workout';
        }
    }
    return {
      WorkoutFields.id: id,
      WorkoutFields.sysId: sysId,
      WorkoutFields.programSysId: programSysId,
      WorkoutFields.exerciseSysId: exerciseSysId,
      WorkoutFields.prevWorkoutSysId: prevWorkoutSysId,
      WorkoutFields.workoutType: workoutTypeString,
      WorkoutFields.day: day,
      WorkoutFields.completed: completed ? 1 : 0,
      WorkoutFields.skipped: skipped ? 1 : 0,
      WorkoutFields.reps: reps,
      WorkoutFields.time: time,
      WorkoutFields.weight: weight,
      WorkoutFields.restTime: restTime,
    };
  }

  static Workout fromJson(
    Map<String, Object?> json,
  ) {
    WorkoutType? workoutType;
    switch (json[WorkoutFields.workoutType]) {
      case 'warm_up':
        workoutType = WorkoutType.warmUp;
        break;
      case 'cool_down':
        workoutType = WorkoutType.coolDown;
        break;
      default:
        {
          workoutType = WorkoutType.workout;
        }
    }

    return Workout(
      id: json[WorkoutFields.id] as int?,
      sysId: json[WorkoutFields.sysId] as String,
      exerciseSysId: json[WorkoutFields.exerciseSysId] as String,
      programSysId: json[WorkoutFields.programSysId] as String,
      workoutType: workoutType,
      prevWorkoutSysId: json[WorkoutFields.prevWorkoutSysId] as String?,
      day: json[WorkoutFields.day] as int,
      completed: (json[WorkoutFields.completed] as int) == 1,
      skipped: (json[WorkoutFields.skipped] as int) == 1,
      reps: json[WorkoutFields.reps] as int?,
      time: json[WorkoutFields.time] as int?,
      restTime: json[WorkoutFields.restTime] as int,
      weight: json[WorkoutFields.weight] as int?,
    );
  }

  @override
  Workout copy({
    int? id,
    String? sysId,
    String? exerciseSysId,
    String? programSysId,
    String? prevWorkoutSysId,
    WorkoutType? workoutType,
    int? day,
    bool? completed,
    bool? skipped,
    int? reps,
    int? time,
    int? weight,
    int? restTime,
    int? order,
  }) =>
      Workout(
        id: id ?? this.id,
        sysId: sysId ?? this.sysId,
        exerciseSysId: exerciseSysId ?? this.exerciseSysId,
        workoutType: workoutType ?? this.workoutType,
        programSysId: programSysId ?? this.programSysId,
        prevWorkoutSysId: prevWorkoutSysId ?? this.prevWorkoutSysId,
        day: day ?? this.day,
        completed: completed ?? this.completed,
        skipped: skipped ?? this.skipped,
        reps: reps ?? this.reps,
        time: time ?? this.time,
        weight: weight ?? this.weight,
        restTime: restTime ?? this.restTime,
      );
}

enum WorkoutType {
  warmUp,
  workout,
  coolDown,
}

class WorkoutFields {
  static final List<String> values = [
    id,
    sysId,
    completed,
    skipped,
    exerciseSysId,
    workoutType,
    day,
    prevWorkoutSysId,
    programSysId,
    reps,
    time,
    weight,
    restTime,
  ];
  static const String id = '_id';
  static const String sysId = 'sys_id';
  static const String exerciseSysId = 'exercise_sys_id';
  static const String programSysId = 'program_sys_id';
  static const String prevWorkoutSysId = 'prev_workout_sys_id';
  static const String workoutType = 'workout_type';
  static const String day = 'w_day';
  static const String completed = 'completed';
  static const String skipped = 'skipped';
  static const String reps = 'reps';
  static const String time = 'time';
  static const String weight = 'weight';
  static const String restTime = 'rest_time';
}
