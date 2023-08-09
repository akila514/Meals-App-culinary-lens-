import 'package:flutter/material.dart';
import 'package:meals/constants/colors.dart';

class DetailBox extends StatelessWidget {
  const DetailBox({super.key, required this.tile, required this.type});
  final String tile;
  final String type;

  @override
  Widget build(BuildContext context) {
    Color tileColor = Colors.white;
    if (type == 'Complexity') {
      if (tile == 'hard') {
        tileColor = const Color(0XFFfc5c65);
      }
      if (tile == 'challenging') {
        tileColor = const Color(0XFFffdd59);
      }
      if (tile == 'simple') {
        tileColor = const Color(0XFF26de81);
      }
    }
    if (type == 'Affordability') {
      if (tile == 'luxurious') {
        tileColor = const Color(0XFFfc5c65);
      }
      if (tile == 'pricey') {
        tileColor = const Color(0XFFffdd59);
      }
      if (tile == 'affordable') {
        tileColor = const Color(0XFF26de81);
      }
    }
    if (type == 'Duration') {
      if (int.parse(tile) >= 30) {
        tileColor = const Color(0XFFfc5c65);
      }
      if (int.parse(tile) <= 30 && int.parse(tile) >= 15) {
        tileColor = const Color(0XFFffdd59);
      }
      if (int.parse(tile) < 15) {
        tileColor = const Color(0XFF26de81);
      }
    }
    return Container(
      decoration: BoxDecoration(
        color: tileColor,
        borderRadius: BorderRadius.circular(5),
      ),
      height: 40,
      width: 110,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (type == 'Duration')
              const Row(
                children: [
                  Icon(
                    Icons.timer,
                    color: primaryFontColor,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            type == 'Duration'
                ? Text(
                    '$tile min',
                    style: const TextStyle(
                        color: primaryFontColor,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  )
                : Text(
                    tile,
                    style: const TextStyle(
                        color: primaryFontColor,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  )
          ],
        ),
      ),
    );
  }
}
