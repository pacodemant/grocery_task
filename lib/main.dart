// main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_task/app.dart';
import 'package:grocery_task/firebase_options.dart';
import 'package:grocery_task/home/provider/categories_provider.dart';
import 'package:grocery_task/home/provider/products_provider.dart';
import 'package:grocery_task/home/repository/categories_repository.dart';
import 'package:grocery_task/home/repository/products_repository.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  //DRUNTER - von mir aus VL-Folien "6.1.1_SD_Firebase_Übersicht" rauskopiert
  // wo fälschlicherweise steht, dass die Schritte 4, 5 und 9 ausgelassen werden können
  // was aber nicht stimmt, da die Firebase-Initialisierung explizit für die aktuelle App ist.

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ProductsRepository productsRepository = ProductsRepository();
  CategoryRepository categoryRepository = CategoryRepository();
   
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(productsRepository),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoriesProvider(categoryRepository),
        ),
      ],
      child: App(
        preferences: prefs,
      ),
    ),
  );
}
