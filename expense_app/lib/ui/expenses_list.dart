import 'package:flutter/material.dart';
import '../model/expense_model.dart'; 
import 'expense_item.dart'; 

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses, 
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (expenses.isNotEmpty){
      content = ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(expenses[index].id),
            onDismissed: (direction) {
              onRemoveExpense(expenses[index]);
            },
            child: ExpenseItem(
              expense: expenses[index], 
            ),
          );
        },
      );
    }
    return content;
  }
}