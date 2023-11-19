import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final fromatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categortIcon = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense(
      {required this.title,
      required this.mount,
      required this.date,
      required this.category})
      : id = uuid.v4();
  final String id;
  final String title;
  final double mount;
  final DateTime date;
  final Category category;
  String get getFromatedDate {
    return fromatter.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.category, required this.expenses});
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();
  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expenes in expenses) {
      sum += expenes.mount;
    }

    return sum;
  }
}
