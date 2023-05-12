import 'package:flutter/material.dart';

import 'expenses.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'X-Pensia',
        theme: ThemeData(

        ),

        home: const ExpenseApp(),
      )
    );
}



