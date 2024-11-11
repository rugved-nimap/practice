import 'package:flutter/material.dart';

class MyTheme {

  ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      useMaterial3: true,
      primaryColor: Colors.grey.shade900,
      textTheme: TextTheme(
        bodySmall: TextStyle(color: Colors.grey.shade800, fontSize: 15),
        bodyMedium: const TextStyle(color: Colors.black, fontSize: 17),
      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.grey.shade900),
        backgroundColor: Colors.indigo.shade200,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 22),
      ),
      iconTheme: IconThemeData(color: Colors.grey.shade900),
    );
  }

  ThemeData darkTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      useMaterial3: true,
      primaryColor: Colors.grey.shade200,
      textTheme: const TextTheme(
        bodySmall: TextStyle(color: Colors.white70, fontSize: 15),
        bodyMedium: TextStyle(color: Colors.white, fontSize: 17),
      ),
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.indigo.shade400,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 22),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}
