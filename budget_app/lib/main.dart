import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter is ready before we do async operations

  
  runApp(BudgetApp()); // Runs the app
}

class BudgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Budget App',
      theme: ThemeData(
        primarySwatch: Colors.pink, // Base color theme
        scaffoldBackgroundColor: Colors.pink[50], // Light pink background
        fontFamily: 'Arial', // Font style
      ),
      
    );
  }
}
