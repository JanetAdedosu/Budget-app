import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/expense.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Controllers to read user input
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final expenses = _expenseBox.values.toList(); // Get all stored expenses
    
    return Scaffold(
      appBar: AppBar(title: Text('Cute Budget App')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Input for title
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Expense Title'),
            ),