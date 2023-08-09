import 'package:flutter/material.dart';

class FoodCategory {
  const FoodCategory(
      {required this.id,
      required this.title,
      required this.description,
      this.color = Colors.orange});

  final String id;
  final String title;
  final Color color;
  final String description;
}
