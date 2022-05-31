import 'package:calisthenic_app/constants/route_constant.dart';
import 'package:calisthenic_app/views/screens/home_screen.dart';
import 'package:calisthenic_app/views/screens/program_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static List<GetPage<dynamic>> get pages => [
        GetPage(
          name: RouteConstant.kHomeScreen,
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: RouteConstant.kProgramScreen,
          page: () => const ProgramScreen(),
        ),
      ];

  static String get initialRoute => RouteConstant.kHomeScreen;
}
