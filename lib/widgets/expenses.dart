import 'package:expense_app/widgets/expenses_list_widgets/expenses_list.dart';
import 'package:expense_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

class ExpenseApp extends StatefulWidget {
  const ExpenseApp({super.key});

  @override
  State<ExpenseApp> createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseApp> {
  final List<Expense> _expensesList = [
    Expense(
        title: "Flutter Course - Udemy",
        amount: 11.99,
        date: DateTime(2022, 10, 12, 08, 25),
        category: Category.career),
    Expense(
      title: "Python Django - The Practical Guide - Udemy",
      amount: 11.99,
      date: DateTime(2023, 02, 07, 08, 25),
      category: Category.career,
    ),
    Expense(
        title: "100 Days Of Code - Udemy",
        amount: 11.99,
        date: DateTime(2023, 02, 07, 08, 25),
        category: Category.career)
  ];

  void _addExpense(String title, double amount, DateTime selectedDate, Category category) {
    final Expense transaction = Expense(
        title: title,
        amount: amount,
        date: selectedDate,
        category: category
    );
    setState(() {
      _expensesList.add(transaction);
    });
  }

  void _deleteExpense(int index) {
    setState(() {
      _expensesList.removeAt(index);
    });
  }

  void _openAddExpenseWidget() {
      showModalBottomSheet(context: context, builder: (ctx)
          => NewExpense(_addExpense),
      );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromARGB(240, 240, 240, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(240, 240, 240, 240),
        actions: [
          IconButton(
              onPressed: _openAddExpenseWidget,
              icon: const Icon(Icons.add_circle_outlined, size: 35,))
        ],
      ),
      body: Column(
        children: [
          const Text("The Expense Chart"),
          Expanded(
              child: ExpensesList(
                expensesList: _expensesList,
              )
          ),
        ],
      ),
    );
  }
}
