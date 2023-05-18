import 'package:flutter/material.dart';

import '../../models/expense.dart';
import 'expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {required this.expensesList,
      required this.deleteExpenseHandler,
      Key? key})
      : super(key: key);
  final List<Expense> expensesList;
  final void Function(Expense expense) deleteExpenseHandler;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (context, index) => Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.onErrorContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          onDismissed: (direction) {
            deleteExpenseHandler(expensesList[index]);
          },
          key: ValueKey(expensesList[index]),
          child: ExpenseItem(expense: expensesList[index])),
    );
  }
}
