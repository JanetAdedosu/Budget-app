import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

class BudgetApp extends StatelessWidget {
  const BudgetApp({super.key});

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
