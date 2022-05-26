import 'package:calisthenic_app/constants/layout_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Application physics
  static ScrollPhysics? get kPhysics => const BouncingScrollPhysics();

  static ThemeData get dark => ThemeData(
        primaryColor: const Color.fromRGBO(111, 123, 247, 1),
        scaffoldBackgroundColor: const Color.fromRGBO(48, 52, 63, 1),
        cardColor: const Color.fromRGBO(52, 57, 71, 1),
        canvasColor: const Color.fromRGBO(141, 153, 174, 1),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.montserrat(
            fontSize: 20 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w600,
            color: const Color(0xffffffff),
          ),
          displaySmall: GoogleFonts.montserrat(
            fontSize: 12 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w500,
            color: const Color(0xffffffff),
          ),
          headlineLarge: GoogleFonts.montserrat(
            fontSize: 24 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w700,
            color: const Color(0xffffffff),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xffffffff),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(48, 52, 63, 1),
          iconTheme: IconThemeData(
            color: Color(0xffffffff),
          ),
        ),
      );

  static ThemeData get light => ThemeData(
        primaryColor: const Color.fromRGBO(111, 123, 247, 1),
        scaffoldBackgroundColor: const Color.fromRGBO(245, 246, 250, 1),
        cardColor: const Color.fromRGBO(240, 241, 245, 1),
        canvasColor: const Color.fromRGBO(141, 153, 174, 1),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.montserrat(
            fontSize: 20 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(48, 52, 63, 1),
          ),
          displaySmall: GoogleFonts.montserrat(
            fontSize: 12 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(48, 52, 63, 1),
          ),
          headlineLarge: GoogleFonts.montserrat(
            fontSize: 24 * LayoutConstant.kScaleFactor,
            fontWeight: FontWeight.w700,
            color: const Color.fromRGBO(48, 52, 63, 1),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(48, 52, 63, 1),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(245, 246, 250, 1),
          iconTheme: IconThemeData(
            color: Color.fromRGBO(48, 52, 63, 1),
          ),
        ),
      );
}
