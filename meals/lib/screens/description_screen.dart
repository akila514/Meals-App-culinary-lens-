import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/constants/colors.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/provider/favourites_provider.dart';
import 'package:meals/widgets/detail_box_row.dart';
import 'package:meals/widgets/large_customized_text.dart';

class DescriptonScreen extends ConsumerWidget {
  const DescriptonScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  void _showSnackbarForAddingToFavourites(Meal meal, BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${meal.title} added to Favourists'),
      ),
    );
  }

  void _showSnackbarForRemovingFromFavourites(Meal meal, BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${meal.title} removed from Favourists'),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          meal.title,
          style: const TextStyle(color: primaryFontColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.fill,
              loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null
                      ? child
                      : const LinearProgressIndicator(
                          backgroundColor: Colors.white),
            ),
            LargeCustomizedText(
              text: meal.title,
              fontsize: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text(
                meal.description,
                style: const TextStyle(fontSize: 16, color: regularTextColor),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      final wasAdded = ref
                          .read(favouritsMealProvider.notifier)
                          .toggleMealFavouriteStatus(meal);
                      wasAdded
                          ? _showSnackbarForAddingToFavourites(meal, context)
                          : _showSnackbarForRemovingFromFavourites(
                              meal, context);
                    },
                    icon: const Icon(
                      Icons.star,
                      color: Color(0XFFf39c12),
                    ),
                  ),
                  const Text(
                    'Add to Favourites.',
                    style: TextStyle(color: regularTextColor, fontSize: 16),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: DetailBoxRow(meal: meal),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            GridView(
              padding: const EdgeInsets.only(left: 10, right: 30),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 6 / 1),
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: meal.isVegan
                            ? const Color(0XFF2ecc71)
                            : const Color(0XFFe74c3c),
                        size: 15,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          meal.isVegan ? 'Vegan' : 'None Vegan',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: regularTextColor),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: meal.isGlutenFree
                            ? const Color(0XFF2ecc71)
                            : const Color(0XFFe74c3c),
                        size: 15,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          meal.isGlutenFree ? 'GlutenFree' : 'Not Gluten Free',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: regularTextColor),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: meal.isLactoseFree
                            ? const Color(0XFF2ecc71)
                            : const Color(0XFFe74c3c),
                        size: 15,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          meal.isLactoseFree
                              ? 'Lactos Free'
                              : 'Not Lactos Free',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: regularTextColor),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: meal.isVegetarian
                            ? const Color(0XFF2ecc71)
                            : const Color(0XFFe74c3c),
                        size: 15,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          meal.isVegetarian ? 'Vegetarian' : 'Not Vegetarian',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: regularTextColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            const LargeCustomizedText(
              text: 'Required Ingredients',
              fontsize: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            for (String item in meal.ingredients)
              Padding(
                padding: const EdgeInsets.only(
                    left: 34, bottom: 5, top: 10, right: 20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_box,
                      color: primaryFontColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        item,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            LargeCustomizedText(
              text: 'Steps to cook ${meal.title}',
              fontsize: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            for (String step in meal.steps)
              Padding(
                padding: const EdgeInsets.only(
                    left: 34, bottom: 5, top: 10, right: 20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.menu_book,
                      color: primaryFontColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        step,
                        textAlign: TextAlign.start,
                      ),
                    ),
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
