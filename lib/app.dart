import 'package:calisthenic_app/bindings/app_binding.dart';
import 'package:calisthenic_app/configs/app_route.dart';
import 'package:calisthenic_app/configs/app_theme.dart';
import 'package:calisthenic_app/constants/global_constant.dart';
import 'package:calisthenic_app/languages/app_message.dart';
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
    );
  }
}
