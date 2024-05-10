import 'package:flutter/material.dart';
import 'package:grocery_task/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    App(
      preferences: prefs,
    ),
  );
}
