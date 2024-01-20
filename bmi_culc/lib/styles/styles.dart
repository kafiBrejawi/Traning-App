import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lighttheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        titleSpacing: 20,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        )),
// ignore: prefer_const_constructors

    textTheme: TextTheme(
        titleMedium: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    )));
