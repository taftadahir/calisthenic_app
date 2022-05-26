import 'package:calisthenic_app/constants/layout_constant.dart';
import 'package:flutter/material.dart';

class AppBarComponent {
  static AppBar getAppBarComponent({
    Widget? leading,
    List<Widget>? actions,
  }) {
    return AppBar(
      leading: leading,
      actions: actions,
      elevation: LayoutConstant.kCardElevation,
    );
  }
}
