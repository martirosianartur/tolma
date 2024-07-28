import 'package:flutter/material.dart';
import 'package:tolma/data/dummy_data.dart';
import 'package:tolma/models/category.dart';
import 'package:tolma/models/meal.dart';
import 'package:tolma/screens/meals.dart';
import 'package:tolma/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  // final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  const CategoriesScreen({
    super.key,
    // required this.onToggleFavorite,
    required this.availableMeals,
  });

  void _selectedCategory(BuildContext context, Category category) {
    final List<Meal> filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          // onToggleFavorite: onToggleFavorite,
        ),
      ),
    ); // Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        // AvailableCategories.map((category) => CategoryGridItem(category: category)).toList()
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectedCategory(context, category);
            },
          )
      ],
    );
  }
}
