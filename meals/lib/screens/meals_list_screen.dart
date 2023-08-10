import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/constants/colors.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/widgets/meal_itam.dart';

class MealsListScreen extends ConsumerStatefulWidget {
  const MealsListScreen(
      {super.key,
      this.foodCategory,
      required this.filteredList,
      required this.filteredMeals});
      
  final String? foodCategory;
  final List<Meal> filteredList;
  final List<Meal> filteredMeals;

  @override
  ConsumerState<MealsListScreen> createState() => _MealsListScreenState();
}

class _MealsListScreenState extends ConsumerState<MealsListScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 600),
        lowerBound: 0,
        upperBound: 1);

    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var filteredMealsList = widget.filteredMeals
        .where((meal) => meal.categories.contains(widget.foodCategory))
        .toList();

    if (widget.foodCategory == null) {
      filteredMealsList = widget.filteredList;
    }

    var content = widget.filteredMeals.isEmpty
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

    if (widget.foodCategory == null) {
      return content;
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          widget.foodCategory!,
          style: const TextStyle(color: primaryFontColor),
        ),
      ),
      body: AnimatedBuilder(
        animation: _animationController,
        child: content,
        builder: (context, child) => SlideTransition(
          position: Tween(begin: const Offset(0, 2), end: const Offset(0, 0))
              .animate(CurvedAnimation(
                  parent: _animationController, curve: Curves.easeInOut)),
          child: child,
        ),
      ),
    );
  }
}
