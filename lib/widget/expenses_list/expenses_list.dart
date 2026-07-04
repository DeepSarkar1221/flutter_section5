import 'package:flutter/material.dart';
import 'package:flutter_section5/models/expense.dart';
import 'package:flutter_section5/widget/expenses_list/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expense,
    required this.removeExpense,
  });
  final List<Expense> expense;
  final void Function(Expense expense) removeExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: (ctx, index) => Dismissible(
        onDismissed: (direction) => removeExpense(expense[index]),
        key: ValueKey(expense[index]),
        child: ExpensesItem(expense: expense[index]),
      ),
    );
  }
}
