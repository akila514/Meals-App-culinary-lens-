import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/constants/colors.dart';
import 'package:meals/screens/welcome_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true)
          .copyWith(textTheme: GoogleFonts.poppinsTextTheme()),
      home: const ProviderScope(child: App()),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: backgroundColor),
        child: const WelcomeScreen(),
      ),
    );
  }
}