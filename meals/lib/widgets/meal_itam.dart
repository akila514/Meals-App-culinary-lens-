import 'package:flutter/material.dart';
import 'package:meals/constants/colors.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/widgets/detail_box_row.dart';

import '../screens/description_screen.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {super.key, required this.meal,});
  final Meal meal;

  void navigateToDescriptionScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DescriptonScreen(
            meal: meal,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateToDescriptionScreen(context);
      },
      child: Column(
        children: [
          SizedBox(
            height: 250,
            child: Image.network(
              meal.imageUrl,
              width: double.infinity,
              fit: BoxFit.fill,
              loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null
                      ? child
                      : const LinearProgressIndicator(
                          color: cardBackgroundColor,
                        ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: const BoxDecoration(color: cardBackgroundColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.title,
                  style: const TextStyle(
                      fontSize: 20,
                      color: primaryFontColor,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(),
                const SizedBox(
                  height: 5,
                ),
                DetailBoxRow(meal: meal)
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
