import 'package:flutter/material.dart';
import 'package:meals/constants/colors.dart';

class LargeCustomizedText extends StatelessWidget {
  const LargeCustomizedText(
      {super.key, required this.text, required this.fontsize});

  final double fontsize;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontsize,
              color: primaryFontColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
