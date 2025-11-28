import 'package:flutter/material.dart';
import '../model/expense_model.dart'; 

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({
    super.key,
    required this.expense,
  });

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                // Amount
                Text('\$${expense.amount.toStringAsFixed(2)}'), 
                const Spacer(), 
                
                // Icon and Date
                Row(
                  children: [
                    Icon(_getIcon(expense.type)),
                    const SizedBox(width: 8),
                    Text(expense.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIcon(ExpenseType type) {
    switch (type) {
      case ExpenseType.FOOD:
        return Icons.lunch_dining;
      case ExpenseType.TRAVEL:
        return Icons.flight_takeoff;
      case ExpenseType.LEISURE:
        return Icons.movie;
      case ExpenseType.WORK:
        return Icons.work;
      default:
        return Icons.help_outline;
    }
  }
}