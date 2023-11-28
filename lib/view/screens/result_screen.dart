import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/quiz_controller.dart';
import 'package:quiz_app/view/screens/question_screen.dart';

class ResultScreen extends StatelessWidget {
  int result;

  ResultScreen(this.result);
  QuizController quizController =Get.find();
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Text(
              "Result: ${(result / quizController.quiz.length).toInt() * 10} %",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: Colors.purple[900]
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Divider(thickness: 1, color: Colors.grey), // Divider for visual separation
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            child: quizController.resultPhrase((result / quizController.quiz.length).toInt() * 10),
          ),
          Divider(thickness: 1, color: Colors.grey), // Divider for visual separation
          SizedBox(
            height: 20,
            width: double.infinity,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white60,
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                quizController.resetQuiz();
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  "Reset The Quiz",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20), // Additional space at the bottom
        ],
      ),

    );
  }
}
