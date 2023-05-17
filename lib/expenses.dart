import 'package:flutter/material.dart';

import 'models/expense.dart';

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
        date: DateTime(2022, 12, 05, 08, 25),
        category: Category.career
    ),

    Expense(
        title: "Python Django - The Practical Guide - Udemy",
        amount: 11.99,
        date: DateTime(2023, 02, 07, 08, 25),
        category: Category.career
    ),

    Expense(
        title: "100 Days Of Code - Udemy",
        amount: 11.99, date: DateTime(2023, 02, 07, 08, 25),
        category: Category.career
    )
  ];
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(240, 240, 240, 240),
      body: Column(
        children: const [
          Text("The expense chart"),
          Text("The list of expenses")
        ],
      ),
    );
  }
}