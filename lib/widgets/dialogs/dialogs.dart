import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();

  factory Dialogs() {
    return _singleton;
  }

  Dialogs._internal();

  static Widget quizStartDialog({required VoidCallback onTap}) {
    return AlertDialog(
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          Text("Please login before start the quiz", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          //Text(""),
        ],
      ),
      actions: <Widget>[
        TextButton(onPressed: onTap, child: const Text('Orite'))
      ],
    );
  }

  static Future<bool> quizEndDialog() async{
     return (await showDialog(
      context: Get.overlayContext!,
      builder: (context) =>  AlertDialog(
        title:  const Text('Are you sure?'),
        content:  const Text('Do you want to exit the quiz without completing it ?'),
        actions: <Widget>[
          TextButton(
            onPressed: () =>  Get.back(result: false),
            child:  const Text('No'),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child:  const Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }

   static Widget Timerend({required VoidCallback onTap}) {
    return AlertDialog(
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          Text("TIME UP!!!", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
        ],
      ),
      actions: <Widget>[
        TextButton(onPressed: onTap, child: const Text('Try Again'))
      ],
    );
  }
}
