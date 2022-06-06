import 'package:calisthenic_app/configs/app_theme.dart';
import 'package:calisthenic_app/constants/layout_constant.dart';
import 'package:calisthenic_app/constants/route_constant.dart';
import 'package:calisthenic_app/controllers/program_controller.dart';
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
    double spaceBetweenWorkout = 4 * LayoutConstant.kScaleFactor;

    return Scaffold(
      appBar: AppBarComponent.getAppBarComponent(
        leading: IconButton(
          onPressed: () {
            Get.toNamed(RouteConstant.kHomeScreen);
          },
          icon: const Icon(Icons.home_max_rounded),
        ),
      ),
      body: SingleChildScrollView(
        physics: AppTheme.kPhysics,
        child: GetBuilder(builder: (ProgramController controller) {
          return Column(
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
                percent: 0.8,
                progressColor: context.theme.primaryColor,
                backgroundColor: context.theme.canvasColor,
                circularStrokeCap: CircularStrokeCap.round,
                animation: true,
                animationDuration: AppTheme.animationDuration.inSeconds,
                center: Center(
                  child: Text(
                    '90%',
                    style: context.theme.textTheme.bodyLarge,
                  ),
                ),
              ),
              SizedBox(
                height: 32 * LayoutConstant.kScaleFactor,
              ),
              ...controller
                  .workouts(
                    program: controller.program,
                    workoutType: WorkoutType.warmUp,
                  )
                  .map(
                    (workout) => Padding(
                      padding: EdgeInsets.only(
                        bottom: spaceBetweenWorkout,
                      ),
                      child: WorkoutCardComponent(workout: workout),
                    ),
                  )
                  .toList(),
              ...controller
                  .workouts(
                    program: controller.program,
                    workoutType: WorkoutType.workout,
                  )
                  .map(
                    (workout) => Padding(
                      padding: EdgeInsets.only(
                        bottom: spaceBetweenWorkout,
                      ),
                      child: WorkoutCardComponent(workout: workout),
                    ),
                  )
                  .toList(),
              ...controller
                  .workouts(
                    program: controller.program,
                    workoutType: WorkoutType.coolDown,
                  )
                  .map(
                    (workout) => Padding(
                      padding: EdgeInsets.only(bottom: spaceBetweenWorkout),
                      child: WorkoutCardComponent(workout: workout),
                    ),
                  )
                  .toList(),
            ],
          );
        }),
      ),
    );
  }
}
