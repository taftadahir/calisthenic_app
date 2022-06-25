import 'package:calisthenic_app/configs/app_theme.dart';
import 'package:calisthenic_app/constants/layout_constant.dart';
import 'package:calisthenic_app/controllers/timer_controller.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:get/get.dart';

class TimerComponent extends StatelessWidget {
  final String? title;
  final bool forReps;
  const TimerComponent({
    Key? key,
    this.title,
    this.forReps = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (TimerController timerController) {
      int min = timerController.count ~/ 60;
      int sec = timerController.count % 60;
      String time =
          (min < 10 ? '0$min : ' : '$min : ') + (sec < 10 ? '0$sec' : '$sec');

      List<Widget> widgets = [
        Text(
          forReps ? timerController.initialCount.toString() : time,
          style: context.theme.textTheme.bodyLarge,
        ),
      ];

      if (title != null) {
        widgets.add(
          SizedBox(height: 8 * LayoutConstant.kScaleFactor),
        );
        widgets.add(
          Text(
            title!,
            style: context.theme.textTheme.displaySmall,
          ),
        );
      }
      return CircularPercentIndicator(
        radius: LayoutConstant.kCircularTimerRadius,
        lineWidth: 8,
        percent: forReps
            ? 1
            : (timerController.initialCount - timerController.count) /
                timerController.initialCount,
        progressColor: context.theme.primaryColor,
        backgroundColor: context.theme.canvasColor,
        circularStrokeCap: CircularStrokeCap.round,
        animation: true,
        animationDuration: AppTheme.animationDuration.inSeconds,
        center: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: widgets,
          ),
        ),
      );
    });
  }
}
