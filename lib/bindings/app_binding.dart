import 'package:calisthenic_app/controllers/app_controller.dart';
import 'package:calisthenic_app/controllers/timer_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: Define all controller
    Get.lazyPut(
      () => AppController(),
      fenix: true,
    );
    Get.lazyPut(
      () => TimerController(),
      fenix: true,
    );
  }
}
