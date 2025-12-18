import 'package:flutter/material.dart';
import '../model/expense_model.dart'; 
import '../data/expense_data.dart'; 
import './expenses_list.dart'; 
import './new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = initialExpenses;

  void _openAddExpenseOverlay() async{
    final Expense? newExpense = await showModalBottomSheet<Expense>(
      context: context,
      isScrollControlled: true, 
      // builder: (ctx) => NewExpense(onAddExpense: _addExpense), 
      builder: (ctx) => NewExpense(), 
    );
    if (newExpense != null) {
        setState(() {
            _registeredExpenses.add(newExpense);
        });
    }  
  }
  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // put the expense back at the old index
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }
  

  @override  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 200, 218, 253),
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExpenseOverlay
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10,right: 10),
        child: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.all(10), 
              margin: EdgeInsets.only(top: 20, bottom: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)), 
                color: Colors.white 
              ),
              
              child: const Center(
                child: Text(
                  'Filter', 
                  style: TextStyle(
                    fontWeight: FontWeight.bold, 
                    fontSize: 20,
                    color: Colors.black, 
                  ),
                ),
              ),
            ),
            
            Expanded( // Expanded is required because ListView.builder needs bounded height
              child: ExpensesList(
                expenses: _registeredExpenses,
                onRemoveExpense: _removeExpense, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}