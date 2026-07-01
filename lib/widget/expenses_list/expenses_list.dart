import 'package:flutter/material.dart';
import 'package:flutter_section5/models/expense.dart';
import 'package:flutter_section5/widget/expenses_list/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expense});
  final List<Expense> expense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: (ctx, index) => ExpensesItem(expense: expense[index]),
    );
  }
}
