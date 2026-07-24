
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:quiz/configs/configs.dart';
import 'package:quiz/controllers/auth_controller.dart';
import 'package:quiz/controllers/common/drawer_controller.dart';
import 'package:quiz/widgets/widgets.dart';

import '../../controllers/quiz_paper/quiz_paper_controller.dart';
import 'custom_drawer.dart';

class HomeScreen extends GetView<MyDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';
  

  @override
  Widget build(BuildContext context) {
    QuizPaperController quizePprContoller = Get.find();
    return Scaffold(
        body: GetBuilder<MyDrawerController>(
        builder: (_) => ZoomDrawer(
        controller: _.zoomDrawerController,
        borderRadius: 50.0,
        showShadow: true,
        angle: 0.0,
        style: DrawerStyle.defaultStyle,
        menuScreen: const CustomDrawer(),
        menuBackgroundColor: Color.fromARGB(85, 4, 92, 130).withOpacity(0.5),
        slideWidth: MediaQuery.of(context).size.width * 0.9,
        mainScreen: Container(
          decoration: BoxDecoration(gradient: mainGradient(context)),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(kMobileScreenPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform.translate(
                        offset: const Offset(-10, 0),
                        child: CircularButton(
                          onTap: controller.toggleDrawer,
                          child: const Icon(AppIcons.menuleft),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            const Icon(Icons.ac_unit),
                            Builder(
                              builder: (_) {
                                final AuthController _auth = Get.find();
                                final user = _auth.getUser();
                                String _label = '  Hello friend';
                                if (user != null) {
                                  _label = '  Hello ${user.displayName}';
                                }
                                return Text(_label,
                                    style: kHeaderTS.copyWith(
                                        color: kOnSurfaceTextColor));
                              },
                            ),
                          ],
                        ),
                      ),
                      const Text('What chapter you want to do today? Goodluck !!',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w900,
                          )),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ContentArea(
                      addPadding: false,
                      child: Obx(
                        () => LiquidPullToRefresh(
                          height: 150,
                          springAnimationDurationInMilliseconds: 500,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                          onRefresh: () async {
                            quizePprContoller.getAllPapers();
                          },
                          child: ListView.separated(
                            padding: UIParameters.screenPadding,
                            shrinkWrap: true,
                            itemCount: quizePprContoller.allPapers.length,
                            itemBuilder: (BuildContext context, int index) {
                              return QuizPaperCard(
                                model: quizePprContoller.allPapers[index],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 20,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}