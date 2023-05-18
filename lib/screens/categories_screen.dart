import 'package:flutter/material.dart';
import 'package:meals_app/widgets/categories_grid_view.dart';

import '../models/meal.dart';



class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key , required this.onPressedFavorites}) : super(key: key);
  final void Function(BuildContext context , Meal meal) onPressedFavorites;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      // drawer: const Drawer(),
      body: CategoriesGridView(onPressedFavorites: onPressedFavorites),
    );
  }
}
