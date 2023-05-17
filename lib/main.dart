import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/expenses.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'X-Pensia',
    theme: ThemeData(
      useMaterial3: true,
      //primarySwatch: Colors.brown,
    ),
    home: const ExpenseApp(),
  ));
}
