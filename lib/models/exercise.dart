import 'package:calisthenic_app/models/model.dart';

class Exercise extends Model {
  @override
  String get tableName => table;
  static String get table => 'exercises';
  final int? id;
  final String sysId;
  final String name;
  final String? images;
  final String? description;
  final String? tips;

  Exercise({
    this.id,
    required this.sysId,
    required this.name,
    this.images,
    this.description,
    this.tips,
  });

  @override
  Map<String, Object?> toJson() => {
        ExerciseFields.id: id,
        ExerciseFields.sysId: sysId,
        ExerciseFields.name: name,
        ExerciseFields.images: images,
        ExerciseFields.description: description,
        ExerciseFields.tips: tips,
      };

  static Exercise fromJson(Map<String, Object?> json) => Exercise(
        id: json[ExerciseFields.id] as int?,
        sysId: json[ExerciseFields.sysId] as String,
        name: json[ExerciseFields.name] as String,
        description: json[ExerciseFields.description] as String?,
        tips: json[ExerciseFields.tips] as String?,
        images: json[ExerciseFields.images] as String?,
      );

  @override
  Exercise copy({
    int? id,
    String? sysId,
    String? name,
    String? images,
    String? description,
    String? tips,
  }) =>
      Exercise(
        id: id ?? this.id,
        sysId: sysId ?? this.sysId,
        name: name ?? this.name,
        description: description ?? this.description,
        tips: tips ?? this.tips,
        images: images ?? this.images,
      );
}

class ExerciseFields {
  static final List<String> values = [
    id,
    sysId,
    name,
    images,
    description,
    tips,
  ];
  static const String id = '_id';
  static const String sysId = 'sys_id';
  static const String name = 'name';
  static const String images = 'images';
  static const String description = 'description';
  static const String tips = 'tips';
}
