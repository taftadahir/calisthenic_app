import 'dart:convert';

import 'package:calisthenic_app/database/app_database.dart';
import 'package:calisthenic_app/models/exercise.dart';
import 'package:calisthenic_app/models/program.dart';
import 'package:calisthenic_app/models/workout.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  // Used in Program screen, Program detail screen, result screen
  Program? _program;

  // get all programs used in home screen
  late List<Program> programs;

  // All list of workouts for the program
  late List<Workout> workouts;

  // get all skills used in home screen
  // late List<Program> skills;

  // used for program screen to show workouts for that day
  int _nextDay = -1;

  // used to show workouts for program on that day
  int _activeDay = -1;

  // used to show image for the program in program detail screen
  int? _activeImageIndex;

  // Contain program images for program detail screen
  List<dynamic>? images;

  // Used for workout on screen
  // Workout? _workout;

  // used for program screen to show workouts for that day
  // int _activeWorkoutIndex = -1;

  // used to determine which workout is used
  String? _activeWorkoutSysId;

  Program? get program => _program;
  set program(Program? program) {
    _program = program;
    // Need to update the next day and the active day
    if (program != null) {
      // TODO: Update the next day
      nextDay = program.lastCompletedDay;

      // TODO: The active day should be the same as the next day
      activeDay = nextDay + 1 <= program.days ? nextDay + 1 : nextDay;

      // TODO: Update the list of images
      images = jsonDecode((program.images == null || program.images == '')
          ? "[]"
          : program.images!) as List<dynamic>;

      // TODO: If list of images not null, then update the active image index property
      if (images!.isNotEmpty) {
        _activeImageIndex = 0;
      }

      // Update the list of workouts
      workouts = [];
    }
    update();
  }

  int get nextDay => _nextDay;
  set nextDay(int day) {
    _nextDay = day;
    update();
  }

  // int get activeWorkoutIndex => _activeWorkoutIndex;
  // set activeWorkoutIndex(int index) {
  //   if (index >= -1 && index < workouts.length) {
  //     _activeWorkoutIndex = index;
  //     update();
  //   }
  // }
  int get activeDay => _activeDay;
  set activeDay(int day) {
    if (_activeDay != day) {
      _activeDay = day;
      update();
    }
  }

  String? get activeWorkoutSysId => _activeWorkoutSysId;
  set activeWorkoutSysId(String? activeWorkoutSysId) {
    if (activeWorkoutSysId != null) {
      _activeWorkoutSysId = activeWorkoutSysId;

      Workout workout = workouts
          .where(
            (workout) => workout.sysId == _activeWorkoutSysId,
          )
          .first;

      // Getting the next exercise workout
      Future<Exercise?> exercise =
          AppDatabase.instance.readExercise(workout.exerciseSysId);

      // Update the program image and index
      exercise.then((ex) {
        if (ex != null) {
          images = jsonDecode(
                  (ex.images == null || ex.images == '') ? "[]" : ex.images!)
              as List<dynamic>;

          if (images!.isNotEmpty) {
            _activeImageIndex = 0;
          }
        }
      });
      update();
    }
  }
  // Workout? get workout => _workout;
  // set workout(Workout? workout) {
  //   _workout = workout;
  //   update();
  // }

  int get activeImageIndex => _activeImageIndex ?? -1;
  set activeImageIndex(int activeImageIndex) {
    _activeImageIndex = activeImageIndex;
    update();
  }

  // TODO: Get Program workout
  Future updateWorkouts() async {
    final db = AppDatabase.instance;
    workouts = await db.readAllWorkouts(_program!.sysId);

    // Read program workouts
    // return program == null
    //     ? []
    //     : List.generate(
    //         workoutType == WorkoutType.warmUp
    //             ? 3
    //             : (workoutType == WorkoutType.workout ? 10 : 4),
    //         (index) => Workout(
    //           sysId: 'WRK001',
    //           id: index,
    //           day: nextDay,
    //           workoutType: workoutType,
    //           completed: workoutType == WorkoutType.warmUp ? true : false,
    //           skipped: workoutType == WorkoutType.workout ? true : false,
    //           exerciseSysId: 'EXE002',
    //           programSysId: 'PRG001',
    //         ),
    //       );
  }

  // TODO: Refresh datas
  // Future getPrograms() async {
  //   final db = AppDatabase.instance;

  //   // Refresh home screen data
  //   programs = await db.readAllPrograms();
  //   update();
  // }

  Future getPrograms() async {
    final db = AppDatabase.instance;

    // Refresh home screen data
    programs = await db.readAllPrograms();
    update();
    // return await db.readAllPrograms();
  }

  // TODO: Remove refreshdatas call from here when I use future builder in home screen
  @override
  void onInit() async {
    super.onInit();
    programs = [];
    workouts = [];
    // await getPrograms();
    // await updateWorkouts();
  }
}
