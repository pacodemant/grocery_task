import 'package:flutter/material.dart';
import 'package:grocery_task/home/provider/categories_provider.dart';
import 'package:grocery_task/home/widgets/action_headline.dart';
import 'package:grocery_task/home/widgets/category_item.dart';
import 'package:provider/provider.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<CategoriesProvider>().categories;
    return Column(
      children: [
        const ActionHeadline(title: 'Categories'),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return CategoryItem(category: category);
            },
          ),
        ),
      ],
    );
  }
}
