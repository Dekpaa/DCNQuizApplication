import 'dart:convert';
import 'package:easy_separator/easy_separator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/configs/configs.dart';
import 'package:quiz/models/quiz_paper_model.dart';
import 'package:quiz/screens/screens.dart';
import 'package:quiz/widgets/widgets.dart';
import '../../controllers/quiz_paper/quiz_paper_controller.dart';

class QuizPaperCard extends GetView<QuizPaperController> {
  const QuizPaperCard({Key? key, required this.model}) : super(key: key);

  final QuizPaperModel model;

  @override
  Widget build(BuildContext context) {
    const double padding = 10.0;
    return Ink(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: Theme.of(context).cardColor,
      ),
      child: InkWell(
        borderRadius: UIParameters.cardBorderRadius,
        onTap: () {
          controller.navigatoQuestions(
            paper: model
          );
        },
        child: Padding(
            padding: const EdgeInsets.all(padding),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ClipRRect(
                    //   borderRadius: UIParameters.cardBorderRadius,
                    //   child: ColoredBox(
                    //       color:
                    //           Theme.of(context).primaryColor.withOpacity(0.1),
                    //       // child: SizedBox(
                    //       //   width: 65,
                    //       //   height: 65,
                    //       //  // child: model.imageUrl == null ||  model.imageUrl!.isEmpty ? null : Image.network(model.imageUrl!),
                    //       // )
                    //       ),
                    // ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title,
                          style: cardTitleTs(context),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Text(model.description,
                          style: kDetailsTS),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: EasySeparatedRow(
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(width: 20);
                            },
                            children: [
                              IconWithText(
                                  icon: Icon(Icons.quiz_outlined,
                                      color: const Color.fromARGB(255, 155, 182, 208)),
                                  text: Text(
                                    '${model.questionsCount} questions',
                                    style: kDetailsTS.copyWith(
                                        color: const Color.fromARGB(255, 155, 184, 213)),
                                  )),
                              IconWithText(
                                  icon: const Icon(Icons.timer_sharp,
                                      color: Color.fromARGB(255, 127, 165, 184)),
                                  text: Text(
                                    model.timeInMinits(),
                                    style: kDetailsTS.copyWith(
                                        color: Color.fromARGB(255, 121, 196, 226)),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ))
                  ],
                ),
                Positioned(
                    bottom: -padding,
                    right: -padding,
                    child: GestureDetector(
                      behavior : HitTestBehavior.translucent,
                      onTap: () {
                        Get.toNamed(LeaderBoardScreen.routeName, arguments:model );
                      },
                      child: Ink(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(kCardBorderrRadius),
                                bottomRight:
                                    Radius.circular(kCardBorderrRadius)),
                            color: Color.fromARGB(255, 128, 180, 223)),
                        child: const Icon(AppIcons.trophyoutline),
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}