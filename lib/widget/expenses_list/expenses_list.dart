import 'package:expensetracker/widget/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

import '../../model/expenses.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoverdExpense});
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoverdExpense;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (context, index) => Dismissible(
                background: Container(
                  color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.40),
                  margin: EdgeInsets.symmetric(
                      horizontal:
                          Theme.of(context).cardTheme.margin!.horizontal),
                ),
                onDismissed: (direction) {
                  onRemoverdExpense(expenses[index]);
                },
                key: ValueKey(expenses[index]),
                child: ExprensesItem(expenses[index]))));
  }
}
