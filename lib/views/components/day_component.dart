import 'package:calisthenic_app/configs/app_theme.dart';
import 'package:calisthenic_app/controllers/program_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DayComponent extends StatelessWidget {
  final int day;
  final bool active;
  final bool completed;

  const DayComponent({
    Key? key,
    required this.day,
    this.active = false,
    this.completed = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 48.0;
    return GestureDetector(
      onTap: () {
        ProgramController programController = Get.find();
        programController.activeDay = day;
      },
      child: Container(
        height: size,
        width: size,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: completed && !active
              ? AppTheme.successColor
              : (active && completed
                  ? context.theme.primaryColor
                  : (active
                      ? context.theme.primaryColor
                      : context.theme.cardColor)),
          borderRadius: const BorderRadius.all(
            Radius.circular(56),
          ),
        ),
        child: Center(
          child: FittedBox(
            child: Text(
              day.toString(),
              style: !active && !completed
                  ? context.theme.textTheme.labelMedium
                  : context.theme.textTheme.labelMedium!.copyWith(
                      color: const Color(0xffffffff),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
