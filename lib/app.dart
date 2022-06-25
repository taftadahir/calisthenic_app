import 'package:calisthenic_app/bindings/app_binding.dart';
import 'package:calisthenic_app/configs/app_route.dart';
import 'package:calisthenic_app/configs/app_theme.dart';
import 'package:calisthenic_app/constants/global_constant.dart';
import 'package:calisthenic_app/controllers/app_controller.dart';
import 'package:calisthenic_app/database/app_database.dart';
import 'package:calisthenic_app/languages/app_message.dart';
import 'package:calisthenic_app/services/storage_service.dart';
import 'package:calisthenic_app/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Remove splash screen after initialization is completed
    FlutterNativeSplash.remove();

    return GetMaterialApp(
      title: GlobalConstant.kAppName,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      translations: AppMessage(),
      themeMode: ThemeService.theme,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      initialBinding: AppBinding(),
      initialRoute: AppRoute.initialRoute,
      getPages: AppRoute.pages,
      onInit: () async {
        var db = AppDatabase.instance;
        await db.database;
        if (StorageService.isFirstTimeOpeningApp) {
          // Create programs
          for (var program in db.programs) {
            await db.createModel(program);
            // await db.createProgram(program);
          }
          for (var skill in db.skills) {
            await db.createModel(skill);
          }

          // Create exercises
          for (var exercise in db.exercises) {
            await db.createModel(exercise);
          }

          // Create workouts
          for (var workout in db.workouts) {
            await db.createModel(workout);
          }

          // Is first time opening the app
          StorageService.isFirstTimeOpeningApp = false;
        }
        AppController appController = Get.find();
        await appController.getPrograms();
      },
    );
  }
}
