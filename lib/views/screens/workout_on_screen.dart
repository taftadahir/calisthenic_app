import 'package:calisthenic_app/configs/app_theme.dart';
import 'package:calisthenic_app/constants/layout_constant.dart';
import 'package:calisthenic_app/constants/route_constant.dart';
import 'package:calisthenic_app/controllers/timer_controller.dart';
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
    return Scaffold(
      appBar: AppBarComponent.getAppBarComponent(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.close_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(EvaIcons.moreVerticalOutline),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: AppTheme.kPhysics,
        child: Container(
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
              Expanded(
                child: Image.asset(
                  'assets/images/front_lever.png',
                ),
              ),
              SizedBox(
                height: 24 * LayoutConstant.kScaleFactor,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Push Up',
                    textAlign: TextAlign.center,
                    style: context.theme.textTheme.titleLarge,
                  ),
                  SizedBox(
                    width: LayoutConstant.kSpaceBetweenTitleAndElement,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.help_outline_rounded,
                      size: 32.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24 * LayoutConstant.kScaleFactor,
              ),
              const TimerComponent(),
              SizedBox(
                height: 24 * LayoutConstant.kScaleFactor,
              ),
              ButtonComponent(
                onPressed: () {
                  TimerController timerController = Get.find();
                  timerController.reset();
                  Get.toNamed(RouteConstant.kResultScreen);
                },
                text: 'Done',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
