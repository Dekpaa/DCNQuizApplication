import 'package:flutter/material.dart';
import 'package:quiz/configs/configs.dart';

const kOnSurfaceTextColor = Color.fromARGB(255, 255, 255, 255);
const kCorrectAnswerColor = Color.fromARGB(255, 0, 188, 100);
const kWrongAnswerColor = Color.fromARGB(255, 240, 42, 42);
const kNotAnswerColor = Color.fromARGB(255, 157, 110, 130);

// main gradient pattern for light theme
const mainGradientLT = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      kPrimayLightColorLT,
      kPrimayColorLT,
    ]);

// main gradient pattern for Dark theme
const mainGradientDT = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      kPrimayLightColorDT,
      kPrimayColorDT,
    ]);

LinearGradient mainGradient(BuildContext context) =>
    UIParameters.isDarkMode(context) ? mainGradientDT : mainGradientLT;


Color customScaffoldColor(BuildContext context) =>
    UIParameters.isDarkMode(context)
        ? const Color.fromARGB(255, 14, 20, 44)
        : const Color.fromARGB(255, 240, 237, 255);

Color answerBorderColor(BuildContext context) =>
    UIParameters.isDarkMode(context)
        ? const Color.fromARGB(255, 20, 46, 158)
        : const Color.fromARGB(255, 221, 221, 221);

Color answerSelectedColor(BuildContext context) =>  Theme.of(context).primaryColor;