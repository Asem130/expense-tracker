import 'package:expensetracker/model/expenses.dart';
import 'package:expensetracker/widget/chart/chart.dart';
import 'package:expensetracker/widget/expenses_list/new_expenses.dart';
import 'package:flutter/material.dart';

import 'expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({
    super.key,
  });

  @override
  State<Expenses> createState() => _Expenses();
}

class _Expenses extends State<Expenses> {
  final List<Expense> _registerdExpense = [];

  void addExpense(Expense expense) {
    setState(() {
      _registerdExpense.add(expense);
    });
  }

  void _openAddEpensesOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => NewExpenses(
              onAddExpense: addExpense,
            ));
  }

  void __removeExpense(Expense expense) {
    final expenseIndex = _registerdExpense.indexOf(expense);
    setState(() {
      _registerdExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Expense was deleted!',
        ),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registerdExpense.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Expanded(
      child: Center(
        child: Text(
          'There is not expense yet !, Try to add expense',
          style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 74, 66, 79)),
          textAlign: TextAlign.center,
        ),
      ),
    );
    if (_registerdExpense.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registerdExpense,
        onRemoverdExpense: __removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expensestracker'),
        actions: [
          IconButton(
              onPressed: _openAddEpensesOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Chart(expenses: _registerdExpense),
          mainContent,
        ],
      ),
    );
  }
}
