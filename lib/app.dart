import 'package:calisthenic_app/configs/app_theme.dart';
import 'package:calisthenic_app/constants/global_constant.dart';
import 'package:calisthenic_app/languages/app_message.dart';
import 'package:calisthenic_app/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: GlobalConstant.kAppName,
      debugShowCheckedModeBanner: false,
      translations: AppMessage(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      themeMode: ThemeService.theme,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      // initialBinding: AppBinding(),
      // initialRoute: AppRoute.initialRoute,
      // getPages: AppRoute.pages,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Hello_world'.tr,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.updateLocale(const Locale('fr', 'FR'));
                },
                child: const Text('French'),
              ),
              TextButton(
                onPressed: () {
                  Get.updateLocale(const Locale('en', 'US'));
                },
                child: const Text('English'),
              ),
              TextButton(
                onPressed: () {
                  ThemeService.switchTheme();
                },
                child: const Text('Switch theme'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
