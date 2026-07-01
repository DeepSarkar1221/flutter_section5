import 'package:flutter/material.dart';
import 'package:flutter_section5/expenses_list.dart';
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
      title: "Mint Chai",
      ammount: 100.10,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Pudina Chai",
      ammount: 100.10,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Holud Chai",
      ammount: 100.10,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Blue Chai",
      ammount: 100.10,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Lal Chai",
      ammount: 100.10,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Sobuj Chai",
      ammount: 100.10,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Kalo Chai",
      ammount: 100.10,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("The Chart"),
          Expanded(child: ExpensesList(expense: _registeredExpenses)),
        ],
      ),
    );
  }
}
