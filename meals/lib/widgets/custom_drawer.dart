import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:meals/constants/colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifire) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: cardBackgroundColor),
            child: Center(
              child: Text(
                'Culinary Lense',
                style: GoogleFonts.comfortaa(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: primaryFontColor),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              onSelectScreen('home');
            },
            leading: const Icon(Icons.home),
            title: const Text('Home'),
          ),
          ListTile(
            onTap: () {
              onSelectScreen('preferences');
            },
            leading: const Icon(Icons.filter_alt),
            title: const Text('My Preferences'),
          ),
        ],
      ),
    );
  }
}
