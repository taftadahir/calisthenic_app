import 'dart:convert';

import 'package:calisthenic_app/configs/app_theme.dart';
import 'package:calisthenic_app/constants/layout_constant.dart';
import 'package:calisthenic_app/controllers/program_controller.dart';
import 'package:calisthenic_app/views/components/app_bar_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgramDetailScreen extends StatelessWidget {
  const ProgramDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();

    return Scaffold(
      appBar: AppBarComponent.getAppBarComponent(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: GetBuilder(builder: (ProgramController controller) {
        return SingleChildScrollView(
          physics: AppTheme.kPhysics,
          padding: EdgeInsets.symmetric(
            horizontal: LayoutConstant.kHorizontalScreenPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.programImages!.isEmpty
                  ? const SizedBox(height: 0)
                  : SizedBox(
                      height: Get.width -
                          2 * LayoutConstant.kHorizontalScreenPadding,
                      child: PageView.builder(
                        controller: pageController,
                        physics: AppTheme.kPhysics,
                        itemCount: controller.programImages?.length,
                        onPageChanged: (index) {
                          controller.activeProgramImage = index;
                        },
                        itemBuilder: (context, index) {
                          return Image.asset(
                            'assets/images/${controller.programImages![controller.activeProgramImage]}',
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
                    controller.programImages?.length ?? 0,
                    (index) => AnimatedContainer(
                      duration: AppTheme.animationDuration,
                      height: index == controller.activeProgramImage
                          ? LayoutConstant.kActiveDotSize
                          : LayoutConstant.kInactiveDotSize,
                      width: index == controller.activeProgramImage
                          ? LayoutConstant.kActiveDotSize
                          : LayoutConstant.kInactiveDotSize,
                      margin: EdgeInsets.symmetric(
                          horizontal: 4.0 * LayoutConstant.kScaleFactor),
                      decoration: BoxDecoration(
                        color: index == controller.activeProgramImage
                            ? context.theme.primaryColor
                            : context.theme.cardColor,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                controller.program!.name,
                style: context.theme.textTheme.titleLarge,
              ),
              SizedBox(
                height: LayoutConstant.kSpaceBetweenGroups,
              ),
              Text(
                'Description',
                style: context.theme.textTheme.titleMedium,
              ),
              SizedBox(
                height: LayoutConstant.kSpaceBetweenElements,
              ),
              Text(
                controller.program!.description ?? '---',
                style: context.theme.textTheme.bodySmall,
              ),
              SizedBox(
                height: LayoutConstant.kSpaceBetweenGroups,
              ),
              Text(
                'Tips',
                style: context.theme.textTheme.titleMedium,
              ),
              SizedBox(
                height: LayoutConstant.kSpaceBetweenElements,
              ),
              Text(
                controller.program!.tips ?? '---',
                style: context.theme.textTheme.bodySmall,
              ),
              SizedBox(
                height: LayoutConstant.kVerticalScreenPadding,
              ),
            ],
          ),
        );
      }),
    );
  }
}
