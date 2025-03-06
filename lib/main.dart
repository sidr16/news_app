import 'package:flutter/material.dart';
import 'package:news_app/pages/home_page/home_page.dart';
import 'package:provider/provider.dart';

import 'core/notifiers/news_list/news_list_notifier.dart';
import 'core/notifiers/theme_mode_notifier.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeModeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewsListNotifier(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModeNotifier = context.watch<ThemeModeNotifier>();

    return MaterialApp(
      title: 'News app',
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      scrollBehavior: const ScrollBehavior().copyWith(
        physics: const BouncingScrollPhysics(),
      ),
      debugShowCheckedModeBanner: false,
      themeMode: themeModeNotifier.themeMode,
      home: const HomePage(),
    );
  }
}
