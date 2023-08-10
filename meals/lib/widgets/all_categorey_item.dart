import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../model/meal.dart';
import '../screens/all_meals.dart';

class AllCategoreyItem extends StatelessWidget {
  const AllCategoreyItem(
      {super.key,
      required this.filterdMealList,
    });
  final List<Meal>? filterdMealList;

  void navigateToAllMeals(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AllMeals(
              filteredList: filterdMealList!,
             ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateToAllMeals(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
            height: 100,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/allmeal.jpg'),
                fit: BoxFit.fill,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset:
                      const Offset(0, 3), // changes the position of the shadow
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.fastfood,
                    color: primaryFontColor,
                    size: 60,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'All Meals',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: primaryFontColor,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
