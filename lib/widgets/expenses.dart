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
        category: Category.business)
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _expensesList.add(expense);
    });
  }

  void _deleteExpense(Expense expense) {
    final expenseIndex = _expensesList.indexOf(expense); /**getting the index of
    the expense to be deleted here makes a whole difference. Because once the
    delete action is made, the index doesn't exist anymore. So trying to undo
    the delete is like trying to access a negative index, ie an index that doesn't exist,
    so a click on the undo button throws an exception.*/
    setState(() {
      _expensesList.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text("Expense Deleted."),
      action: SnackBarAction(
          label: "Undo",
          onPressed: (){
            setState(() {
              _expensesList.insert(expenseIndex, expense);
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
      child: Container(
              height: 400,
              margin: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/empty-shopping-cart.png",
                    //fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "You have no expenses yet.",
                  ),
                ],
              ),
            ),
        );

    if (_expensesList.isNotEmpty) {
      mainContent = ExpensesList(
        expensesList: _expensesList,
        deleteExpenseHandler: _deleteExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
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
