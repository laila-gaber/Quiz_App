import 'package:flutter/material.dart';

import '../../controller/quiz_controller.dart';
import 'package:get/get.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({super.key});

  QuizController quizController = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        backgroundColor: Colors.black26,
        centerTitle: true,
        title: Text(
          "Quzii App",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30
          ),

        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<QuizController>(
          assignId: true,
            builder: (quizController) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    quizController.quiz[quizController.qIndex].question,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.purple[900],
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: ListView.builder(
                    itemCount: quizController.quiz[quizController.qIndex]
                        .options.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                              minWidth: 300,
                              color: quizController.ansColor(index),
                              elevation: 20,
                              height: 40,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Text(
                                quizController.quiz[quizController.qIndex]
                                    .options[index],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25
                                ),
                              ),
                              onPressed: () {
                                quizController.nextQuestion(index);
                              }
                          ),
                        ),
                      );
                    }
                ),
              ),
              Expanded(
                flex: 1,
                child: Icon(
                quizController.wrongAns?Icons.close:null,
                  color: Colors.red,
                  size: 80,
              ),),
              Expanded(
                flex: 1,
                child: SizedBox()),
            ],
          );
        }),
      ),
    );
  }
}
