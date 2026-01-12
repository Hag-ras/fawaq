import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/typography.dart';

abstract class AppTheme {
  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: AppText.fontFamily,
      scaffoldBackgroundColor: AppColors.backgroundDark,

      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        background: AppColors.backgroundDark,
        surface: AppColors.surfaceDark,
        error: AppColors.danger,
      ),

      textTheme: const TextTheme(
        headlineLarge: AppText.h1,
        headlineMedium: AppText.h2,
        headlineSmall: AppText.h3,
        bodyLarge: AppText.body,
        bodyMedium: AppText.bodyMuted,
        labelSmall: AppText.caption,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundDark,
        elevation: 0,
        centerTitle: true,
      ),

      dividerColor: AppColors.borderDark,
      splashFactory: InkRipple.splashFactory,
    );
  }
}
