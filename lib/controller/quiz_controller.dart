import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/view/screens/result_screen.dart';

import '../model/questions_model.dart';
import '../view/screens/question_screen.dart';

class QuizController extends GetxController
{
  List<QuestionModel> quiz=questions;
  int qIndex=0;
  int result=0;
  bool correctAns=false;
  bool wrongAns=false;

  bool isCorrectAnswer(int index)
  {
    return quiz[qIndex].options[index]==quiz[qIndex].correctAnswer;
  }
  Color ansColor(int index) {
    if (correctAns == true && isCorrectAnswer(index)) {
      return Colors.teal; // Correctly chosen answer
    } else if (correctAns == false && isCorrectAnswer(index) && wrongAns == true) {
      wrongAns=true;
      return Colors.teal; // Wrongly chosen answer
    } else {
      return Colors.white60; // Default color for other answers
    }
  }

  void nextQuestion(int index)async {
     //isCorrectAnswer(index)? correct():go();
    if(isCorrectAnswer(index))
      {
        await correct();
      }
    else
      {
        await go();
      }
    if (qIndex != quiz.length-1) {
      qIndex++;
      update();
    } else {
      Get.off(() => ResultScreen(result));
    }

    update();
  }
  Future<void> correct ()
  async {
    correctAns=true;
    result+=10;
    update();
    await Future.delayed(const Duration(milliseconds: 200));
    correctAns=false;
    update();

  }
  void resetQuiz()
  {
    qIndex=0;
    result=0;
    update();
    Get.off(()=>QuestionScreen());
  }
  Future<void> go ()
  async {
    wrongAns=true;
    update();
    await Future.delayed(const Duration(milliseconds: 200));
    wrongAns=false;
    update();

  }

  Widget resultPhrase(int result)
  {
    String phrase;
    Color phraseColor;
    if(result<50)
      {
        phrase="Fail 😞";
        phraseColor=Colors.red;
      }
    else if(result>=50 && result<100)
      {
        phrase="You Could Do Better! 😉";
        phraseColor=Colors.teal;
      }
    else
      {
        phrase="Congratulations 🎊🎉!";
        phraseColor=Colors.green;
      }

    return Expanded(
      flex: 1,
      child: Text(
        phrase,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          color: phraseColor,
          fontSize: 30
        ),
        textAlign: TextAlign.center,

      ),
    );
  }


}

List<QuestionModel> questions = [
  QuestionModel(
    question: "StatelessWidget represents?",
    options: ["With no mutable state", "Immutable widget", "Static UI component", "Constant widget"],
    correctAnswer: "With no mutable state",
  ),
  QuestionModel(
    question: "initState() purpose in StatefulWidget?",
    options: ["Initialization logic", "Build widget tree", "Set initial state", "Widget creation"],
    correctAnswer: "Initialization logic",
  ),
  QuestionModel(
    question: "Cubit's core principle in Flutter?",
    options: ["Unidirectional data flow", "State management", "Bidirectional flow", "Reactive state"],
    correctAnswer: "Unidirectional data flow",
  ),
  QuestionModel(
    question: "Role of `emit()` in Cubit?",
    options: ["Emit new states", "Handle UI events", "Update UI state", "Handle user input"],
    correctAnswer: "Emit new states",
  ),
  QuestionModel(
    question: "Keys in Flutter used to?",
    options: ["Identify unique widgets", "Track widget state", "Set widget properties", "Navigate between screens"],
    correctAnswer: "Identify unique widgets",
  ),
];