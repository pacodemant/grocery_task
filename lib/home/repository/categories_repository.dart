import 'dart:ui';

import 'package:grocery_task/home/models/category.dart';

class CategoryRepository {
  List<Category> getCategories() {
    return categoriesMock;
  }

  Stream<List<Category>> getCategoriesStream() {
    return Stream.value(categoriesMock);
  }
}

final List<Category> categoriesMock = const [
  Category(
    name: 'Vegetable',
    iconAsset: 'assets/icons/vegetables.png',
    color: const Color(0xff28B446),
  ),
  Category(
    name: 'Fruits',
    iconAsset: 'assets/icons/fruits.png',
    color: const Color(0xffF8644A),
  ),
  Category(
    name: 'Beverages',
    iconAsset: 'assets/icons/beverages.png',
    color: const Color(0xffF5BA3C),
  ),
  Category(
    name: 'Grocery',
    iconAsset: 'assets/icons/grocery.png',
    color: const Color(0xffAE80FF),
  ),
  Category(
    name: 'Edible Oil',
    iconAsset: 'assets/icons/edible_oil.png',
    color: const Color(0xff0CD4DC),
  ),
  Category(
    name: 'Household',
    iconAsset: 'assets/icons/vacuum.png',
    color: const Color(0xffFF7EB6),
  ),
];
