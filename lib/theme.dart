
import 'dart:ui';

import 'package:flutter/material.dart';

class MyThemeData{
  static const Color primaryLightColor = Color(0xff5D9CEC);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color greenColor = Color(0xff61E757);
  static const Color redColor = Color(0xffEC4B4B);
  static const Color blackColor = Color(0xff363636);
  static const Color backGroundLightColor = Color(0xffDFECDB);
  static const Color primaryDarkColor = Color(0xff141922);
  static const Color backGroundDarkColor = Color(0xff060E1E);
  static const Color greyColor = Colors.grey;

 static ThemeData lightMode = ThemeData(
  primaryColor: primaryLightColor,
  scaffoldBackgroundColor: backGroundLightColor,
   appBarTheme: AppBarTheme(
     backgroundColor: primaryLightColor,
   elevation: 0
   ),
primaryTextTheme: TextTheme(

  headline1: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: whiteColor,
  ),
  headline2: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: primaryLightColor,
  ),
  subtitle1: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: blackColor,
  ),
  subtitle2: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: blackColor,
  ),
  headline4: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: blackColor,
  ),



),
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
     selectedItemColor:primaryLightColor ,
       unselectedItemColor:greyColor,
     backgroundColor: Colors.transparent,
     elevation: 0,
   )

);
  static ThemeData darkMode= ThemeData(
      primaryColor: primaryDarkColor,
      scaffoldBackgroundColor: backGroundDarkColor,
      appBarTheme: AppBarTheme(
          backgroundColor: primaryLightColor,
          elevation: 0
      ),
      primaryTextTheme: TextTheme(

        headline1: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: blackColor,
        ),
        headline2: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: primaryLightColor,
        ),
        subtitle1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: blackColor,
        ),
        subtitle2: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: blackColor,
        ),
        headline4: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: blackColor,
        ),



      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor:primaryDarkColor ,
        unselectedItemColor:whiteColor,
        backgroundColor: Colors.transparent,
        elevation: 0,
      )

  );

}