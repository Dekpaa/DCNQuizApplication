import 'package:easy_separator/easy_separator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/configs/themes/app_colors.dart';
import 'package:quiz/screens/home/home_screen.dart';
import 'package:quiz/widgets/common/circle_button.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);
  
  static const String routeName = '/introduction';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient(context)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.14),
          child: EasySeparatedColumn(
            separatorBuilder: (context, index) => const SizedBox(
              height:1,
            ),
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image.asset('assets/images/test2.png',),
              Image.asset('assets/images/intropage.png'),
              CircularButton(
                  onTap: () => Get.offAndToNamed(HomeScreen.routeName),
                  child: Image.asset('assets/images/start.png',alignment: Alignment.center)), 
            ],
          ),
        ),
      ),
    );
  }
}