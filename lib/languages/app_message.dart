import 'package:get/get.dart';

class AppMessage extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'fr_FR': _fr,
        'en_US': _en,
      };

  Map<String, String> get _fr => {
        'Hello_world': 'Bonjour tous le monde',
      };
  Map<String, String> get _en => {
        'Hello_world': 'Hello world',
      };
}