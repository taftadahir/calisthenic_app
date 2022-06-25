import 'package:calisthenic_app/configs/app_theme.dart';
import 'package:calisthenic_app/constants/layout_constant.dart';
import 'package:calisthenic_app/constants/route_constant.dart';
import 'package:calisthenic_app/controllers/app_controller.dart';
import 'package:calisthenic_app/models/workout.dart';
import 'package:calisthenic_app/views/components/app_bar_component.dart';
import 'package:calisthenic_app/views/components/workout_card_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent.getAppBarComponent(
        leading: IconButton(
          onPressed: () {
            Get.offNamed(RouteConstant.kHomeScreen);
          },
          icon: const Icon(Icons.home_max_rounded),
        ),
      ),
      body: SingleChildScrollView(
        physics: AppTheme.kPhysics,
        child: GetBuilder(builder: (AppController appController) {
          List<Workout> workouts = appController.workouts
              .where((workout) => workout.day == appController.activeDay)
              .toList();

          double percent =
              workouts.where((workout) => workout.completed).length /
                  (workouts.isEmpty ? 1 : workouts.length);
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: LayoutConstant.kHorizontalScreenPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 24 * LayoutConstant.kScaleFactor,
                ),
                Text(
                  'Result',
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.titleLarge,
                ),
                SizedBox(
                  height: 32 * LayoutConstant.kScaleFactor,
                ),
                CircularPercentIndicator(
                  radius: LayoutConstant.kCircularTimerRadius,
                  lineWidth: 8,
                  percent: percent,
                  progressColor: context.theme.primaryColor,
                  backgroundColor: context.theme.canvasColor,
                  circularStrokeCap: CircularStrokeCap.round,
                  animation: true,
                  animationDuration: AppTheme.animationDuration.inSeconds,
                  center: Center(
                    child: Text(
                      '${(100 * percent).toInt()} %',
                      style: context.theme.textTheme.bodyLarge,
                    ),
                  ),
                ),
                SizedBox(
                  height: 32 * LayoutConstant.kScaleFactor,
                ),
                ...appController.workouts
                    .where((workout) => workout.day == appController.activeDay)
                    .map(
                      (workout) => Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 4 * LayoutConstant.kScaleFactor,
                        ),
                        child: WorkoutCardComponent(workout: workout),
                      ),
                    )
                    .toList(),
                SizedBox(
                  height: LayoutConstant.kVerticalScreenPadding,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
