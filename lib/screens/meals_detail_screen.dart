import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatefulWidget {
  const MealDetailScreen({Key? key, required this.meal ,required this.onPressedFavorites}) : super(key: key);

  final Meal meal;
  final void Function(BuildContext context , Meal meal) onPressedFavorites;
  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
          IconButton(onPressed: ()
              {
                widget.onPressedFavorites(context , widget.meal) ;
              }, icon: const Icon(Icons.star))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: NetworkImage(widget.meal.imageUrl),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            ...widget.meal.ingredients.map(
              (ingredient) => Text(
                ingredient,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            ...widget.meal.steps.map(
              (ingredient) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ingredient,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
