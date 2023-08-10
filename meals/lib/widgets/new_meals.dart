import 'package:flutter/material.dart';
import 'package:meals/constants/colors.dart';
import 'package:meals/data/meal_data.dart';
import 'package:meals/screens/description_screen.dart';

import '../model/meal.dart';

class NewMeals extends StatelessWidget {
  const NewMeals({super.key,});

  void onNewMeadClick(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DescriptonScreen(
            meal: meal, ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Meal meal = dummyMeals[0];

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Discover',
              style: TextStyle(
                  fontSize: 28,
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
              'Explore What’s new.',
              style: TextStyle(fontSize: 16, color: regularTextColor),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            onNewMeadClick(context, meal);
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
                decoration: const BoxDecoration(color: cardBackgroundColor),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          meal.title,
                          style: const TextStyle(
                              fontSize: 20,
                              color: regularTextColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, bottom: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          meal.description,
                          style: const TextStyle(
                              fontSize: 16,
                              color: primaryFontColor,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
