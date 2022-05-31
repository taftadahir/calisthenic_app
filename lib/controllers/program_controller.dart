import 'package:calisthenic_app/models/exercise.dart';
import 'package:calisthenic_app/models/program.dart';
import 'package:calisthenic_app/models/workout.dart';
import 'package:get/get.dart';

class ProgramController extends GetxController {
  Program? _program;
  int _nextDay = -1;
  int _activeDay = -1;

  List<Program> get programs => [
        Program(id: 0, name: 'Push Up', days: 15),
        Program(id: 1, name: 'Pull Up', days: 60),
        Program(id: 2, name: 'Pull Up', days: 20),
        Program(id: 3, name: 'Pull Up', days: 11),
        Program(id: 4, name: 'Pull Up', days: 10),
      ];

  List<Program> get skills => [
        Program(id: 0, name: 'Push Up', days: 30),
        Program(id: 1, name: 'Pull Up', days: 25),
        Program(id: 2, name: 'Pull Up', days: 5),
        Program(id: 3, name: 'Pull Up', days: 4),
        Program(id: 4, name: 'Pull Up', days: 30),
      ];

  Program? get program => _program;
  set program(Program? program) {
    _program = program;
    // Need to update the next day and the active day
    if (program != null) {
      nextDay = program.days ~/ 2;
      activeDay = nextDay;
    }
    update();
  }

  int get nextDay => _nextDay;
  set nextDay(int day) {
    _nextDay = day;
    update();
  }

  int get activeDay => _activeDay;
  set activeDay(int day) {
    _activeDay = day;
    update();
  }

  List<Workout> workouts({
    Program? program,
    required WorkoutType workoutType,
  }) =>
      program == null
          ? []
          : List.generate(
              workoutType == WorkoutType.warmUp
                  ? 3
                  : (workoutType == WorkoutType.workout ? 10 : 4),
              (index) => Workout(
                id: 1,
                day: nextDay,
                workoutType: workoutType,
                completed: workoutType == WorkoutType.warmUp ? true : false,
                exercise: Exercise(
                  id: 1,
                  name: 'Pull Up',
                ),
                program: Program(
                  id: 0,
                  name: "One handstand",
                  days: 30,
                ),
              ),
            );
}
