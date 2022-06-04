import 'package:calisthenic_app/controllers/program_controller.dart';
import 'package:calisthenic_app/controllers/timer_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProgramController(),
      fenix: true,
    );
    Get.lazyPut(
      () => TimerController(),
      fenix: true,
    );
  }
}
