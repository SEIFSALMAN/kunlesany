import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData darkTheme = ThemeData(
    // useMaterial3: false,
    primaryColor: Colors.deepOrange,
    fontFamily: "PlaypenSans",
    brightness: Brightness.dark,
    primarySwatch: Colors.deepOrange,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.deepOrange
    ),
    cardColor: Colors.grey[800],

    appBarTheme: const AppBarTheme(
        shadowColor: Colors.white,
        titleSpacing: 20.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light
        ),
        backgroundColor: Colors.black,
        elevation: 5,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold
        )
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        elevation: 20.0,
        backgroundColor: Colors.black
    ),
    scaffoldBackgroundColor: Colors.black,
    dialogBackgroundColor: Colors.grey.shade800,
    hintColor: Colors.white,

    textTheme: const TextTheme(
        bodyLarge: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
            color: Colors.white,
            fontFamily: 'PlaypenSans'

        ),
        bodyMedium: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontFamily: 'PlaypenSans'
        ),
    )
);

ThemeData lightTheme = ThemeData(
    // useMaterial3: false,
    fontFamily: "PlaypenSans",
    primaryColor: Colors.deepOrange,
    brightness: Brightness.light,
    primarySwatch: Colors.red,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.red
    ),
    cardColor: Colors.grey[200],
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        titleSpacing: 20.0,
        color: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark
        ),
        elevation:5,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
           // fontWeight: FontWeight.bold
        )
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black54,
        elevation: 20.0,
        backgroundColor: Colors.white
    ),
    dialogBackgroundColor: Colors.grey.shade300,
    hintColor: Colors.black,
    textTheme:  const TextTheme(
        bodyLarge: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontFamily: 'PlaypenSans'
        ),
        bodyMedium: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w200,
            color: Colors.black,
            fontFamily: 'PlaypenSans'
        ),
    )
);