import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:quiz/controllers/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void signIn() {
    Get.find<AuthController>().navigateToLogin();
  }

  void sv() {
     final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'syarizul@uthm.edu.my',
    );
    _launch(emailLaunchUri.toString());
  }

  void student_one() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'syifaaadilla16@gmail.com',
    );
    _launch(emailLaunchUri.toString());
  }

  void student_two() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'izzatiyaziz03@gmail.com',
    );
    _launch(emailLaunchUri.toString());
  }

  void student_three() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'amylianabilah2003@gmail.com',
    );
    _launch(emailLaunchUri.toString());
  }
  
  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  Future<void> _launch(String url) async {
    // ignore: deprecated_member_use
    if (!await launch(
      url,
    )) {
      throw 'Could not launch $url';
    }
  }
}