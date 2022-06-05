import 'dart:async';

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

class RestScreen extends StatelessWidget {
  const RestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent.getAppBarComponent(
        leading: IconButton(
          onPressed: () {
            TimerController timerController = Get.find();
            timerController.pause();
            timerController.startPause();
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
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
                      TimerController controller = Get.find();
                      controller.reset();
                      controller.count = 10;
                      controller.initialCount = 10;
                      controller.pauseCount = 0;
                      controller.start();
                      Get.toNamed(RouteConstant.kWorkoutOnScreen);
                    },
                    text: 'Skip',
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
    timerController.pauseForPause();
    timerController.start();
  }
}
