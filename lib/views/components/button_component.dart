import 'package:calisthenic_app/configs/app_theme.dart';
import 'package:calisthenic_app/constants/layout_constant.dart';
import 'package:calisthenic_app/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonComponent extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final bool forPopUp;
  final bool forError;
  const ButtonComponent({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isPrimary = true,
    this.forPopUp = false,
    this.forError = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppTheme.elevatedButtonTheme.style?.copyWith(
        fixedSize: MaterialStateProperty.all(
          Size(
            double.infinity,
            forPopUp
                ? 32 * LayoutConstant.kScaleFactor
                : 40 * LayoutConstant.kScaleFactor,
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24),
        ),
        backgroundColor: MaterialStateProperty.all(
          isPrimary
              ? null
              : (forError ? AppTheme.errorColor : context.theme.cardColor),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: isPrimary
            ? GoogleFonts.montserrat(
                fontSize: 16 * LayoutConstant.kScaleFactor,
                fontWeight: FontWeight.w500,
                color: AppTheme.whiteColor,
              )
            : (forError
                ? GoogleFonts.montserrat(
                    fontSize: 16 * LayoutConstant.kScaleFactor,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.whiteColor,
                  )
                : (ThemeService.theme == ThemeMode.dark
                    ? GoogleFonts.montserrat(
                        fontSize: 16 * LayoutConstant.kScaleFactor,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.whiteColor,
                      )
                    : GoogleFonts.montserrat(
                        fontSize: 16 * LayoutConstant.kScaleFactor,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.blackLightColor,
                      ))),
      ),
    );
  }
}
