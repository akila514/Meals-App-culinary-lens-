import 'package:flutter/material.dart';

import 'package:meals/constants/colors.dart';
import 'package:meals/data/meal_data.dart';
import 'package:meals/widgets/all_categorey_item.dart';
import 'package:meals/widgets/categorey_item.dart';
import 'package:meals/widgets/new_meals.dart';
import '../model/meal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {super.key, this.filterdMealList});
      
  final List<Meal>? filterdMealList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Column(
          children: [
            const NewMeals(),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 40, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Categories',
                  style: TextStyle(
                      fontSize: 24,
                      color: primaryFontColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Browse meals from categories you like the most.',
                  style: TextStyle(fontSize: 16, color: regularTextColor),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AllCategoreyItem(
                filterdMealList: filterdMealList ?? dummyMeals,
               ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              child: GridView(
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                children: [
                  for (final categorey in availableCategories)
                    CategoreyItem(
                      filteredMeals: filterdMealList,
                      category: categorey,
                   
                    )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
