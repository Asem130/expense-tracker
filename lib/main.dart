import 'package:expensetracker/widget/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var kSchemeColor = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(
  255,
  96,
  59,
  181,
));
var kDarkSchemeColor = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(
    255,
    5,
    99,
    125,
  ),
);
void main() {
  /* WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    */

  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkSchemeColor,
      cardTheme: const CardTheme().copyWith(
        color: kDarkSchemeColor.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kDarkSchemeColor.primaryContainer,
          foregroundColor: kDarkSchemeColor.onPrimaryContainer,
        ),
      ),
    ),
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kSchemeColor,
      appBarTheme: const AppBarTheme().copyWith(
        centerTitle: true,
        backgroundColor: kSchemeColor.onPrimaryContainer,
        foregroundColor: kSchemeColor.primaryContainer,
      ),
      cardTheme: const CardTheme().copyWith(
        color: kSchemeColor.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kSchemeColor.primaryContainer)),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
                fontSize: 16,
                color: kSchemeColor.onSecondaryContainer,
                fontWeight: FontWeight.bold),
          ),
    ),
    home: const Expenses(),
    debugShowCheckedModeBanner: false,
  ));
}
