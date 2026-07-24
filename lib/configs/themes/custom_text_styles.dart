import 'package:flutter/material.dart';
import 'package:quiz/configs/configs.dart';

const kHeaderTS = TextStyle(
    fontSize: 20, fontWeight: FontWeight.w700, color: kOnSurfaceTextColor);

const kDetailsTS = TextStyle(fontSize: 16);

TextStyle cardTitleTs(context) => TextStyle(
    color: UIParameters.isDarkMode(context)
        ? Theme.of(context).textTheme.bodyLarge!.color
        : Theme.of(context).primaryColor,
    fontSize: 20,
    fontWeight: FontWeight.bold);

const kQuizeTS = TextStyle(fontSize: 17, fontWeight: FontWeight.w800,);

const kAppBarTS = TextStyle(
    fontWeight: FontWeight.bold, fontSize: 20, color: kOnSurfaceTextColor);

TextStyle countDownTimerTs(context) => TextStyle(
    letterSpacing: 2,
    color: UIParameters.isDarkMode(context)
        ? Theme.of(context).textTheme.bodyLarge!.color
        : Theme.of(context).primaryColor,
    fontSize: 16,
    fontWeight: FontWeight.bold);

const kQuizeNumberCardTs = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w500, color: kOnSurfaceTextColor);