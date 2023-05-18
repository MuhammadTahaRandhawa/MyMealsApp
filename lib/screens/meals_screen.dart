import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';
import 'meals_detail_screen.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {Key? key, required this.categoryMeals, required this.title , required this.onPressedFavorites})
      : super(key: key);

  final List<Meal> categoryMeals;
  final String title;
  final void Function(BuildContext context , Meal meal) onPressedFavorites;

  String _toUpperCase(String string) {
    return string.substring(0, 1).toUpperCase() + string.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView(
      children: categoryMeals
          .map((meal) => Container(
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MealDetailScreen(meal: meal ,onPressedFavorites: onPressedFavorites),
                    ));
                  },
                  child: Stack(children: [
                    FadeInImage(
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: MemoryImage(kTransparentImage),
                        image: NetworkImage(meal.imageUrl)),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.black54,
                        child: Column(
                          children: [
                            Text(
                              meal.title,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MealItemTrait(
                                    label: '${meal.duration} min',
                                    iconData: Icons.schedule),
                                const SizedBox(
                                  width: 12,
                                ),
                                MealItemTrait(
                                    label: _toUpperCase(meal.complexity.name),
                                    iconData: Icons.work),
                                const SizedBox(
                                  width: 12,
                                ),
                                MealItemTrait(
                                    label:
                                        _toUpperCase(meal.affordability.name),
                                    iconData: Icons.attach_money)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ))
          .toList(),
    );
    if (categoryMeals.isEmpty) {
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Uh no ... nothing here!',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 28),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 16),
            textAlign: TextAlign.center,
          )
        ],
      );
    }
    return Scaffold(appBar: AppBar(title: Text(title)), body: content);
  }
}
