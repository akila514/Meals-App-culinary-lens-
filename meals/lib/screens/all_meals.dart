import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_itam.dart';

import '../model/meal.dart';

class AllMeals extends StatelessWidget {
  const AllMeals(
      {super.key,
      required this.filteredList,
      required this.toggleFavouriteButton});
  final List<Meal> filteredList;
  final void Function(Meal meal) toggleFavouriteButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Meals'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredList.length,
              itemBuilder: (context, index) => MealItem(
                  meal: filteredList[index],
                  toggleFavouriteButton: toggleFavouriteButton),
            ),
          )
        ],
      ),
    );
  }
}
