import 'package:flutter/material.dart';
import 'sub_theme_data_mixin.dart';

const Color kPrimayColorDT = Color.fromARGB(255, 77, 163, 225);
const Color kPrimayLightColorDT = Color.fromARGB(255, 16, 161, 201);
const Color appBarIconColorDT = Colors.white;
const Color mainTextColorDT = Colors.white;
const Color iconColorDT = Colors.white;
const Color shadowColorDT = Color.fromARGB(255, 255, 255, 255);
const Color cardColorDT = Color.fromARGB(106, 95, 183, 208);
const Color scaffoldBackgroundColor = Color.fromARGB(255, 121, 175, 225);

class DarkTheme with SubThemeData {
  ThemeData buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        splashColor: kPrimayColorDT.withOpacity(0.1),
        highlightColor: kPrimayColorDT.withOpacity(0.05),
        iconTheme: getIconTheme(),
        textTheme: getTextThemes()
            .apply(bodyColor: mainTextColorDT, displayColor: mainTextColorDT),
        elevatedButtonTheme:
            ElevatedButtonThemeData(style: getElavatedButtonTheme()),
        cardColor: cardColorDT,
        primaryColor: kPrimayColorDT);
  }
}
