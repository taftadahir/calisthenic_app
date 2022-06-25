import 'dart:async';

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
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestScreen extends StatelessWidget {
  const RestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppController appController = Get.find();

    // Getting the workout
    Workout workout = appController.workouts
        .where(
          (workout) => workout.sysId == appController.activeWorkoutSysId,
        )
        .first;

    // Getting the next exercise workout
    Future<Exercise?> exercise =
        AppDatabase.instance.readExercise(workout.exerciseSysId);

    // TimerController timerController = Get.find();
    // if (timerController.count <= 0) {
    //   Get.toNamed(RouteConstant.kResultScreen);
    // }

    return Scaffold(
      appBar: AppBarComponent.getAppBarComponent(
        leading: IconButton(
          onPressed: () {
            TimerController timerController = Get.find();
            timerController.cancelTimer();
            timerController.startPauseTimer();
            Get.dialog(
              Dialog(
                insetPadding: EdgeInsets.symmetric(
                  vertical: LayoutConstant.kVerticalScreenPadding,
                  horizontal: LayoutConstant.kHorizontalScreenPadding,
                ),
                insetAnimationDuration: AppTheme.animationDuration,
                backgroundColor: context.theme.scaffoldBackgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(LayoutConstant.kCardRadius),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: LayoutConstant.kVerticalScreenPadding,
                    horizontal: LayoutConstant.kHorizontalScreenPadding,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Confirmation',
                        style: context.theme.textTheme.headlineMedium,
                      ),
                      SizedBox(
                        height: LayoutConstant.kSpaceBetweenElements,
                      ),
                      Text(
                        'Do you really want to exit the workout?',
                        style: context.theme.textTheme.bodySmall,
                      ),
                      SizedBox(
                        height: 2 * LayoutConstant.kSpaceBetweenElements,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ButtonComponent(
                            onPressed: () => Get.back(),
                            text: 'Cancel',
                            isPrimary: true,
                            forPopUp: true,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          ButtonComponent(
                            onPressed: () {
                              AppController appController = Get.find();
                              appController.updateWorkouts();
                              Get.back();
                              Get.back();
                            },
                            text: 'Exit',
                            isPrimary: false,
                            forError: true,
                            forPopUp: true,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              barrierDismissible: true,
              name: 'Confirmation',
              transitionDuration: AppTheme.animationDuration,
            ).then((value) {
              onPopUpDismiss();
            });
          },
          icon: const Icon(Icons.close_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.help_outline_rounded,
              size: 32.0,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: AppTheme.kPhysics,
        child: Container(
          constraints: BoxConstraints(
            minHeight:
                Get.height - 8 - 2 * LayoutConstant.kVerticalScreenPadding,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: LayoutConstant.kHorizontalScreenPadding,
            vertical: LayoutConstant.kVerticalScreenPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Next workout
              Column(
                children: [
                  FutureBuilder(
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
                  SizedBox(
                    height: 16 * LayoutConstant.kScaleFactor,
                  ),
                  Text(
                    'Next workout',
                    style: context.theme.textTheme.labelSmall,
                  ),
                  SizedBox(
                    height: 16 * LayoutConstant.kScaleFactor,
                  ),
                ],
              ),
              // Timer
              const TimerComponent(
                title: 'Take a rest',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 16 * LayoutConstant.kScaleFactor,
                  ),
                  // Buttons
                  ButtonComponent(
                    onPressed: () {
                      TimerController controller = Get.find();
                      controller.count += 30;
                      controller.initialCount += 30;
                    },
                    text: '+ 30 sec',
                    isPrimary: false,
                  ),
                  SizedBox(
                    height: 8 * LayoutConstant.kScaleFactor,
                  ),
                  ButtonComponent(
                    onPressed: () {
                      TimerController timerController = Get.find();

                      // TODO: Stop previous timer and start the next one using the next workout time field
                      timerController.cancelTimer();
                      timerController.count = workout.time != null
                          ? workout.time!
                          : (workout.reps != null ? workout.reps! : 0);
                      timerController.initialCount = workout.time != null
                          ? workout.time!
                          : (workout.reps != null ? workout.reps! : 0);
                      timerController.pauseCount = 0;
                      timerController.startTimer();

                      // Update the images and image index using the exercise of that workout
                      // exercise.then((exercise) {

                      // });

                      Get.offNamed(RouteConstant.kWorkoutOnScreen);
                    },
                    text: 'Next',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPopUpDismiss() {
    TimerController timerController = Get.find();
    timerController.cancelPauseTimer();
    timerController.startTimer();
  }
}
