import 'package:calisthenic_app/constants/route_constant.dart';
import 'package:calisthenic_app/views/screens/home_screen.dart';
import 'package:calisthenic_app/views/screens/program_detail_screen.dart';
import 'package:calisthenic_app/views/screens/program_screen.dart';
import 'package:calisthenic_app/views/screens/rest_screen.dart';
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
        GetPage(
          name: RouteConstant.kProgramDetailScreen,
          page: () => const ProgramDetailScreen(),
        ),
        GetPage(
          name: RouteConstant.kRestScreen,
          page: () => const RestScreen(),
        ),
      ];

  static String get initialRoute => RouteConstant.kHomeScreen;
}
