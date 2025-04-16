import 'package:flutter/material.dart';
import 'pages/homepage.dart'; // Import the HomePage

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: HomePage(), // Set HomePage as the home screen
    );
  }
}
