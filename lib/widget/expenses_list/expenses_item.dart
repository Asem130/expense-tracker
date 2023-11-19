import 'package:expensetracker/model/expenses.dart';
import 'package:flutter/material.dart';

class ExprensesItem extends StatelessWidget {
  const ExprensesItem(
    this.expenses, {
    super.key,
  });
  final Expense expenses;

  @override
  Widget build(BuildContext context) {
    return Card(
      
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

      
          children: [
            Text(expenses.title,style: Theme.of(context).textTheme.titleLarge,),
            Row(
              children: [
                Text('\$${expenses.mount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categortIcon[expenses.category]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expenses.getFromatedDate),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
