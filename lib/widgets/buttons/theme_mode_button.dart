import 'package:flutter/material.dart';
import 'package:news_app/core/notifiers/theme_mode_notifier.dart';
import 'package:provider/provider.dart';

class ThemeModeButton extends StatelessWidget {
  const ThemeModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModeNotifier = context.read<ThemeModeNotifier>();

    return IconButton(
      onPressed: themeModeNotifier.switchThemeMode,
      icon: Icon(
        themeModeNotifier.isDark ? Icons.dark_mode : Icons.light_mode,
      ),
    );
  }
}
