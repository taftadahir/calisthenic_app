import 'package:calisthenic_app/models/model.dart';

class Program extends Model {
  @override
  String get tableName => table;
  static String get table => 'programs';
  final int? id;
  final String sysId;
  final String name;
  final int days;
  int lastCompletedDay;
  final bool isSkill;
  final String? images;
  final String? description;
  final String? tips;

  Program({
    this.id,
    required this.sysId,
    required this.name,
    required this.days,
    this.lastCompletedDay = 0,
    this.isSkill = false,
    this.images,
    this.description,
    this.tips,
  });

  @override
  Map<String, Object?> toJson() => {
        ProgramFields.id: id,
        ProgramFields.sysId: sysId,
        ProgramFields.isSkill: isSkill ? 1 : 0,
        ProgramFields.name: name,
        ProgramFields.images: images,
        ProgramFields.description: description,
        ProgramFields.tips: tips,
        ProgramFields.days: days,
        ProgramFields.lastCompletedDay: lastCompletedDay,
      };

  static Program fromJson(Map<String, Object?> json) => Program(
        id: json[ProgramFields.id] as int?,
        sysId: json[ProgramFields.sysId] as String,
        name: json[ProgramFields.name] as String,
        isSkill: json[ProgramFields.isSkill] == 1,
        description: json[ProgramFields.description] as String?,
        tips: json[ProgramFields.tips] as String?,
        images: json[ProgramFields.images] as String?,
        days: json[ProgramFields.days] as int,
        lastCompletedDay: json[ProgramFields.lastCompletedDay] as int,
      );

  @override
  Program copy({
    int? id,
    String? sysId,
    String? name,
    bool? isSkill,
    String? images,
    String? description,
    String? tips,
    int? days,
    int? lastCompletedDay,
  }) =>
      Program(
        id: id ?? this.id,
        sysId: sysId ?? this.sysId,
        name: name ?? this.name,
        isSkill: isSkill ?? this.isSkill,
        description: description ?? this.description,
        tips: tips ?? this.tips,
        images: images ?? this.images,
        days: days ?? this.days,
        lastCompletedDay: lastCompletedDay ?? this.lastCompletedDay,
      );
}

class ProgramFields {
  static final List<String> values = [
    id,
    sysId,
    name,
    isSkill,
    images,
    description,
    tips,
    days,
    lastCompletedDay,
  ];
  static const String id = '_id';
  static const String sysId = 'sys_id';
  static const String name = 'name';
  static const String isSkill = 'is_skill';
  static const String images = 'images';
  static const String description = 'description';
  static const String tips = 'tips';
  static const String days = 'days';
  static const String lastCompletedDay = 'last_completed_day';
}
