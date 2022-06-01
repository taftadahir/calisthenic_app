import 'dart:convert';

import 'package:calisthenic_app/models/exercise.dart';
import 'package:calisthenic_app/models/program.dart';
import 'package:calisthenic_app/models/workout.dart';
import 'package:get/get.dart';

class ProgramController extends GetxController {
  Program? _program;
  int _nextDay = -1;
  int _activeDay = -1;
  int? _activeProgramImage;
  List<dynamic>? programImages;

  String? images =
      '{"images":["front_lever.png", "front_lever.png", "front_lever.png", "front_lever.png"]}';
  // String? images;

  String? description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eget nam in sit. Ultricies vehicula montes, neque, pulvinar vulputate enim felis, porttitor amet. Massa, sagittis bibendum ut eu lectus maecenas. At sed maecenas a dignissim lectus.';

  String? tips =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eget nam in sit. Ultricies vehicula montes, neque, pulvinar vulputate enim felis, porttitor amet. Massa, sagittis bibendum ut eu lectus maecenas. At sed maecenas a dignissim lectus.';

  List<Program> get programs => [
        Program(
          id: 0,
          name: 'Push Up',
          days: 15,
          images: images,
          description: description,
          tips: tips,
        ),
        Program(
          id: 1,
          name: 'Pull Up',
          days: 60,
          images: images,
          description: description,
          tips: tips,
        ),
        Program(
          id: 2,
          name: 'Pull Up',
          days: 20,
          images: images,
          description: description,
          tips: tips,
        ),
        Program(
          id: 3,
          name: 'Pull Up',
          days: 11,
          images: images,
          description: description,
          tips: tips,
        ),
        Program(
          id: 4,
          name: 'Pull Up',
          days: 10,
          images: images,
          description: description,
          tips: tips,
        ),
      ];

  List<Program> get skills => [
        Program(
          id: 0,
          name: 'Push Up',
          days: 30,
          images: images,
          description: description,
          tips: tips,
        ),
        Program(
          id: 1,
          name: 'Pull Up',
          days: 25,
          images: images,
          description: description,
          tips: tips,
        ),
        Program(
          id: 2,
          name: 'Pull Up',
          days: 5,
          images: images,
          description: description,
          tips: tips,
        ),
        Program(
          id: 3,
          name: 'Pull Up',
          days: 4,
          images: images,
          description: description,
          tips: tips,
        ),
        Program(
          id: 4,
          name: 'Pull Up',
          days: 30,
          images: images,
          description: description,
          tips: tips,
        ),
      ];

  Program? get program => _program;
  set program(Program? program) {
    _program = program;
    // Need to update the next day and the active day
    if (program != null) {
      nextDay = program.days ~/ 2;
      activeDay = nextDay;
      programImages = jsonDecode(program.images ?? '{"images":[]}')['images']
          as List<dynamic>;
      if (programImages!.isNotEmpty) {
        _activeProgramImage = 0;
      }
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

  int get activeProgramImage => _activeProgramImage ?? -1;
  set activeProgramImage(int activeProgramImage) {
    _activeProgramImage = activeProgramImage;
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
