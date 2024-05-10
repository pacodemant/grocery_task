import 'package:flutter/material.dart';
import 'package:grocery_task/consts/theme/theme.dart';
import 'package:grocery_task/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatefulWidget {
  const App({required this.preferences, super.key});

  final SharedPreferences preferences;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool get isDark => widget.preferences.getBool('isDark') ?? false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme,
      darkTheme: darkTheme,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(
        toggleTheme: () {
          setState(() {
            widget.preferences.setBool('isDark', !isDark);
          });
        },
      ),
    );
  }
}
