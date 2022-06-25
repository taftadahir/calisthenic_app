import 'package:calisthenic_app/constants/layout_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Application physics
  static ScrollPhysics? get kPhysics => const BouncingScrollPhysics();

  // Animation duration
  static Duration get animationDuration => const Duration(milliseconds: 300);

  // Common colors
  static Color successColor = const Color(0xFF4E937A);
  static Color whiteColor = const Color(0xFFFFFFFF);
  static Color primaryColor = const Color.fromRGBO(111, 123, 247, 1);
  static Color errorColor = const Color.fromRGBO(255, 84, 108, 1);
  static Color greyColor = const Color.fromRGBO(141, 153, 174, 1);

  // Light colors specific
  static Color backgroundLightColor = const Color.fromRGBO(245, 246, 250, 1);
  static Color backgroundCardLightColor =
      const Color.fromRGBO(240, 241, 245, 1);
  static Color blackLightColor = const Color.fromRGBO(48, 52, 63, 1);

  // Dark colors specific
  static Color backgroundDarkColor = const Color.fromRGBO(48, 52, 63, 1);
  static Color backgroundCardDarkColor = const Color.fromRGBO(52, 57, 71, 1);

  // Elevated button theme
  static final ElevatedButtonThemeData elevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      fixedSize: MaterialStateProperty.all(
        Size(double.infinity, 40 * LayoutConstant.kScaleFactor),
      ),
      animationDuration: AppTheme.animationDuration,
      backgroundColor: MaterialStateProperty.all(primaryColor),
      elevation: MaterialStateProperty.all(0.0),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 24),
      ),
    ),
  );

  // TODO: Theme definitions
  static ThemeData get dark => ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundDarkColor,
        cardColor: backgroundCardDarkColor,
        canvasColor: greyColor,
        elevatedButtonTheme: elevatedButtonTheme,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.montserrat(
            fontSize: 20 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w600,
            color: whiteColor,
          ),
          displayMedium: GoogleFonts.montserrat(
            fontSize: 16 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w600,
            color: whiteColor,
          ),
          displaySmall: GoogleFonts.montserrat(
            fontSize: 12 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w500,
            color: whiteColor,
          ),
          headlineLarge: GoogleFonts.montserrat(
            fontSize: 24 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w700,
            color: whiteColor,
          ),
          headlineMedium: GoogleFonts.montserrat(
            fontSize: 20 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w700,
            color: whiteColor,
          ),
          titleLarge: GoogleFonts.montserrat(
            fontSize: 24 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w700,
            color: whiteColor,
          ),
          titleMedium: GoogleFonts.montserrat(
            fontSize: 16 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w600,
            color: whiteColor,
          ),
          labelMedium: GoogleFonts.montserrat(
            fontSize: 16 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w600,
            color: whiteColor,
          ),
          labelSmall: GoogleFonts.montserrat(
            fontSize: 10 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w500,
            color: whiteColor,
          ),
          bodySmall: GoogleFonts.montserrat(
            fontSize: 12 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w400,
            color: whiteColor,
            height: 1.8,
          ),
          bodyLarge: GoogleFonts.montserrat(
            fontSize: 40 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w700,
            color: primaryColor,
          ),
        ),
        iconTheme: IconThemeData(
          color: whiteColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: backgroundDarkColor,
          iconTheme: IconThemeData(
            color: whiteColor,
          ),
        ),
      );

  static ThemeData get light => ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundLightColor,
        cardColor: backgroundCardLightColor,
        canvasColor: greyColor,
        elevatedButtonTheme: elevatedButtonTheme,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.montserrat(
            fontSize: 20 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w600,
            color: blackLightColor,
          ),
          displayMedium: GoogleFonts.montserrat(
            fontSize: 16 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(48, 52, 63, 1),
          ),
          displaySmall: GoogleFonts.montserrat(
            fontSize: 12 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w500,
            color: blackLightColor,
          ),
          headlineLarge: GoogleFonts.montserrat(
            fontSize: 24 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w700,
            color: blackLightColor,
          ),
          headlineMedium: GoogleFonts.montserrat(
            fontSize: 20 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w700,
            color: blackLightColor,
          ),
          titleLarge: GoogleFonts.montserrat(
            fontSize: 24 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w700,
            color: blackLightColor,
          ),
          titleMedium: GoogleFonts.montserrat(
            fontSize: 16 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w600,
            color: blackLightColor,
          ),
          labelMedium: GoogleFonts.montserrat(
            fontSize: 16 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w600,
            color: blackLightColor,
          ),
          labelSmall: GoogleFonts.montserrat(
            fontSize: 10 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w500,
            color: blackLightColor,
          ),
          bodyLarge: GoogleFonts.montserrat(
            fontSize: 40 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w700,
            color: primaryColor,
          ),
          bodySmall: GoogleFonts.montserrat(
            fontSize: 12 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w400,
            color: blackLightColor,
            height: 1.8,
          ),
        ),
        iconTheme: IconThemeData(
          color: blackLightColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: backgroundLightColor,
          iconTheme: IconThemeData(
            color: blackLightColor,
          ),
        ),
      );
}
