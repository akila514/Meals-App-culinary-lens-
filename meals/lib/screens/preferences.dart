import 'package:flutter/material.dart';
import 'package:meals/constants/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/filters_provider.dart';

class Preferences extends ConsumerStatefulWidget {
  const Preferences({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PreferencesState();
  }
}

class _PreferencesState extends ConsumerState<Preferences> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isLactosFree = false;
  var _isVegetarian = false;

  @override
  void initState() {
    final activeFilters = ref.read(filtersProvider);

    _isGlutenFree = activeFilters[Filter.glutenFree]!;
    _isVegan = activeFilters[Filter.vegan]!;
    _isLactosFree = activeFilters[Filter.lactosFree]!;
    _isVegetarian = activeFilters[Filter.vegetarian]!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text('Preferences'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _isGlutenFree,
            Filter.vegan: _isVegan,
            Filter.lactosFree: _isLactosFree,
            Filter.vegetarian: _isVegetarian,
          });
          return true;
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              SwitchListTile(
                value: _isVegan,
                activeColor: switchTileColor,
                //activeTrackColor: cardBackgroundColor,
                onChanged: (isChecked) {
                  setState(() {
                    _isVegan = isChecked;
                  });
                },
                title: const Text(
                  'Vegan',
                  style: TextStyle(fontSize: 20, color: primaryFontColor),
                ),
                subtitle: const Text(
                  'Only include Vegan meals',
                  style: TextStyle(fontSize: 14, color: regularTextColor),
                ),
              ),
              SwitchListTile(
                value: _isGlutenFree,
                activeColor: switchTileColor,
                //activeTrackColor: cardBackgroundColor,
                onChanged: (isChecked) {
                  setState(() {
                    _isGlutenFree = isChecked;
                  });
                },
                title: const Text(
                  'Gluten Free',
                  style: TextStyle(fontSize: 20, color: primaryFontColor),
                ),
                subtitle: const Text(
                  'Only include Gluten Free meals',
                  style: TextStyle(fontSize: 14, color: regularTextColor),
                ),
              ),
              SwitchListTile(
                value: _isLactosFree,
                activeColor: switchTileColor,
                //activeTrackColor: cardBackgroundColor,
                onChanged: (isChecked) {
                  setState(() {
                    _isLactosFree = isChecked;
                  });
                },
                title: const Text(
                  'Lactos Free',
                  style: TextStyle(fontSize: 20, color: primaryFontColor),
                ),
                subtitle: const Text(
                  'Only include Lactos Free meals',
                  style: TextStyle(fontSize: 14, color: regularTextColor),
                ),
              ),
              SwitchListTile(
                value: _isVegetarian,
                activeColor: switchTileColor,
                //activeTrackColor: cardBackgroundColor,
                onChanged: (isChecked) {
                  setState(() {
                    _isVegetarian = isChecked;
                  });
                },
                title: const Text(
                  'Vegetarian',
                  style: TextStyle(fontSize: 20, color: primaryFontColor),
                ),
                subtitle: const Text(
                  'Only include Vegetarian meals',
                  style: TextStyle(fontSize: 14, color: regularTextColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
