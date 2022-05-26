import 'package:calisthenic_app/models/program.dart';
import 'package:get/get.dart';

class ProgramController extends GetxController {
  static List<Program> get programs => [
        Program(id: 0, name: 'Push Up', days: 15),
        Program(id: 1, name: 'Pull Up', days: 60),
        Program(id: 2, name: 'Pull Up', days: 20),
        Program(id: 3, name: 'Pull Up', days: 11),
        Program(id: 4, name: 'Pull Up', days: 10),
      ];

  static List<Program> get skills => [
        Program(id: 0, name: 'Push Up', days: 30),
        Program(id: 1, name: 'Pull Up', days: 25),
        Program(id: 2, name: 'Pull Up', days: 5),
        Program(id: 3, name: 'Pull Up', days: 4),
        Program(id: 4, name: 'Pull Up', days: 30),
      ];
}
