import 'dart:ffi';

import 'package:quizapp/models/question_models.dart';

class QuizzBrain {
  List<QuestionModel> questionList = [
    QuestionModel(question: "El Hombre llego a la luna?", answer: true),
    QuestionModel(question: "Has almordo hoy?", answer: false),
    QuestionModel(question: "Sientes Frio?", answer: true),
    QuestionModel(question: "Saliste ayer?", answer: true),
    QuestionModel(question: "Has desayunado?", answer: true),
  ];

  int questionIndex = 0;

  String getQuestionText() {
    return questionList[questionIndex].question;
  }

  bool getQuestionAnswer() {
    return questionList[questionIndex].answer;
  }

  String getAnswerNumber() {
    return (questionIndex + 1).toString();
  }

  void nextQuestion() {
    if (questionIndex < questionList.length - 1) {
      questionIndex++;
    }
  }

  bool isFinished() {
    if (questionIndex > questionList.length - 2) {
      return true;
    } else {
      return false;
    }

  }
  void restarQuiz(){
    questionIndex = 0;
  }
}
