import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'detail_box.dart';

class DetailBoxRow extends StatelessWidget {
  const DetailBoxRow(
      {super.key, required this.meal});

  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DetailBox(
            tile: meal.duration.toString(),
            type: 'Duration',
          ),
          DetailBox(
            tile: meal.complexity.name,
            type: 'Complexity',
          ),
          DetailBox(
            tile: meal.affordability.name,
            type: 'Affordability',
          ),
        ],
      ),
    );
  }
}
