import 'package:flutter/material.dart';
import 'package:grocery_task/home/models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: category.color.withOpacity(0.2),
            child: Image.asset(
              category.iconAsset,
              height: 28,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            category.name,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
