import 'package:flutter/material.dart';

class MyTheme {
  static const Color Primarycolor = Color(0xFFFF7518);
  static const Color Secondrycolor = Color(0xFF212121);
  static const Color DarkScaffoldBackground = Colors.black;
  static const Color iconcolor = Colors.black;

  static final LightTheme = ThemeData(
      primaryColor: Primarycolor,
      hintColor: Secondrycolor,
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(18),
            topLeft: Radius.circular(18),
          ))),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4F5A69)),
        headlineMedium: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(fontSize: 14, color: Colors.black),
        titleSmall: TextStyle(fontSize: 14, color: Colors.white),
        titleMedium: TextStyle(
          color: Color(0xFF4F5A69),
          fontSize: 23,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
            color: Color(0xFF4F5A69),
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
        bodyMedium: TextStyle(fontSize: 18,color: Colors.black),
        bodyLarge: TextStyle(
          color: Color(0xFF212121),
          fontSize: 23,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(fontSize: 16, color:Color(0xFF212121).withOpacity(0.7))
      ));

  static final DarkTheme = ThemeData(
      primaryColor: Primarycolor,
      hintColor: Secondrycolor,
      scaffoldBackgroundColor: DarkScaffoldBackground,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedIconTheme: IconThemeData(color: Primarycolor, size: 36),
        unselectedIconTheme: IconThemeData(color: Secondrycolor, size: 36),
      ),
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Secondrycolor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(18),
            topLeft: Radius.circular(18),
          ))),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        headlineMedium: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(fontSize: 14, color: Colors.white),
        titleSmall: TextStyle(fontSize: 14, color: Colors.white),
        titleMedium: TextStyle(
          color: Colors.white,
          fontSize: 23,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
        bodyMedium: TextStyle(fontSize: 18,color: Colors.white),
        bodyLarge: TextStyle(
          color: Colors.white,
          fontSize: 23,
          fontWeight: FontWeight.w500,
        ),
          bodySmall: TextStyle(fontSize: 16, color:Colors.white.withOpacity(0.7))
      ));
}
