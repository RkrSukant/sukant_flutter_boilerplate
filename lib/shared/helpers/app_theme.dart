import 'package:flutter/material.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/colors.dart';

class AppTheme {
  static const colors = AppColors();

  const AppTheme._();

  static ThemeData define() {
    return ThemeData(
      fontFamily: 'Inter',
      primaryColor: colors.backGroundColor,
      scaffoldBackgroundColor: colors.backGroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: colors.secondaryColor,
        surface: colors.white_ffffff,
        surfaceTint: colors.white_ffffff,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.grey_rgba_E8E9F1,
      ),
    );
  }
}