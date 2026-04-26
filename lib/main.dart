import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shashin Clothing Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Figma eke thiyena Pink/Magenta color eka
        primaryColor: const Color(0xFFD81B60), 
        scaffoldBackgroundColor: Colors.white, // Background eka sudu paatayi
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black, // App bar text eka kalu
          elevation: 0,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}