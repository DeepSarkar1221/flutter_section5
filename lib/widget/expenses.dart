import 'package:flutter/material.dart';
import 'package:flutter_section5/new_expense.dart';
import 'package:flutter_section5/widget/expenses_list/expenses_list.dart';
import 'package:flutter_section5/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Chai Chai",
      ammount: 100.00,
      date: DateTime.now(),
      category: Category.food,
    ),

    Expense(
      title: "Lal Chai",
      ammount: 100.10,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onaddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIdx=_registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text("Expense Deleted!"),
        action: SnackBarAction(label: 'Undo', onPressed: (){
          setState(() {
            _registeredExpenses.insert(expenseIdx, expense);
          });
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No expense Found. Start Adding some!!"),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expense: _registeredExpenses,
        removeExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Expense Tracker"),

        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          Text("The Chart"),
          SizedBox(height: 10),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
