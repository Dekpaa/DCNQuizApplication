import 'package:get/get.dart';
import 'package:quiz/controllers/common/drawer_controller.dart';
import 'package:quiz/controllers/leader_board/leader_board_controller.dart';
import 'package:quiz/controllers/profile/profile_controller.dart';
import 'package:quiz/controllers/quiz_paper/quiz_controller.dart';
import 'package:quiz/screens/onboarding/app_introduction_screen.dart';
import 'package:quiz/screens/quiz/quiz_overview_screen..dart';
import 'package:quiz/screens/screens.dart';

import '../controllers/quiz_paper/quiz_paper_controller.dart';

class AppRoutes {
  static List<GetPage> pages() => [
        GetPage(
          page: () => const InterfaceScreen(),
          name: InterfaceScreen.routeName,
        ),
        GetPage(
          page: () => const AppIntroductionScreen(),
          name: AppIntroductionScreen.routeName,
        ),
        GetPage(
            page: () => const HomeScreen(),
            name: HomeScreen.routeName,
            binding: BindingsBuilder(() {
              Get.put(QuizPaperController());
              Get.put(MyDrawerController());
            })),
        GetPage(page: () => const LoginScreen(), name: LoginScreen.routeName),
        GetPage(
            page: () => const ProfileScreen(),
            name: ProfileScreen.routeName,
            binding: BindingsBuilder(() {
              Get.put(QuizPaperController());
              Get.put(ProfileController());
            })),
        GetPage(
            page: () => LeaderBoardScreen(),
            name: LeaderBoardScreen.routeName,
            binding: BindingsBuilder(() {
              Get.put(LeaderBoardController());
            })),
        GetPage(
            page: () => const QuizeScreen(),
            name: QuizeScreen.routeName,
            binding: BindingsBuilder(() {
              Get.put<QuizController>( QuizController());
            })),
        GetPage(
            page: () => const AnswersCheckScreen(),
            name: AnswersCheckScreen.routeName),
        GetPage(
            page: () => const QuizOverviewScreen(),
            name: QuizOverviewScreen.routeName),
        GetPage(page: () => const Resultcreen(), name: Resultcreen.routeName),
      ];
}