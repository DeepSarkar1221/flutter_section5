import 'package:flutter/material.dart';
import 'package:flutter_section5/new_expense.dart';
import 'package:flutter_section5/widget/expenses_list/expenses_list.dart';
import 'package:flutter_section5/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return (_ExpensesState());
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
      context: context,
      builder: (ctx) => NewExpense(onaddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
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
          Expanded(child: ExpensesList(expense: _registeredExpenses)),
        ],
      ),
    );
  }
}
