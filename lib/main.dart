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
        //foregroundColor: kColorScheme.primary
      )),
      textTheme: ThemeData().textTheme.copyWith(
            bodyMedium: GoogleFonts.ubuntu(
              textStyle: TextStyle(
                fontWeight: FontWeight.normal,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
            bodyLarge: GoogleFonts.changa(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 15,
              ),
            ),
            bodySmall: GoogleFonts.changa(
              textStyle: TextStyle(
                fontWeight: FontWeight.w300,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 12,
              ),
            ),
            titleLarge: GoogleFonts.ubuntu(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 15,
              ),
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
