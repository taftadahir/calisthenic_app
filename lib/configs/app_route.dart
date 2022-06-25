import 'package:calisthenic_app/constants/route_constant.dart';
import 'package:calisthenic_app/views/screens/home_screen.dart';
import 'package:calisthenic_app/views/screens/program_detail_screen.dart';
import 'package:calisthenic_app/views/screens/program_screen.dart';
import 'package:calisthenic_app/views/screens/rest_screen.dart';
import 'package:calisthenic_app/views/screens/result_screen.dart';
import 'package:calisthenic_app/views/screens/workout_on_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  // TODO: App route
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
        GetPage(
          name: RouteConstant.kWorkoutOnScreen,
          page: () => const WorkoutOnScreen(),
        ),
        GetPage(
          name: RouteConstant.kResultScreen,
          page: () => const ResultScreen(),
        ),
      ];

  // TODO: Initial app route
  static String get initialRoute => RouteConstant.kHomeScreen;
}
