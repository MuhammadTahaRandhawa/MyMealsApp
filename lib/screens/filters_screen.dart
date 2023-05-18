import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'package:meals_app/widgets/switch_tile.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  void _onChangedGlutenFree(value) {
    setState(() {
      kFilterValues[Filter.glutenFree] = value;
    });
  }

  void _onChangedLactoseFree(value) {
    setState(() {
      kFilterValues[Filter.lactoseFree] = value;
    });
  }

  void _onChangedVegetarian(value) {
    setState(() {
      kFilterValues[Filter.vegetarian] = value;
    });
  }

  void _onChangedVegan(value) {
    setState(() {
      kFilterValues[Filter.vegan] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchTile(
            title: 'Gluten-free',
            subtitle: 'only include gluten_free meals.',
            onChanged: _onChangedGlutenFree,
            value: kFilterValues[Filter.glutenFree]!,
          ),
          SwitchTile(
            title: 'Lactose-free',
            subtitle: 'only include lactose_free meals.',
            onChanged: _onChangedLactoseFree,
            value: kFilterValues[Filter.lactoseFree]!,
          ),
          SwitchTile(
            title: 'Vegetarian',
            subtitle: 'only include vegetarian meals.',
            onChanged: _onChangedVegetarian,
            value: kFilterValues[Filter.vegetarian]!,
          ),
          SwitchTile(
            title: 'Vegan',
            subtitle: 'only include vegan meals.',
            onChanged: _onChangedVegan,
            value: kFilterValues[Filter.vegan]!,
          ),
        ],
      ),
    );
  }
}
