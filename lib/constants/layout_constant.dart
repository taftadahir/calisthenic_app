import 'package:get/get.dart';

class LayoutConstant {
  static const double kMinScreenWidth = 320.0;
  static double kScaleFactor = Get.width / kMinScreenWidth;
  static double kCardRadius = 8 * kScaleFactor;
  static double kCardElevation = 0;
  static double kSpaceBetweenTitleAndElement = 16 * kScaleFactor;
  static double kSpaceBetweenElements = 8 * kScaleFactor;
  static double kSpaceBetweenGroups = 32 * kScaleFactor;
  static double kHorizontalScreenPadding = 8.0 * kScaleFactor;
  static double kVerticalScreenPadding = 16.0 * kScaleFactor;
  static double kCardHeight = 80 * LayoutConstant.kScaleFactor;
  static double kInactiveDotSize = 8 * LayoutConstant.kScaleFactor;
  static double kActiveDotSize = 16 * LayoutConstant.kScaleFactor;
}
