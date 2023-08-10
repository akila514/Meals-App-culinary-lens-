import 'package:flutter/material.dart';
import 'package:meals/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/tabs.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void navigateToHomeScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Tabs(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/img1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            Stack(
              children: [
                Container(
                    padding:
                        const EdgeInsets.only(left: 50, top: 20, bottom: 20),
                    width: double.infinity,
                    height: 300,
                    color: cardBackgroundColor.withOpacity(0.2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Culinary',
                          style: GoogleFonts.comfortaa(
                              fontSize: 64, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          'Lesne',
                          style: GoogleFonts.comfortaa(
                              fontSize: 64, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            navigateToHomeScreen(context);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 8,
                            backgroundColor: primaryFontColor,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                  color: backgroundColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
