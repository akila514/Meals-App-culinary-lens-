import 'package:flutter/material.dart';
import 'package:meals/constants/colors.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/widgets/detail_box_row.dart';
import 'package:meals/widgets/large_customized_text.dart';

class DescriptonScreen extends StatefulWidget {
  const DescriptonScreen(
      {super.key, required this.meal, required this.toggleFavouriteButton});

  final void Function(Meal meal) toggleFavouriteButton;
  final Meal meal;

  @override
  State<StatefulWidget> createState() {
    return _DescriptionScreen();
  }
}

class _DescriptionScreen extends State<DescriptonScreen> {
  void _toggleFavouriteButton(Meal meal) {
    widget.toggleFavouriteButton(meal);
  }

  bool isAddedToFavourites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          widget.meal.title,
          style: const TextStyle(color: primaryFontColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.meal.imageUrl,
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
              text: widget.meal.title,
              fontsize: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text(
                widget.meal.description,
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
                      setState(() {
                        isAddedToFavourites =
                            isAddedToFavourites ? false : true;
                      });
                      _toggleFavouriteButton(widget.meal);
                    },
                    icon: isAddedToFavourites
                        ? const Icon(
                            Icons.star,
                            color: Color(0XFFf39c12),
                          )
                        : const Icon(
                            Icons.star_outline,
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
              child: DetailBoxRow(meal: widget.meal),
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
                        color: widget.meal.isVegan
                            ? const Color(0XFF2ecc71)
                            : const Color(0XFFe74c3c),
                        size: 15,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          widget.meal.isVegan ? 'Vegan' : 'None Vegan',
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
                        color: widget.meal.isGlutenFree
                            ? const Color(0XFF2ecc71)
                            : const Color(0XFFe74c3c),
                        size: 15,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          widget.meal.isGlutenFree
                              ? 'GlutenFree'
                              : 'Not Gluten Free',
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
                        color: widget.meal.isLactoseFree
                            ? const Color(0XFF2ecc71)
                            : const Color(0XFFe74c3c),
                        size: 15,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          widget.meal.isLactoseFree
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
                        color: widget.meal.isVegetarian
                            ? const Color(0XFF2ecc71)
                            : const Color(0XFFe74c3c),
                        size: 15,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          widget.meal.isVegetarian
                              ? 'Vegetarian'
                              : 'Not Vegetarian',
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
            for (String item in widget.meal.ingredients)
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
              text: 'Steps to cook ${widget.meal.title}',
              fontsize: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            for (String step in widget.meal.steps)
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
