import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(150, 025, 220, 025));

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'X-Pensia',
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.background,
          foregroundColor: kColorScheme.onSurface),
      cardTheme: const CardTheme().copyWith(
        color: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
              foregroundColor: kColorScheme.onSecondaryContainer)),
      textTheme: ThemeData().textTheme.copyWith(
            bodyMedium: TextStyle(
              fontWeight: FontWeight.normal,
              color: kColorScheme.secondary,
              fontSize: 18,
            ),
            bodyLarge: TextStyle(
              fontWeight: FontWeight.w600,
              color: kColorScheme.primary,
              fontSize: 18,
            ),
            titleSmall: TextStyle(
              fontWeight: FontWeight.normal,
              color: kColorScheme.primary,
              fontSize: 16,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.w300,
              color: kColorScheme.secondary,
              fontSize: 13,
            ),
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: kColorScheme.primary,
              fontSize: 20,
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.w500,
              color: kColorScheme.primary,
              fontSize: 18,
            ),
          ),
    ),
    home: const ExpenseApp(),
  ));
}
/*const ColorScheme(
            brightness: Brightness.dark,
            primary: Color.fromARGB(140, 025, 220, 050),
            onPrimary: Color.fromARGB(140, 220, 025, 050),
            secondary: Colors.brown,
            onSecondary: Colors.white,
            error: Color.fromARGB(255, 190, 020, 020),
            onError: Colors.white,
            background: Color.fromARGB(240, 250, 250, 250),
            onBackground: Color.fromARGB(255, 063, 108, 069),
            surface: Colors.white,
            onSurface: Color.fromARGB(255, 063, 108, 069))
            */
