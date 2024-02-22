import 'package:flutter/material.dart';
import 'package:grocery_task/home/repository/categories_repository.dart';
import 'package:grocery_task/home/widgets/action_headline.dart';
import 'package:grocery_task/home/widgets/category_item.dart';

class CategoriesSection extends StatelessWidget {
  CategoriesSection({super.key});
  final _categories = CategoryRepository().getCategories();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ActionHeadline(title: 'Categories'),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              final category = _categories[index];
              return CategoryItem(category: category);
            },
          ),
        ),
      ],
    );
  }
}
