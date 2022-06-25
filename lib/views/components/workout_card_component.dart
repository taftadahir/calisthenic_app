import 'package:calisthenic_app/configs/app_theme.dart';
import 'package:calisthenic_app/constants/layout_constant.dart';
import 'package:calisthenic_app/database/app_database.dart';
import 'package:calisthenic_app/models/exercise.dart';
import 'package:calisthenic_app/models/workout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkoutCardComponent extends StatelessWidget {
  final Workout workout;
  const WorkoutCardComponent({
    Key? key,
    required this.workout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double checkSize = 24 * LayoutConstant.kScaleFactor;
    double spaceBetweenWorkoutDetail = 24;
    Future<Exercise?> exercise =
        AppDatabase.instance.readExercise(workout.exerciseSysId);
    return Card(
      color: context.theme.cardColor,
      elevation: LayoutConstant.kCardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(LayoutConstant.kCardRadius),
      ),
      child: FutureBuilder(
          future: exercise,
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.done
                ? (snapshot.hasData
                    ? InkWell(
                        borderRadius:
                            BorderRadius.circular(LayoutConstant.kCardRadius),
                        splashColor: context.theme.cardColor,
                        focusColor: context.theme.cardColor,
                        highlightColor: context.theme.cardColor,
                        onTap: () {},
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: LayoutConstant.kCardHeight,
                          ),
                          padding: EdgeInsets.all(
                              16.0 * LayoutConstant.kScaleFactor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  physics: AppTheme.kPhysics,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        (snapshot.data as Exercise).name,
                                        style: context
                                            .theme.textTheme.displayMedium,
                                      ),
                                      SizedBox(
                                        height: 8 * LayoutConstant.kScaleFactor,
                                      ),
                                      Row(
                                        children: [
                                          // Text(
                                          //   workoutDetailRange(
                                          //       WorkoutDetail.set),
                                          //   style: context
                                          //       .theme.textTheme.labelSmall,
                                          // ),
                                          // SizedBox(
                                          //   width: spaceBetweenWorkoutDetail,
                                          // ),
                                          Text(
                                            workout.reps != null
                                                ? '${workout.reps} reps'
                                                : (workout.time != null
                                                    ? '${workout.time} sec(s)'
                                                    : 'No reps/time'),
                                            style: context
                                                .theme.textTheme.labelSmall,
                                          ),
                                          SizedBox(
                                            width: spaceBetweenWorkoutDetail,
                                          ),
                                          Text(
                                            workout.weight != null
                                                ? '${workout.weight} kg'
                                                : 'No weight',
                                            style: context
                                                .theme.textTheme.labelSmall,
                                          ),
                                          SizedBox(
                                            width: spaceBetweenWorkoutDetail,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8 * LayoutConstant.kScaleFactor,
                              ),
                              workout.completed
                                  ? Icon(
                                      Icons.task_alt_rounded,
                                      color: AppTheme.successColor,
                                      size: checkSize,
                                    )
                                  : (workout.skipped
                                      ? Icon(
                                          Icons.adjust_rounded,
                                          color: AppTheme.greyColor,
                                          size:
                                              24 * LayoutConstant.kScaleFactor,
                                        )
                                      : const SizedBox(
                                          width: 0,
                                        )),
                            ],
                          ),
                        ),
                      )
                    : Padding(
                        padding:
                            EdgeInsets.all(16.0 * LayoutConstant.kScaleFactor),
                        child: Text(
                          'Unknown exercise',
                          style: context.theme.textTheme.displayMedium,
                        ),
                      ))
                : Text(
                    'In Progress...',
                    style: context.theme.textTheme.displayMedium,
                  );
          }),
    );
  }
}
