import 'package:flutter/material.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/categories_grid_view.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../models/meal.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

Map<Filter, bool> kFilterValues = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};
void _onPressFavorites(BuildContext context , Meal meal) {
  if (kFavoritesList.contains(meal)) {
    kFavoritesList.remove(meal);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Meal removed as favorite')));
  } else {
    kFavoritesList.add(meal);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Meal marked as favorite')));
  }
}


List<Meal> kFavoritesList = [];

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentPageIndex = 0;

  void _selectPageIndex(index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String _title = 'Categories';
    Widget content = CategoriesGridView(onPressedFavorites: _onPressFavorites,);
    if (_currentPageIndex == 1) {
      _title = 'Your Favorites';
      content = MealsScreen(
        categoryMeals: kFavoritesList,
        title: '',
        onPressedFavorites: _onPressFavorites,
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        drawer: const MainDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              label: 'Categories',
              icon: Icon(Icons.set_meal),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            )
          ],
          currentIndex: _currentPageIndex,
          onTap: _selectPageIndex,
        ),
        body: content);
  }
}
