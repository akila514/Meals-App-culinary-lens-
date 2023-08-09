import 'package:flutter/material.dart';
import 'package:meals/constants/colors.dart';
import 'package:meals/data/meal_data.dart';
import 'package:meals/model/meal_categorey.dart';
import 'package:meals/screens/meals_list_screen.dart';

import '../model/meal.dart';

class CategoreyItem extends StatelessWidget {
  const CategoreyItem(
      {super.key,
      required this.category,
      required this.toggleFavouriteButton,
      this.filteredMeals});

  final FoodCategory category;
  final void Function(Meal meal) toggleFavouriteButton;
  final List<Meal>? filteredMeals;

  void navigateToDescriptionScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealsListScreen(
          filteredMeals: filteredMeals ?? dummyMeals,
          foodCategory: category.title,
          filteredList: dummyMeals,
          toggleFavouriteButton: toggleFavouriteButton,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateToDescriptionScreen(context);
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes the position of the shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [
            category.color,
            category.color.withOpacity(0.8),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              category.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: primaryFontColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
