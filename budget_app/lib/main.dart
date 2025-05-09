import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/expense.dart';
import 'screens/home_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();



    await Hive.initFlutter();
    Hive.registerAdapter(ExpenseAdapter()); 
    await Hive.openBox<Expense>('expenses'); 
    runApp(BudgetApp()); // Runs the app
}

class BudgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget App',
      theme: ThemeData(
        primarySwatch: Colors.pink, // Base color theme
        scaffoldBackgroundColor: Colors.pink[50], // Light pink background
        fontFamily: 'Arial', // Font style
      ),
      home: HomeScreen(), // Entry screen of the ap
    );
  }
}
