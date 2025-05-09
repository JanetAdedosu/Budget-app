import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/expense.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();



    await Hive.initFlutter();

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
