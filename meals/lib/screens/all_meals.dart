import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_itam.dart';

import '../model/meal.dart';

class AllMeals extends StatefulWidget {
  const AllMeals({
    super.key,
    required this.filteredList,
  });

  final List<Meal> filteredList;

  @override
  State<AllMeals> createState() => _AllMealsState();
}

class _AllMealsState extends State<AllMeals>
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Meals'),
      ),
      body: AnimatedBuilder(
        animation: _animationController,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.filteredList.length,
                itemBuilder: (context, index) => MealItem(
                  meal: widget.filteredList[index],
                ),
              ),
            )
          ],
        ),
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
