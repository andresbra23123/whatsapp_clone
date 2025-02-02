import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/core.dart';

class AppTheme {
  AppTheme({required this.isDarkmode});

  final bool isDarkmode;

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppThemeColors.tabColor,
          brightness: isDarkmode ? Brightness.dark : Brightness.light,
        ),
        scaffoldBackgroundColor: AppThemeColors.backgroundColor,
        dialogBackgroundColor: AppThemeColors.appBarColor,
        appBarTheme: const AppBarTheme(
          color: AppThemeColors.appBarColor,
        ),
        brightness: isDarkmode ? Brightness.dark : Brightness.light,
      );
}
