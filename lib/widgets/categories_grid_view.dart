import 'package:flutter/material.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import '../data/dummy_data.dart';
import '../models/meal.dart';

class CategoriesGridView extends StatelessWidget {
  CategoriesGridView({Key? key , required this.onPressedFavorites}) : super(key: key);

  final void Function(BuildContext context , Meal meal) onPressedFavorites;
  _onSelectCategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealsScreen(
          categoryMeals: _selectedCategoryMeals, title: _categoryTitle , onPressedFavorites: onPressedFavorites),
    ));
  }

  final List<Meal> _selectedCategoryMeals = [];
  String _categoryTitle = '';

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      children: availableCategories
          .map(
            (category) => InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                _selectedCategoryMeals.clear();
                _categoryTitle = category.title;
                for (Meal meal in dummyMeals) {
                  if (meal.categories.contains(category.id)) {
                    if (kFilterValues[Filter.glutenFree] == true ||
                        kFilterValues[Filter.lactoseFree] == true ||
                        kFilterValues[Filter.vegetarian] == true ||
                        kFilterValues[Filter.vegan] == true) {
                      if (kFilterValues[Filter.glutenFree] == true &&
                          meal.isGlutenFree == false) {
                      } else if (kFilterValues[Filter.lactoseFree] == true &&
                          meal.isLactoseFree == false) {
                      } else if (kFilterValues[Filter.vegetarian] == true &&
                          meal.isVegetarian == false) {
                      } else if (kFilterValues[Filter.vegan] == true &&
                          meal.isVegan == false) {
                      } else {
                        _selectedCategoryMeals.add(meal);
                      }
                    } else {
                      _selectedCategoryMeals.add(meal);
                    }
                  }
                }
                _onSelectCategory(context);
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(colors: [
                      category.color,
                      category.color.withOpacity(0.8)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                //margin: const EdgeInsets.all(8),
                child: Text(
                  category.title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
