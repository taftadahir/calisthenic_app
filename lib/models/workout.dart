import 'package:calisthenic_app/models/exercise.dart';
import 'package:calisthenic_app/models/program.dart';

class Workout {
  final int id;
  final WorkoutType workoutType;
  final Exercise exercise;
  final int day;
  final Program program;
  final Workout? prev;
  final bool completed;

  Workout({
    required this.id,
    required this.day,
    this.workoutType = WorkoutType.workout,
    required this.exercise,
    required this.program,
    this.prev,

    // completed: calculated depending on sets stats
    this.completed = false,
  });
}

enum WorkoutType {
  warmUp,
  workout,
  stretch,
  coolDown,
}
