import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(150, 020, 220, 025));

var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(150, 025, 150, 025));

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'X-Pensia',
    /**
     * **NOTE**: When using these theme definitions in my widgets, etc
     * I can still edit some features of them that I don't want or
     * want to change for that particular widget(object):
     * eg Text("Some text", style: GoogleFonts.ubuntu(
        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        fontSize: 24,
        //etc...
        ) //copyWith
        ) //textStyle
        ) //Text,
     */
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
          //backgroundColor: kDarkColorScheme.primaryContainer,
          //foregroundColor: kDarkColorScheme.onPrimaryContainer,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: kDarkColorScheme.tertiary,
            fontSize: 30,
          )),
      cardTheme: const CardTheme().copyWith(
        color: kDarkColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
              foregroundColor: kDarkColorScheme.onPrimaryContainer)),
      textTheme: ThemeData().textTheme.copyWith(
            bodyMedium: TextStyle(
              fontWeight: FontWeight.normal,
              color: kDarkColorScheme.tertiary,
              fontSize: 18,
            ),
            bodyLarge: TextStyle(
              fontWeight: FontWeight.w600,
              color: kDarkColorScheme.primary,
              fontSize: 18,
            ),
            titleSmall: TextStyle(
              fontWeight: FontWeight.normal,
              color: kDarkColorScheme.primary,
              fontSize: 16,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.w300,
              color: kDarkColorScheme.secondary,
              fontSize: 13,
            ),
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: kDarkColorScheme.error.withOpacity(0.8),
              fontSize: 20,
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.w500,
              color: kDarkColorScheme.primary,
              fontSize: 18,
            ),
          ),
    ),
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
          /*backgroundColor: kColorScheme.background,
          foregroundColor: kColorScheme.onSurface,*/
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: kColorScheme.tertiary,
            fontSize: 35,
          )
      ),
      cardTheme: const CardTheme().copyWith(
        color: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
              foregroundColor: kColorScheme.onPrimaryContainer)),
      textTheme: ThemeData().textTheme.copyWith(
            bodyMedium: TextStyle(
              fontWeight: FontWeight.normal,
              color: kColorScheme.tertiary,
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
              color: kColorScheme.error.withOpacity(0.8),
              fontSize: 20,
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.w500,
              color: kColorScheme.primary,
              fontSize: 18,
            ),
          ),
    ),
    themeMode: ThemeMode.system,
    //this is the default
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
