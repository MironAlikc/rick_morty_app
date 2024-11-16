import 'package:flutter/material.dart';
import 'package:rick_morty_app/presentation/theme/app_colors.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkTheme = true;

  ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBgColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBgColor,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBgColor,
    ),
  );

  void changeTheme() {
    isDarkTheme = !isDarkTheme;

    theme = ThemeData(
      scaffoldBackgroundColor:
          isDarkTheme ? AppColors.darkBgColor : AppColors.lightBgColor,
      appBarTheme: AppBarTheme(
        backgroundColor:
            isDarkTheme ? AppColors.darkBgColor : AppColors.lightBgColor,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor:
            isDarkTheme ? AppColors.lightBgColor : AppColors.darkBgColor,
        backgroundColor:
            isDarkTheme ? AppColors.darkBgColor : AppColors.lightBgColor,
      ),
    );

    notifyListeners();
  }

  OutlineInputBorder getTextFieldBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: isDarkTheme ? AppColors.lightBgColor : AppColors.darkBgColor,
      ),
      borderRadius: BorderRadius.circular(100),
    );
  }
}
