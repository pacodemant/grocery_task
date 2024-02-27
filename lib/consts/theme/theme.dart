import 'package:flutter/material.dart';
import 'package:grocery_task/consts/theme/color_schemes.g.dart';

ThemeData theme = ThemeData(
  scaffoldBackgroundColor: const Color(0xffF4F5F9),
  colorScheme: lightColorScheme,
  textTheme: const TextTheme(
    headlineSmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  colorScheme: darkColorScheme,
  textTheme: const TextTheme(
    headlineSmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
);
