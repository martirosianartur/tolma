import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tolma/models/meal.dart';

class FavoritesMealNotifier extends StateNotifier<List<Meal>> {
  FavoritesMealNotifier() : super([]);

  /// Add a meal to the favorites list if it is not already there,
  /// or remove it if it is already a favorite.
  void toggleMealFavoriteStatus(Meal meal) {
    final bool mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      /// The meal is already in the favorites list. Filter out the meal with the same id from the current state list
      /// and assigns the new list to state. This effectively removes the meal from the favorites.
      state = state.where((ml) => ml.id != meal.id).toList();
    } else {
      /// Add the meal to the favorites.
      state = [...state, meal];
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoritesMealNotifier, List<Meal>>((ref) {
  return FavoritesMealNotifier();
});
