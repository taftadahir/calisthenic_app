import 'package:calisthenic_app/configs/app_theme.dart';
import 'package:calisthenic_app/constants/layout_constant.dart';
import 'package:calisthenic_app/constants/route_constant.dart';
import 'package:calisthenic_app/controllers/app_controller.dart';
import 'package:calisthenic_app/controllers/timer_controller.dart';
import 'package:calisthenic_app/models/workout.dart';
import 'package:calisthenic_app/views/components/app_bar_component.dart';
import 'package:calisthenic_app/views/components/day_component.dart';
import 'package:calisthenic_app/views/components/workout_card_component.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgramScreen extends StatelessWidget {
  const ProgramScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBarComponent.getAppBarComponent(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {
              AppController appController = Get.find();
              if (appController.program != null) {
                Get.toNamed(RouteConstant.kProgramDetailScreen);
              }
            },
            icon: const Icon(
              Icons.help_outline_rounded,
              size: 32.0,
            ),
          ),
        ],
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            extendedSizeConstraints: BoxConstraints.tightFor(
              height: 40 * LayoutConstant.kScaleFactor,
              width: Get.width - 2 * LayoutConstant.kHorizontalScreenPadding,
            ),
            backgroundColor: context.theme.primaryColor,
          ),
        ),
        child: GetBuilder<AppController>(builder: (appController) {
          return FloatingActionButton.extended(
            onPressed: () {
              // Update the workouts to contains the only workouts from the active day
              appController.workouts = appController.workouts
                  .where((workout) => workout.day == appController.activeDay)
                  .toList();

              if (appController.workouts
                  .where((workout) => workout.prevWorkoutSysId == null)
                  .isNotEmpty) {
                // Update the active workout sysId
                appController.activeWorkoutSysId = appController.workouts
                    .where((workout) => workout.prevWorkoutSysId == null)
                    .first
                    .sysId;

                // TODO: Configure the timers and counts for first program entry
                // Time before starting the workout
                TimerController timerController = Get.find();
                timerController.count = 10;
                timerController.initialCount = 10;
                timerController.pauseCount = 0;
                timerController.startTimer();

                // TODO: Should go to the rest screen for the first time with a fixed time not depending on programs
                Get.toNamed(RouteConstant.kRestScreen);
              } else {
                // There is no workout that has 'null' in its previous property
                // Show a snackbar and don't go anywhere

                Get.showSnackbar(
                  GetSnackBar(
                    animationDuration: AppTheme.animationDuration,
                    duration: const Duration(seconds: 5),
                    backgroundColor:
                        context.theme.snackBarTheme.backgroundColor ??
                            context.theme.cardColor,
                    isDismissible: true,
                    messageText: Text(
                      'No workout',
                      style: context.theme.textTheme.bodySmall,
                    ),
                    // title: 'Information',
                    borderRadius: LayoutConstant.kCardRadius,
                    snackPosition: SnackPosition.TOP,
                  ),
                );
              }
            },
            label: Text(
              appController.activeDay > appController.nextDay
                  ? 'Start'
                  : 'Redo',
              style: GoogleFonts.montserrat(
                fontSize: 16 * LayoutConstant.kScaleFactor,
                fontWeight: FontWeight.w500,
                color: const Color(0xffffffff),
              ),
            ),
          );
        }),
      ),
      body: GetBuilder(builder: (AppController appController) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: LayoutConstant.kVerticalScreenPadding,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: LayoutConstant.kHorizontalScreenPadding,
                  ),
                  child: Text(
                    appController.program!.name,
                    style: context.theme.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: LayoutConstant.kSpaceBetweenTitleAndElement,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: AppTheme.kPhysics,
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8 * LayoutConstant.kScaleFactor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                        appController.program?.days ?? 0,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          child: DayComponent(
                            day: index + 1,
                            active: index + 1 == appController.activeDay
                                ? true
                                : false,
                            completed:
                                index < appController.program!.lastCompletedDay
                                    ? true
                                    : false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: AppTheme.kPhysics,
                padding: EdgeInsets.only(
                  left: LayoutConstant.kHorizontalScreenPadding,
                  right: LayoutConstant.kHorizontalScreenPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24 * LayoutConstant.kScaleFactor,
                    ),
                    Text(
                      'Warm Up',
                      style: context.theme.textTheme.headlineMedium,
                    ),
                    SizedBox(
                      height: LayoutConstant.kSpaceBetweenTitleAndElement,
                    ),
                    ...appController.workouts
                        .where((workout) =>
                            workout.workoutType == WorkoutType.warmUp &&
                            workout.day == appController.activeDay)
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
                      height: 2 * LayoutConstant.kSpaceBetweenTitleAndElement,
                    ),
                    Text(
                      'Workouts',
                      style: context.theme.textTheme.headlineMedium,
                    ),
                    SizedBox(
                      height: LayoutConstant.kSpaceBetweenTitleAndElement,
                    ),
                    ...appController.workouts
                        .where((workout) =>
                            workout.workoutType == WorkoutType.workout &&
                            workout.day == appController.activeDay)
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
                      height: 2 * LayoutConstant.kSpaceBetweenTitleAndElement,
                    ),
                    Text(
                      'Cool Down',
                      style: context.theme.textTheme.headlineMedium,
                    ),
                    SizedBox(
                      height: LayoutConstant.kSpaceBetweenTitleAndElement,
                    ),
                    ...appController.workouts
                        .where((workout) =>
                            workout.workoutType == WorkoutType.coolDown &&
                            workout.day == appController.activeDay)
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
                      height: 24 * LayoutConstant.kScaleFactor +
                          LayoutConstant.kVerticalScreenPadding,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
