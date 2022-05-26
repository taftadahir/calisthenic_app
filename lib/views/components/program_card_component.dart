import 'package:calisthenic_app/constants/layout_constant.dart';
import 'package:calisthenic_app/models/program.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgramCardComponent extends StatelessWidget {
  final Program program;

  const ProgramCardComponent({
    Key? key,
    required this.program,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.theme.cardColor,
      elevation: LayoutConstant.kCardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(LayoutConstant.kCardRadius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(LayoutConstant.kCardRadius),
        splashColor: context.theme.cardColor,
        focusColor: context.theme.cardColor,
        highlightColor: context.theme.cardColor,
        onTap: () {},
        child: Container(
          constraints: BoxConstraints(
            minHeight: LayoutConstant.kCardHeight,
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  program.name,
                  style: context.theme.textTheme.displayLarge,
                ),
              ),
              SizedBox(
                width: 8 * LayoutConstant.kScaleFactor,
              ),
              CircularPercentIndicator(
                radius: 16 * LayoutConstant.kScaleFactor,
                lineWidth: 4,
                percent: programPercent(program: program),
                progressColor: context.theme.primaryColor,
                backgroundColor: context.theme.canvasColor,
                circularStrokeCap: CircularStrokeCap.round,
                animation: true,
                animationDuration: 800,
                center: Text(
                  program.days.toString(),
                  style: context.theme.textTheme.displaySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Return 0 -> 1
  double programPercent({required Program program}) => 0.5;
}
