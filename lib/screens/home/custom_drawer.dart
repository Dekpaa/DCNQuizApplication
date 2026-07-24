import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/configs/configs.dart';
import 'package:quiz/controllers/common/drawer_controller.dart';
import 'package:quiz/screens/auth_and_profile/profile_screen.dart';

class CustomDrawer extends GetView<MyDrawerController> {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(gradient: mainGradient(context)),
      padding: UIParameters.screenPadding,
      child: Theme(
        data: ThemeData(
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    foregroundColor: kOnSurfaceTextColor))),
        child: SafeArea(
            child: Stack(
          children: [
            Positioned(
                top: 0,
                right: 0,
                child: BackButton(
                  color: kOnSurfaceTextColor,
                  onPressed: () {
                    controller.toggleDrawer();
                  },
                )),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => controller.user.value == null
                      ? TextButton.icon(
                          icon: const Icon(Icons.login),
                          style: TextButton.styleFrom(
                              foregroundColor: Color.fromARGB(255, 6, 4, 4),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              elevation: 0,
                              backgroundColor: Colors.white.withOpacity(0.2)),
                          onPressed: () {
                            controller.signIn();
                          },
                          label: const Text("Sign in"))
                      : GestureDetector(
                          onTap: () {
                            Get.toNamed(ProfileScreen.routeName);
                          },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 12, bottom: 10),
                              child: CircleAvatar(
                                foregroundImage:
                                    controller.user.value!.photoURL == null
                                        ? null
                                        : NetworkImage(
                                            controller.user.value!.photoURL!),
                                backgroundColor: Colors.white,
                                radius: 40,
                              ),
                            ),
                          ),
                        )),
                  Obx(
                    () => controller.user.value == null
                        ? const SizedBox()
                        : Text(controller.user.value!.displayName ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                                color: kOnSurfaceTextColor)),
                  ),
                  const Spacer(flex: 1),
                  const Text('Credit : ',
                          style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 19,
                                color: kOnSurfaceTextColor,
                                )),
                  _DrawerButton(
                    icon: Icons.animation_outlined,
                    label: ' Nur Syifaa Adilla Binti Mohd Zaki',
                    onPressed: () => controller.student_one(),
                  ),
                  _DrawerButton(
                      icon: Icons.animation_outlined,
                      label: 'Nur Izzati Binti Mohd Yaziz',
                      onPressed:() => controller.student_two()),
                  _DrawerButton(
                      icon: Icons.animation_outlined,
                      label: 'Amylia Nabilah Binti Azlam',
                      onPressed: () => controller.student_three()),
                   const Spacer(flex: 2),
                   _DrawerButton(
                      onPressed: () => controller.sv(),
                      icon: Icons.person_4_rounded,
                      label: 'Dr. Syarizul Amri Bin Mohd Dzulkifli'),const Spacer(flex: 4),
                  _DrawerButton(
                    icon: AppIcons.logout,
                    label: 'Sign out',
                    onPressed: () {
                      controller.signOut();
                    },
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton({
    Key? key,
    required this.icon,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 20,
        ),
        label: Align(alignment: Alignment.centerLeft, child: Text(label)));
  }
}
