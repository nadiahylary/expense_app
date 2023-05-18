import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({required this.expense, Key? key}) : super(key: key);
  final Expense expense;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title, style: Theme.of(context).textTheme.bodyMedium,),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}', style: Theme.of(context).textTheme.bodyLarge,),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category], color: Theme.of(context).colorScheme.onPrimaryContainer,),
                    const SizedBox(width: 10,),
                    Text(expense.formattedDate, style: Theme.of(context).textTheme.bodySmall,),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
