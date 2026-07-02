import 'package:flutter/material.dart';
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
      category: Category.leisure,
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
      category: Category.work,
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
      category: Category.travel,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Expense Tracker"),
        
        actions: [
        
        IconButton(onPressed: (){}, icon: Icon(Icons.add))
      ],),
      body: Column(
        children: [
          Text("The Chart"),
          SizedBox(height: 10,),
          Expanded(child: ExpensesList(expense: _registeredExpenses)),
        ],
      ),
    );
  }
}
