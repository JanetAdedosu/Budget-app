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

  // Reference to the Hive box (local storage)
  final Box<Expense> _expenseBox = Hive.box<Expense>('expenses');

// Add a new expense to the box
  void _addExpense() {
    final title = _titleController.text;
    final amount = double.tryParse(_amountController.text); // Parse safely


    if (title.isEmpty || amount == null) return; // Validation

    final expense = Expense(
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    _expenseBox.add(expense); // Save to Hive box
// Clear input fields
    _titleController.clear();
    _amountController.clear();
    setState(() {}); // Refresh UI
  }

  // Delete expense at given index
  void _deleteExpense(int index) {
    _expenseBox.deleteAt(index); // Remove from Hive
    setState(() {}); // Refresh UI
  }



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
            // Input for amount
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addExpense,
              child: Text('Add Expense'),
            ),
            SizedBox(height: 20),

            // Expense list
            Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (ctx, i) {
                  final e = expenses[i];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(e.title),
                      subtitle: Text('${e.amount.toStringAsFixed(2)}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteExpense(i),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
