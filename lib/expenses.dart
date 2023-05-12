import 'package:flutter/material.dart';

class ExpenseApp extends StatefulWidget {
  const ExpenseApp({super.key});

  @override
  State<ExpenseApp> createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseApp> {
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