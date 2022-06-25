import 'package:calisthenic_app/constants/database_constant.dart';
import 'package:calisthenic_app/models/exercise.dart';
import 'package:calisthenic_app/models/model.dart';
import 'package:calisthenic_app/models/program.dart';
import 'package:calisthenic_app/models/workout.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static final AppDatabase instance = AppDatabase._init();
  static Database? _database;
  AppDatabase._init();

  Future<Database> get database async {
    _database ??= await _initializeDatabase(DatabaseConstant.kDatabaseName);
    return _database!;
  }

  Future<Database> _initializeDatabase(String dbFileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbFileName);

    return await openDatabase(
      path,
      version: DatabaseConstant.kVersion,
      onCreate: _createDatabase,
    );
  }

  Future _createDatabase(Database db, int version) async {
    // Types
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const boolType = "BOOLEAN NOT NULL";
    const numberType = "INTEGER";
    const textType = "TEXT";

    // Create exercises table schema
    await db.execute('''
    CREATE TABLE ${Exercise.table} (
      ${ExerciseFields.id} $idType,
      ${ExerciseFields.sysId} $textType NOT NULL,
      ${ExerciseFields.name} $textType NOT NULL,
      ${ExerciseFields.images} $textType,
      ${ExerciseFields.description} $textType,
      ${ExerciseFields.tips} $textType
    )
    ''');

    // Create programs table schema
    await db.execute('''
    CREATE TABLE ${Program.table} (
      ${ProgramFields.id} $idType,
      ${ProgramFields.sysId} $textType NOT NULL,
      ${ProgramFields.name} $textType NOT NULL,
      ${ProgramFields.days} $numberType NOT NULL,
      ${ProgramFields.lastCompletedDay} $numberType NOT NULL,
      ${ProgramFields.isSkill} $boolType,
      ${ProgramFields.images} $textType,
      ${ProgramFields.description} $textType,
      ${ProgramFields.tips} $textType
    )
    ''');

    // Create sets table schema
    // await db.execute('''
    // CREATE TABLE ${Set.table} (
    //   ${SetFields.id} $idType,
    //   ${SetFields.sysId} $textType NOT NULL,
    //   ${SetFields.workoutSysId} $textType NOT NULL,
    //   ${SetFields.prevSetSysId} $numberType,
    //   ${SetFields.reps} $numberType,
    //   ${SetFields.time} $numberType,
    //   ${SetFields.weight} $numberType,
    //   ${SetFields.restTime} $numberType,
    //   ${SetFields.completed} $boolType
    // )
    // ''');

    // Create workouts table schema
    await db.execute('''
    CREATE TABLE ${Workout.table} (
      ${WorkoutFields.id} $idType,
      ${WorkoutFields.sysId} $textType NOT NULL,
      ${WorkoutFields.programSysId} $textType NOT NULL,
      ${WorkoutFields.exerciseSysId} $textType NOT NULL,
      ${WorkoutFields.prevWorkoutSysId} $textType,
      ${WorkoutFields.workoutType} $textType NOT NULL,
      ${WorkoutFields.day} $numberType,
      ${WorkoutFields.completed} $boolType,
      ${WorkoutFields.skipped} $boolType,
      ${WorkoutFields.reps} $numberType,
      ${WorkoutFields.weight} $numberType,
      ${WorkoutFields.time} $numberType,
      ${WorkoutFields.restTime} $numberType
    )
    ''');
  }

  // Datas
  List<Program> get programs {
    // These properties to delete
    String? images =
        '["front_lever.png", "front_lever.png", "front_lever.png", "front_lever.png"]';

    String? description =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eget nam in sit. Ultricies vehicula montes, neque, pulvinar vulputate enim felis, porttitor amet. Massa, sagittis bibendum ut eu lectus maecenas. At sed maecenas a dignissim lectus.';

    String? tips =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eget nam in sit. Ultricies vehicula montes, neque, pulvinar vulputate enim felis, porttitor amet. Massa, sagittis bibendum ut eu lectus maecenas. At sed maecenas a dignissim lectus.';
    return [
      // Program(
      //   sysId: 'PRG1',
      //   name: 'Push Up',
      //   days: 15,
      //   lastCompletedDay: 10,
      //   images: images,
      //   description: description,
      //   tips: tips,
      // ),
      // Program(
      //   sysId: 'PRG2',
      //   name: 'Pull Up',
      //   days: 10,
      //   lastCompletedDay: 7,
      //   images: images,
      //   description: description,
      //   tips: tips,
      // ),
      Program(
        sysId: 'PRG5',
        name: 'For test',
        days: 2,
        lastCompletedDay: 0,
        images: images,
        description: description,
        tips: tips,
      ),
    ];
  }

  List<Program> get skills {
    // These properties to delete
    String? images =
        '["front_lever.png", "front_lever.png", "front_lever.png"]';

    String? description =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eget nam in sit. Ultricies vehicula montes, neque, pulvinar vulputate enim felis, porttitor amet. Massa, sagittis bibendum ut eu lectus maecenas. At sed maecenas a dignissim lectus.';

    String? tips =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eget nam in sit. Ultricies vehicula montes, neque, pulvinar vulputate enim felis, porttitor amet. Massa, sagittis bibendum ut eu lectus maecenas. At sed maecenas a dignissim lectus.';
    return [
      // Program(
      //   sysId: 'PRG3',
      //   name: 'Push Up',
      //   days: 5,
      //   lastCompletedDay: 2,
      //   images: images,
      //   description: description,
      //   tips: tips,
      //   isSkill: true,
      // ),
      // Program(
      //   sysId: 'PRG4',
      //   name: 'Pull Up',
      //   days: 7,
      //   lastCompletedDay: 5,
      //   images: images,
      //   description: description,
      //   tips: tips,
      //   isSkill: true,
      // ),
    ];
  }

  List<Exercise> get exercises {
    String? images = '["front_lever.png", "front_lever.png"]';
    String? description =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eget nam in sit. Ultricies vehicula montes, neque, pulvinar vulputate enim felis, porttitor amet. Massa, sagittis bibendum ut eu lectus maecenas. At sed maecenas a dignissim lectus.';

    String? tips =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eget nam in sit. Ultricies vehicula montes, neque, pulvinar vulputate enim felis, porttitor amet. Massa, sagittis bibendum ut eu lectus maecenas. At sed maecenas a dignissim lectus.';
    return [
      Exercise(
        sysId: 'EXE1',
        name: 'Push Up',
        images: images,
        description: description,
        tips: tips,
      ),
      Exercise(
        sysId: 'EXE2',
        name: 'Pull Up',
        images: images,
        description: description,
        tips: tips,
      ),
      Exercise(
        sysId: 'EXE3',
        name: 'Diamond Push Up',
        images: images,
        description: description,
        tips: tips,
      ),
      Exercise(
        sysId: 'EXE4',
        name: 'Spiderman Push Up',
        images: images,
        description: description,
        tips: tips,
      ),
      Exercise(
        sysId: 'EXE5',
        name: 'Front lever',
        images: images,
        description: description,
        tips: tips,
      ),
    ];
  }

  List<Workout> get workouts {
    List<Workout> workouts = [];

    // Workouts for programs
    for (var j = 0; j < programs.length - 1; j++) {
      var program = programs[j];
      // for (var i = 0; i < program.days; i++) {
      //   bool completed = i + 1 <= program.lastCompletedDay;
      //   String programSysId = program.sysId;

      //   workouts.addAll(List.generate(
      //     3,
      //     (index) => Workout(
      //       sysId: 'WRK-0-$j-$i-$index',
      //       prevWorkoutSysId: index == 0 ? null : 'WRK-0-$j-$i-${index - 1}',
      //       day: i + 1,
      //       workoutType: WorkoutType.warmUp,
      //       completed: completed,
      //       skipped: false,
      //       exerciseSysId: 'EXE1',
      //       programSysId: programSysId,
      //       weight: 25,
      //       reps: 30,
      //     ),
      //   ));

      //   workouts.addAll(List.generate(
      //     10,
      //     (index) => Workout(
      //       sysId: 'WRK-1-$j-$i-$index',
      //       prevWorkoutSysId: index == 0 ? null : 'WRK-1-$j-$i-${index - 1}',
      //       day: i + 1,
      //       workoutType: WorkoutType.workout,
      //       completed: completed,
      //       skipped: false,
      //       exerciseSysId: 'EXE2',
      //       programSysId: programSysId,
      //       weight: 25,
      //       reps: 30,
      //     ),
      //   ));

      //   workouts.addAll(List.generate(
      //     4,
      //     (index) => Workout(
      //       sysId: 'WRK-2-$j-$i-$index',
      //       prevWorkoutSysId: index == 0 ? null : 'WRK-2-$j-$i-${index - 1}',
      //       day: i + 1,
      //       workoutType: WorkoutType.coolDown,
      //       completed: completed,
      //       skipped: false,
      //       exerciseSysId: 'EXE3',
      //       programSysId: programSysId,
      //       weight: 25,
      //       reps: 30,
      //     ),
      //   ));
      // }
    }

    // Workouts for skills
    for (var j = 0; j < skills.length; j++) {
      var skill = skills[j];
      // for (var i = 0; i < skill.days; i++) {
      //   bool completed = i + 1 <= skill.lastCompletedDay;
      //   String programSysId = skill.sysId;
      //   workouts.addAll(List.generate(
      //     5,
      //     (index) => Workout(
      //       sysId: 'WRK-3-$j-$i-$index',
      //       prevWorkoutSysId: index == 0 ? null : 'WRK-3-$j-$i-${index - 1}',
      //       day: i + 1,
      //       workoutType: WorkoutType.warmUp,
      //       completed: completed,
      //       skipped: false,
      //       exerciseSysId: 'EXE1',
      //       programSysId: programSysId,
      //       weight: 205,
      //       time: 300,
      //     ),
      //   ));

      //   workouts.addAll(List.generate(
      //     15,
      //     (index) => Workout(
      //       sysId: 'WRK-4-$j-$i-$index',
      //       prevWorkoutSysId: index == 0 ? null : 'WRK-4-$j-$i-${index - 1}',
      //       day: i + 1,
      //       workoutType: WorkoutType.workout,
      //       completed: completed,
      //       skipped: false,
      //       exerciseSysId: 'EXE4',
      //       programSysId: programSysId,
      //       weight: 205,
      //       time: 300,
      //     ),
      //   ));

      //   workouts.addAll(List.generate(
      //     5,
      //     (index) => Workout(
      //       sysId: 'WRK-5-$j-$i-$index',
      //       prevWorkoutSysId: index == 0 ? null : 'WRK-5-$j-$i-${index - 1}',
      //       day: i + 1,
      //       workoutType: WorkoutType.coolDown,
      //       completed: completed,
      //       skipped: false,
      //       exerciseSysId: 'EXE3',
      //       programSysId: programSysId,
      //       weight: 205,
      //       time: 300,
      //     ),
      //   ));
      // }
    }

    // Workouts for test program
    workouts.addAll([
      Workout(
        sysId: 'WRK6',
        day: 1,
        workoutType: WorkoutType.warmUp,
        completed: false,
        skipped: false,
        exerciseSysId: 'EXE1',
        programSysId: 'PRG5',
        weight: 10,
        reps: 10,
        restTime: 30,
      ),
      Workout(
        sysId: 'WRK7',
        prevWorkoutSysId: 'WRK6',
        day: 1,
        workoutType: WorkoutType.warmUp,
        completed: false,
        skipped: false,
        exerciseSysId: 'EXE2',
        programSysId: 'PRG5',
        weight: 15,
        reps: 15,
        restTime: 10,
      ),
    ]);
    workouts.addAll([
      Workout(
        sysId: 'WRK8',
        prevWorkoutSysId: 'WRK7',
        day: 1,
        workoutType: WorkoutType.workout,
        completed: false,
        skipped: false,
        exerciseSysId: 'EXE4',
        programSysId: 'PRG5',
        weight: 30,
        // reps: 40,
        time: 10,
        restTime: 20,
      ),
      Workout(
        sysId: 'WRK9',
        prevWorkoutSysId: 'WRK8',
        day: 1,
        workoutType: WorkoutType.workout,
        completed: false,
        skipped: false,
        exerciseSysId: 'EXE1',
        programSysId: 'PRG5',
        weight: 150,
        // reps: 150,
        time: 15,
        restTime: 15,
      ),
      Workout(
        sysId: 'WRK10',
        prevWorkoutSysId: 'WRK9',
        day: 1,
        workoutType: WorkoutType.workout,
        completed: false,
        skipped: false,
        exerciseSysId: 'EXE2',
        programSysId: 'PRG5',
        weight: 80,
        reps: 80,
        restTime: 5,
      ),
    ]);
    workouts.addAll([
      Workout(
        sysId: 'WRK11',
        prevWorkoutSysId: 'WRK10',
        day: 1,
        workoutType: WorkoutType.coolDown,
        completed: false,
        skipped: false,
        exerciseSysId: 'EXE3',
        programSysId: 'PRG5',
        weight: 107,
        reps: 107,
        restTime: 30,
      ),
      Workout(
        sysId: 'WRK12',
        prevWorkoutSysId: 'WRK11',
        day: 1,
        workoutType: WorkoutType.coolDown,
        completed: false,
        skipped: false,
        exerciseSysId: 'EXE4',
        programSysId: 'PRG5',
        weight: 157,
        reps: 175,
        restTime: 50,
      ),
    ]);

    workouts.addAll([
      Workout(
        sysId: 'WRK13',
        day: 2,
        workoutType: WorkoutType.warmUp,
        completed: false,
        skipped: false,
        exerciseSysId: 'EXE2',
        programSysId: 'PRG5',
        weight: 100,
        reps: 100,
        restTime: 30,
      ),
      Workout(
        sysId: 'WRK14',
        prevWorkoutSysId: 'WRK13',
        day: 2,
        workoutType: WorkoutType.warmUp,
        completed: false,
        skipped: false,
        exerciseSysId: 'EXE2',
        programSysId: 'PRG5',
        weight: 16,
        reps: 16,
        restTime: 10,
      ),
    ]);
    workouts.addAll([
      Workout(
        sysId: 'WRK15',
        prevWorkoutSysId: 'WRK14',
        day: 2,
        workoutType: WorkoutType.workout,
        completed: false,
        skipped: false,
        exerciseSysId: 'EXE4',
        programSysId: 'PRG5',
        weight: 300,
        // reps: 40,
        time: 20,
        restTime: 30,
      ),
      Workout(
        sysId: 'WRK16',
        prevWorkoutSysId: 'WRK15',
        day: 2,
        workoutType: WorkoutType.workout,
        completed: false,
        skipped: false,
        exerciseSysId: 'EXE3',
        programSysId: 'PRG5',
        weight: 1500,
        // reps: 1501,
        time: 100,
        restTime: 30,
      ),
      Workout(
        sysId: 'WRK17',
        prevWorkoutSysId: 'WRK16',
        day: 2,
        workoutType: WorkoutType.workout,
        completed: false,
        skipped: false,
        exerciseSysId: 'EXE2',
        programSysId: 'PRG5',
        weight: 180,
        reps: 180,
        restTime: 2,
      ),
    ]);
    workouts.addAll([
      Workout(
        sysId: 'WRK18',
        prevWorkoutSysId: 'WRK17',
        day: 2,
        workoutType: WorkoutType.coolDown,
        completed: false,
        skipped: false,
        exerciseSysId: 'EXE1',
        programSysId: 'PRG5',
        weight: 107,
        reps: 107,
        restTime: 80,
      ),
      Workout(
        sysId: 'WRK19',
        prevWorkoutSysId: 'WRK18',
        day: 2,
        workoutType: WorkoutType.coolDown,
        completed: false,
        skipped: false,
        exerciseSysId: 'EXE4',
        programSysId: 'PRG5',
        weight: 157,
        reps: 175,
        restTime: 30,
      ),
    ]);

    return workouts;
  }

  // Create models
  // Future<Exercise> createExercise(Exercise exercise) async {
  //   final db = await instance.database;
  //   final id = await db.insert(Exercise.tableName, exercise.toJson());
  //   return exercise.copy(id: id);
  // }

  Future<Model> createModel(Model model) async {
    final db = await instance.database;
    final id = await db.insert(model.tableName, model.toJson());
    return model.copy(id: id);
  }

  // Future<Program> createProgram(Program program) async {
  //   final db = await instance.database;
  //   final id = await db.insert(Program.tableName, program.toJson());
  //   return program.copy(id: id);
  // }

  // Future<Set> createSet(Set set) async {
  //   final db = await instance.database;
  //   final id = await db.insert(Set.tableName, set.toJson());
  //   return set.copy(id: id);
  // }

  // Future<Workout> createWorkout(Workout workout) async {
  //   final db = await instance.database;
  //   final id = await db.insert(Workout.tableName, workout.toJson());
  //   return workout.copy(id: id);
  // }

  // Read models
  Future<Exercise?> readExercise(String sysId) async {
    final db = await instance.database;
    final maps = await db.query(
      Exercise.table,
      columns: ExerciseFields.values,
      where: '${ExerciseFields.sysId} = ?',
      whereArgs: [sysId],
    );

    if (maps.isNotEmpty) {
      return Exercise.fromJson(maps.first);
    }
    return null;
  }

  // Future<Program?> readProgram(int id) async {
  //   final db = await instance.database;
  //   final maps = await db.query(
  //     Program.tableName,
  //     columns: ProgramFields.values,
  //     where: '${ProgramFields.id} = ?',
  //     whereArgs: [id],
  //   );

  //   if (maps.isNotEmpty) {
  //     return Program.fromJson(maps.first);
  //   }
  //   return null;
  // }

  // Future<Workout?> readWorkout(int id) async {
  //   final db = await instance.database;
  //   final maps = await db.query(
  //     Workout.tableName,
  //     columns: WorkoutFields.values,
  //     where: '${WorkoutFields.id} = ?',
  //     whereArgs: [id],
  //   );

  //   Exercise? exercise =
  //       await readExercise(maps.first[WorkoutFields.exercise] as int);
  //   Program? program =
  //       await readProgram(maps.first[WorkoutFields.program] as int);
  //   Workout? prev = await readWorkout(maps.first[WorkoutFields.prev] as int);

  //   if (maps.isNotEmpty && exercise != null && program != null) {
  //     return Workout.fromJson(
  //       maps.first,
  //       exercise,
  //       program,
  //       prev,
  //     );
  //   }
  //   return null;
  // }

  // Future<Set?> readSet(int id) async {
  //   final db = await instance.database;
  //   final maps = await db.query(
  //     Set.tableName,
  //     columns: SetFields.values,
  //     where: '${SetFields.id} = ?',
  //     whereArgs: [id],
  //   );

  //   Workout? workout = await readWorkout(maps.first[SetFields.workout] as int);
  //   Set? prev = await readSet(maps.first[SetFields.prev] as int);

  //   if (maps.isNotEmpty && workout != null) {
  //     return Set.fromJson(
  //       maps.first,
  //       workout,
  //       prev,
  //     );
  //   }
  //   return null;
  // }

  // Read all from models
  // Future<List<Exercise>> readAllExercises() async {
  //   final db = await instance.database;

  //   const orderBy = '${ExerciseFields.name} ASC';
  //   final result = await db.query(
  //     Exercise.tableName,
  //     orderBy: orderBy,
  //   );
  //   return result.map((json) => Exercise.fromJson(json)).toList();
  // }

  Future<List<Program>> readAllPrograms() async {
    final db = await instance.database;

    const orderBy = '${ProgramFields.sysId} ASC';
    final result = await db.query(
      Program.table,
      orderBy: orderBy,
    );
    return result.map((json) => Program.fromJson(json)).toList();
  }

  Future<List<Workout>> readAllWorkouts(String programSysId) async {
    final db = await instance.database;

    final result = await db.query(
      Workout.table,
      where: '${WorkoutFields.programSysId} = ?',
      whereArgs: [programSysId],
    );
    return result.map((json) {
      return Workout.fromJson(
        json,
      );
    }).toList();
  }

  // Future<List<Future<Set>>> readAllSets() async {
  //   final db = await instance.database;

  //   final result = await db.query(
  //     Set.tableName,
  //   );
  //   return result.map((json) async {
  //     Workout? workout = await readWorkout(json[SetFields.workout] as int);
  //     Set? prev = await readSet(json[SetFields.prev] as int);
  //     return Set.fromJson(
  //       json,
  //       workout!,
  //       prev,
  //     );
  //   }).toList();
  // }

  // Update a model
  Future<int> updateModel(Model model, int id) async {
    final db = await instance.database;
    return db.update(
      model.tableName,
      model.toJson(),
      where: '_id = ?',
      whereArgs: [id],
    );
  }

  // Future<int> updateExercise(Exercise exercise) async {
  //   final db = await instance.database;
  //   return db.update(
  //     Exercise.tableName,
  //     exercise.toJson(),
  //     where: '${ExerciseFields.id} = ?',
  //     whereArgs: [exercise.id],
  //   );
  // }

  // Future<int> updateProgram(Program program) async {
  //   final db = await instance.database;
  //   return db.update(
  //     Program.tableName,
  //     program.toJson(),
  //     where: '${ProgramFields.id} = ?',
  //     whereArgs: [program.id],
  //   );
  // }

  // Future<int> updateSet(Set set) async {
  //   final db = await instance.database;
  //   return db.update(
  //     Set.tableName,
  //     set.toJson(),
  //     where: '${SetFields.id} = ?',
  //     whereArgs: [set.id],
  //   );
  // }

  // Future<int> updateWorkout(Workout workout) async {
  //   final db = await instance.database;
  //   return db.update(
  //     Workout.tableName,
  //     workout.toJson(),
  //     where: '${WorkoutFields.id} = ?',
  //     whereArgs: [workout.id],
  //   );
  // }

  // Delete model
  // Future<int> deleteExercise(int id) async {
  //   final db = await instance.database;
  //   return db.delete(
  //     Exercise.tableName,
  //     where: '${ExerciseFields.id} = ?',
  //     whereArgs: [id],
  //   );
  // }

  // Future<int> deleteProgram(int id) async {
  //   final db = await instance.database;
  //   return db.delete(
  //     Program.tableName,
  //     where: '${ProgramFields.id} = ?',
  //     whereArgs: [id],
  //   );
  // }

  // Future<int> deleteSet(int id) async {
  //   final db = await instance.database;
  //   return db.delete(
  //     Set.tableName,
  //     where: '${SetFields.id} = ?',
  //     whereArgs: [id],
  //   );
  // }

  // Future<int> deleteWorkout(int id) async {
  //   final db = await instance.database;
  //   return db.delete(
  //     Workout.tableName,
  //     where: '${WorkoutFields.id} = ?',
  //     whereArgs: [id],
  //   );
  // }

  // Close
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
