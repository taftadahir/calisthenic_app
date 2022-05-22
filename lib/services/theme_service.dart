import 'package:calisthenic_app/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeService {
  static ThemeMode get theme =>
      StorageService.isDarkMode ? ThemeMode.dark : ThemeMode.light;

  static void switchTheme() {
    // Change the app theme
    Get.changeThemeMode(
      StorageService.isDarkMode ? ThemeMode.light : ThemeMode.dark,
    );

    // Save the new theme
    StorageService.isDarkMode = !StorageService.isDarkMode;
  }
}
