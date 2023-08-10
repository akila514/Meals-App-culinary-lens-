import 'package:flutter/material.dart';
import 'package:meals/screens/home_screen.dart';

import '../constants/colors.dart';

class CustomizedBottomAppbar extends StatelessWidget {
  const CustomizedBottomAppbar({
    super.key,
    required this.activeScreen,
  });
  
  final String activeScreen;

  void navigateToHome(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
  }

  void navigateToSearch() {}

  void navigateTSettings() {}

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 8,
      color: cardBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              navigateToHome(context);
            },
            icon: Icon(
              Icons.home,
              color: activeScreen == 'home_screen'
                  ? Colors.pinkAccent
                  : primaryFontColor,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: activeScreen == 'search_screen'
                  ? Colors.pinkAccent
                  : primaryFontColor,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: activeScreen == 'settings_screen'
                  ? Colors.pinkAccent
                  : primaryFontColor,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
