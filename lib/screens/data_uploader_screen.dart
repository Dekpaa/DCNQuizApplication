import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/controllers/quiz_paper/papers_data_uploader.dart';
import 'package:quiz/firebase/firebase_configs.dart';


class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({ Key? key }) : super(key: key);
  PapersDataUploader controller = Get.put(PapersDataUploader());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  Obx(() => Text(controller.loadingStatus.value == LoadingStatus.completed ?  "DCN Quizzes" : "Loading...."))
      ),
    );
  }
}