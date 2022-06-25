import 'package:calisthenic_app/configs/app_theme.dart';
import 'package:calisthenic_app/constants/layout_constant.dart';
import 'package:calisthenic_app/constants/route_constant.dart';
import 'package:calisthenic_app/controllers/app_controller.dart';
import 'package:calisthenic_app/controllers/timer_controller.dart';
import 'package:calisthenic_app/database/app_database.dart';
import 'package:calisthenic_app/models/exercise.dart';
import 'package:calisthenic_app/models/workout.dart';
import 'package:calisthenic_app/views/components/app_bar_component.dart';
import 'package:calisthenic_app/views/components/button_component.dart';
import 'package:calisthenic_app/views/components/timer_component.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkoutOnScreen extends StatelessWidget {
  const WorkoutOnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppController appController = Get.find();

    // Getting the workout
    Workout workout = appController.workouts
        .where(
          (workout) => workout.sysId == appController.activeWorkoutSysId,
        )
        .first;

    // Getting the exercise workout
    Future<Exercise?> exercise =
        AppDatabase.instance.readExercise(workout.exerciseSysId);

    PageController pageController = PageController();
    return Scaffold(
      appBar: AppBarComponent.getAppBarComponent(
        leading: IconButton(
          onPressed: () {
            AppController appController = Get.find();
            appController.updateWorkouts();

            TimerController timerController = Get.find();
            timerController.cancelTimer();
            timerController.cancelPauseTimer();
            Get.back();
          },
          icon: const Icon(Icons.close_rounded),
        ),
        actions: [
          // Skip button
          IconButton(
            onPressed: () {
              goNext(
                appController: appController,
                workout: workout,
                skip: true,
              );
            },
            icon: const Icon(
              EvaIcons.arrowheadRightOutline,
              size: 32.0,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: AppTheme.kPhysics,
        child: GetBuilder<AppController>(builder: (appController) {
          return Container(
            constraints: BoxConstraints(
              minHeight:
                  Get.height - 8 - 2 * LayoutConstant.kVerticalScreenPadding,
              maxHeight:
                  Get.height - 8 - 2 * LayoutConstant.kVerticalScreenPadding,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: LayoutConstant.kHorizontalScreenPadding,
              vertical: LayoutConstant.kVerticalScreenPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Expanded(
                //   child: Image.asset(
                //     'assets/images/front_lever.png',
                //   ),
                // ),

                appController.images!.isEmpty
                    ? const SizedBox(height: 0)
                    : Expanded(
                        child: PageView.builder(
                          controller: pageController,
                          physics: AppTheme.kPhysics,
                          itemCount: appController.images?.length,
                          onPageChanged: (index) {
                            appController.activeImageIndex = index;
                          },
                          itemBuilder: (context, index) {
                            return Image.asset(
                              'assets/images/${appController.images![appController.activeImageIndex]}',
                            );
                          },
                        ),
                      ),
                Container(
                  height: LayoutConstant.kActiveDotSize +
                      2 * LayoutConstant.kVerticalScreenPadding,
                  padding: EdgeInsets.symmetric(
                    horizontal: LayoutConstant.kHorizontalScreenPadding,
                    vertical: LayoutConstant.kVerticalScreenPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      appController.images?.length ?? 0,
                      (index) => AnimatedContainer(
                        duration: AppTheme.animationDuration,
                        height: index == appController.activeImageIndex
                            ? LayoutConstant.kActiveDotSize
                            : LayoutConstant.kInactiveDotSize,
                        width: index == appController.activeImageIndex
                            ? LayoutConstant.kActiveDotSize
                            : LayoutConstant.kInactiveDotSize,
                        margin: EdgeInsets.symmetric(
                            horizontal: 4.0 * LayoutConstant.kScaleFactor),
                        decoration: BoxDecoration(
                          color: index == appController.activeImageIndex
                              ? context.theme.primaryColor
                              : context.theme.cardColor,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 8 * LayoutConstant.kScaleFactor,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: LayoutConstant.kHorizontalScreenPadding,
                  ),
                  child: FutureBuilder(
                      future: exercise,
                      builder: (context, snapshot) {
                        return snapshot.connectionState == ConnectionState.done
                            ? (snapshot.hasData
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: LayoutConstant
                                          .kHorizontalScreenPadding,
                                    ),
                                    child: Text(
                                      (snapshot.data as Exercise).name,
                                      textAlign: TextAlign.center,
                                      style: context.theme.textTheme.titleLarge,
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.all(
                                        16.0 * LayoutConstant.kScaleFactor),
                                    child: Text(
                                      'Unknown exercise',
                                      style:
                                          context.theme.textTheme.displayMedium,
                                    ),
                                  ))
                            : Text(
                                'In Progress...',
                                style: context.theme.textTheme.displayMedium,
                              );
                      }),
                ),
                SizedBox(
                  height: 24 * LayoutConstant.kScaleFactor,
                ),
                TimerComponent(
                  forReps: workout.time == null,
                ),
                SizedBox(
                  height: 24 * LayoutConstant.kScaleFactor,
                ),
                ButtonComponent(
                  onPressed: () {
                    goNext(appController: appController, workout: workout);
                  },
                  text: 'Done',
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  void goNext({
    required AppController appController,
    required Workout workout,
    skip = false,
  }) {
    // Check if there is more workout to do
    TimerController timerController = Get.find();
    timerController.cancelTimer();
    if (appController.workouts
        .where((workout) =>
            workout.prevWorkoutSysId == appController.activeWorkoutSysId)
        .isNotEmpty) {
      // Update the next active workout
      appController.activeWorkoutSysId = appController.workouts
          .where((workout) =>
              workout.prevWorkoutSysId == appController.activeWorkoutSysId)
          .first
          .sysId;

      // TODO: Update the timers and counts
      // timerController.cancelPauseTimer();
      timerController.count = workout.restTime;
      timerController.initialCount = workout.restTime;
      timerController.pauseCount = 0;
      timerController.startTimer();

      // TODO: Go to rest screen only if workout have a rest time greater than 0
      Get.offNamed(RouteConstant.kRestScreen);
    } else {
      // Update the program last completed day
      appController.program!.lastCompletedDay = workout.day;
      AppDatabase.instance
          .updateModel(appController.program!, appController.program!.id!);

      Get.offNamed(RouteConstant.kResultScreen);
    }

    // Update the workout
    if (skip) {
      workout.skipped = true;
    } else {
      workout.completed = true;
    }
    AppDatabase.instance.updateModel(workout, workout.id!);

    // TimerController timerController = Get.find();
    // timerController.reset();
  }
}
