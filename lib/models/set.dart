import 'package:calisthenic_app/models/workout.dart';

class Set {
  final int id;
  final Workout workout;
  final int? reps;
  final int? time;
  final int? weight;
  final int? doneReps;
  final int? doneTime;
  final int? doneWeight;
  final int? restTime;
  final Set? prevSet;
  final bool completed;

  Set({
    required this.id,
    required this.workout,
    this.reps,
    this.time,
    this.weight,
    this.doneReps,
    this.doneTime,
    this.doneWeight,
    this.restTime,
    this.prevSet,
    this.completed = false,
  });
}
