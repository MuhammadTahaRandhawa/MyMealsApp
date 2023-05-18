import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({Key? key, required this.label, required this.iconData})
      : super(key: key);

  final String label;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: Theme.of(context).colorScheme.onBackground,
          size: 17,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        )
      ],
    );
  }
}
