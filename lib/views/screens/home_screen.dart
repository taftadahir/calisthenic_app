import 'package:calisthenic_app/configs/app_theme.dart';
import 'package:calisthenic_app/constants/layout_constant.dart';
import 'package:calisthenic_app/controllers/program_controller.dart';
import 'package:calisthenic_app/services/theme_service.dart';
import 'package:calisthenic_app/views/components/app_bar_component.dart';
import 'package:calisthenic_app/views/components/program_card_component.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBarComponent.getAppBarComponent(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(EvaIcons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ThemeService.switchTheme();
            },
            icon: Icon(
              ThemeService.theme == ThemeMode.dark
                  ? EvaIcons.sunOutline
                  : EvaIcons.moonOutline,
            ),
          ),
        ],
      ),
      body: GetBuilder(
        builder: (ProgramController programController) {
          return ListView(
            physics: AppTheme.kPhysics,
            padding: EdgeInsets.only(
              top: LayoutConstant.kVerticalScreenPadding,
              left: LayoutConstant.kHorizontalScreenPadding,
              right: LayoutConstant.kHorizontalScreenPadding,
            ),
            children: [
              Text(
                'Programs',
                style: context.theme.textTheme.headlineLarge,
              ),
              SizedBox(
                height: LayoutConstant.kSpaceBetweenTitleAndElement,
              ),
              ...programController.programs.map(
                (program) => Padding(
                  padding: EdgeInsets.only(
                    bottom: LayoutConstant.kSpaceBetweenElements,
                  ),
                  child: ProgramCardComponent(program: program),
                ),
              ),
              SizedBox(
                height: LayoutConstant.kSpaceBetweenGroups -
                    LayoutConstant.kSpaceBetweenElements,
              ),
              Text(
                'Skills',
                style: context.theme.textTheme.headlineLarge,
              ),
              SizedBox(
                height: LayoutConstant.kSpaceBetweenTitleAndElement,
              ),
              ...programController.skills.map(
                (program) => Padding(
                  padding: EdgeInsets.only(
                    bottom: LayoutConstant.kSpaceBetweenElements,
                  ),
                  child: ProgramCardComponent(program: program),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
