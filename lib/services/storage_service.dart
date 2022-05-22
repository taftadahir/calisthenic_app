import 'package:calisthenic_app/constants/storage_constant.dart';
import 'package:get_storage/get_storage.dart';

class StorageService {
  static final _storage = GetStorage();

  static bool get isDarkMode =>
      _storage.read(StorageConstant.isDarkMode) ?? false;

  static set isDarkMode(bool isDarkMode) =>
      _storage.write(StorageConstant.isDarkMode, isDarkMode);
}
