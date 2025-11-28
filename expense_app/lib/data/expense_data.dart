import '../model/expense_model.dart'; 

final List<Expense> initialExpenses = [
  Expense(
    title: 'Pizza dinner',
    amount: 14,
    date: DateTime(2025, 11, 20), 
    type: ExpenseType.FOOD,
  ),
  Expense(
    title: 'Trip Gas for a week',
    amount: 7,
    date: DateTime(2025, 11, 25),
    type: ExpenseType.TRAVEL,
  ),
  Expense(
    title: 'Weekend icecream',
    amount: 2,
    date: DateTime(2025, 11, 26),
    type: ExpenseType.LEISURE,
  ),
  Expense(
    title: 'Grocery Run',
    amount: 18,
    date: DateTime(2025, 11, 27),
    type: ExpenseType.FOOD,
  ),
];