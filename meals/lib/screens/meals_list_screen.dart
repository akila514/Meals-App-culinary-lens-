import 'package:flutter/material.dart';
import 'package:meals/constants/colors.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/widgets/meal_itam.dart';

class MealsListScreen extends StatelessWidget {
  const MealsListScreen(
      {super.key,
      this.foodCategory,
      required this.filteredList,
      required this.filteredMeals});
  final String? foodCategory;
  final List<Meal> filteredList;
  final List<Meal> filteredMeals;

  @override
  Widget build(BuildContext context) {
    var filteredMealsList = filteredMeals
        .where((meal) => meal.categories.contains(foodCategory))
        .toList();

    if (foodCategory == null) {
      filteredMealsList = filteredList;
    }

    var content = filteredMeals.isEmpty
        ? const Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Uhh oh nothing to see here yet!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: primaryFontColor),
              ),
            ),
          )
        : ListView.builder(
            itemCount: filteredMealsList.length,
            itemBuilder: (context, index) => MealItem(
              meal: filteredMealsList[index],
             
            ),
          );

    if (foodCategory == null) {
      return content;
    }

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: Text(
            foodCategory!,
            style: const TextStyle(color: primaryFontColor),
          ),
        ),
        body: content);
  }
}
