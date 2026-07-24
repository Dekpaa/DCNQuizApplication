import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz/configs/configs.dart';

class InterfaceScreen extends StatelessWidget {
  const InterfaceScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient(context)),
        child: Image.asset('assets/images/logoapps.png'),
      ),
    );
  }
}