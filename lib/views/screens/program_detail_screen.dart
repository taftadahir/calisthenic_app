import 'dart:convert';

import 'package:calisthenic_app/configs/app_theme.dart';
import 'package:calisthenic_app/constants/layout_constant.dart';
import 'package:calisthenic_app/controllers/app_controller.dart';
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
      body: GetBuilder(builder: (AppController appController) {
        return SingleChildScrollView(
          physics: AppTheme.kPhysics,
          padding: EdgeInsets.symmetric(
            horizontal: LayoutConstant.kHorizontalScreenPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appController.images!.isEmpty
                  ? const SizedBox(height: 0)
                  : SizedBox(
                      height: Get.width -
                          2 * LayoutConstant.kHorizontalScreenPadding,
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
              Text(
                appController.program!.name,
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
                appController.program!.description ?? '---',
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
                appController.program!.tips ?? '---',
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
