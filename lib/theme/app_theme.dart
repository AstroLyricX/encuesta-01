


import 'package:flutter/material.dart';

class AppTheme {

  static final Color primary = Colors.green.shade500;
  static const Color secondary = Colors.green;
  static const Color tertiary = Colors.black26;

  static final ThemeData lightTheme = ThemeData.light().copyWith(

        // Color primario
        primaryColor: secondary,

        // AppBar Theme 
        appBarTheme: AppBarTheme(
          color: primary,
          elevation: 0
        ),

        // textButton Theme 
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom( foregroundColor: secondary)
        ),

        // FloatingActionButton Theme
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: secondary,
          elevation: 5
        ),

        // ElevatedButton Theme 
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: secondary,
            shape: const StadiumBorder(),
            elevation: 0,
          )
          ),


          // InputDecoration Theme 
          inputDecorationTheme: const InputDecorationTheme(
            floatingLabelStyle: TextStyle(color: secondary),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: tertiary),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),

            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: secondary),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),

          ),




      );
}