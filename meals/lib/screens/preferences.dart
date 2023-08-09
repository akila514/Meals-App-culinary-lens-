import 'package:flutter/material.dart';
import 'package:meals/constants/colors.dart';

class Preferences extends StatefulWidget {
  const Preferences({super.key, required this.activeFilters});
  final Map<Filter, bool> activeFilters;

  @override
  State<StatefulWidget> createState() {
    return _PreferencesState();
  }
}

enum Filter {
  glutenFree,
  vegan,
  lactosFree,
  vegetarian,
}

class _PreferencesState extends State<Preferences> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isLactosFree = false;
  var _isVegetarian = false;

  @override
  void initState() {
    _isGlutenFree = widget.activeFilters[Filter.glutenFree]!;
    _isVegan = widget.activeFilters[Filter.vegan]!;
    _isLactosFree = widget.activeFilters[Filter.lactosFree]!;
    _isVegetarian = widget.activeFilters[Filter.vegetarian]!;

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
          Navigator.of(context).pop({
            Filter.glutenFree: _isGlutenFree,
            Filter.vegan: _isVegan,
            Filter.lactosFree: _isLactosFree,
            Filter.vegetarian: _isVegetarian,
          });
          return false;
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
