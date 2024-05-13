import 'package:flutter/material.dart';
import 'package:grocery_task/app.dart';
import 'package:grocery_task/home/provider/categories_provider.dart';
import 'package:grocery_task/home/provider/products_provider.dart';
import 'package:grocery_task/home/repository/categories_repository.dart';
import 'package:grocery_task/home/repository/products_repository.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
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
