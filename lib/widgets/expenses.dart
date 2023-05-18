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
    /*Expense(
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
        category: Category.business)*/
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _expensesList.add(expense);
    });
  }

  void _deleteExpense(Expense expense) {
    setState(() {
      _expensesList.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text("Expense Deleted"),
      action: SnackBarAction(
          label: "Undo",
          onPressed: (){
            setState(() {
              _expensesList.insert(_expensesList.indexOf(expense), expense);
            });
          }),
    ));
  }

  void _openAddExpenseWidget() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(_addExpense),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _expensesList.sort((a, b) => b.date.compareTo(a.date));
    Widget mainContent = Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const SizedBox(
              width: 10
          ),
          Container(
            height: 350,
            margin: const EdgeInsets.only(top: 30),
            child: Image.asset(
              "assets/images/empty-shopping-cart.png",
              fit: BoxFit.cover,
            ),
          ),
          /*const SizedBox(
            height: 20,
          ),*/
          const Text(
            "You have no expenses yet.",
          ),
        ],
      ),
    );

    if (_expensesList.isNotEmpty) {
      mainContent = ExpensesList(
        expensesList: _expensesList,
        deleteExpenseHandler: _deleteExpense,
      );
    }
    return Scaffold(
      //backgroundColor: const Color.fromARGB(240, 240, 240, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(240, 240, 240, 240),
        actions: [
          IconButton(
              onPressed: _openAddExpenseWidget,
              icon: const Icon(
                Icons.add_circle_outlined,
                size: 35,
              ))
        ],
      ),
      body: Column(
        children: [
          const Text("The Expense Chart"),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
