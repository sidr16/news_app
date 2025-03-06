import 'package:flutter/material.dart';

class ThemeModeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void switchThemeMode() {
    final platformBrightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;

    final newThemeMode = switch (_themeMode) {
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.light,
      ThemeMode.system => platformBrightness == Brightness.dark
          ? ThemeMode.light
          : ThemeMode.dark,
    };

    setThemeMode(newThemeMode);
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  bool get isDark => _themeMode == ThemeMode.dark;
}
