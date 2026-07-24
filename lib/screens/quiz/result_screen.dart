import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz/configs/configs.dart';
import 'package:quiz/controllers/quiz_paper/quiz_controller.dart';
import 'package:quiz/controllers/quiz_paper/quiz_result_extention_qc.dart';
import 'package:quiz/screens/screens.dart';
import 'package:quiz/widgets/widgets.dart';

import 'answer_check_screen.dart';

class Resultcreen extends GetView<QuizController> {
  const Resultcreen({Key? key}) : super(key: key);

  static const String routeName = '/resultscreen';

  @override
  Widget build(BuildContext context) {
    final Color _textColor = UIParameters.isDarkMode(context)
        ? const Color.fromARGB(255, 236, 192, 192)
        : Theme.of(context).primaryColor;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: BackgroundDecoration(
          child: Column(
            children: [
              CustomAppBar(
                leading: const SizedBox(height: kToolbarHeight,),
                title: controller.correctAnsweredQuestions,
              ),
              Expanded(
                child: ContentArea(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logocongrats.png'),
                    Text(
                      'You have got ${controller.points} Points',
                      style: TextStyle(color: _textColor),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Tap below question numbers to view correct answers',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: GridView.builder(
                            itemCount: controller.allQuestions.length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        UIParameters.getWidth(context) ~/ 75,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 12),
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (_, index) {
                              final _question = controller.allQuestions[index];

                              AnswerStatus _status = AnswerStatus.notanswered;

                              final _selectedAnswer = _question.selectedAnswer;
                              final _correctAnswer = _question.correctAnswer;

                              if (_selectedAnswer == _correctAnswer) {
                                _status = AnswerStatus.correct;
                              } else if (_question.selectedAnswer == null) {
                                _status = AnswerStatus.wrong;
                              } else {
                                _status = AnswerStatus.wrong;
                              }

                              return QuizNumberCard(
                                index: index + 1,
                                status: _status,
                                onTap: () {
                                  controller.jumpToQuestion(index,
                                      isGoBack: false);
                                  Get.toNamed(AnswersCheckScreen.routeName);
                                },
                              );
                            }))
                  ],
                )),
              ),
              ColoredBox(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Padding(
                    padding: UIParameters.screenPadding,
                    child: Row(
                      children: [
                        Expanded(
                            child: MainButton(
                              color: Colors.blueGrey,
                          onTap: () {
                           controller.tryAgain();
                          },
                          title: 'Try Again',
                        )),
                        const SizedBox(width: 5,),
                        Expanded(
                            child: MainButton(
                          onTap: () {
                            controller.saveQuizResults();
                            //controller.navigateToHome();
                          },
                          title: 'Home',
                        ))
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}