import 'package:flutter/material.dart';
import 'package:quizapp/quizz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // const HomePage({super.key});
  QuizzBrain quizzBrain = new QuizzBrain();

  List<Widget> score = [];

  void checkAnswer(bool userAnswer, String numberQuestion) {
    bool correctAnswer = quizzBrain.getQuestionAnswer();
    if (quizzBrain.isFinished() == true) {
      Alert(
          context: context,
          type: AlertType.error,
          desc: "esta es la descripcion del quizz",
          buttons: [
            DialogButton(
                child: Text("ok"),
                onPressed: () {
                  quizzBrain.restarQuiz();
                  score.clear();
                  Navigator.pop(context);
                  setState(() {});
                }),
          ]).show();
    }

    if (correctAnswer == userAnswer) {
      score.add(itemScore(numberQuestion, true));
      print("Si es correcto");
    } else {
      score.add(itemScore(numberQuestion, false));
      print("incorrecto");
    }
    quizzBrain.nextQuestion();
    setState(() {});
  }

  Widget itemScore(String numberQuestion, bool isCorrect) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$numberQuestion: ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        Icon(
          isCorrect ? Icons.check : Icons.close,
          color: isCorrect ? Colors.greenAccent : Colors.redAccent,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff282E42),
      appBar: AppBar(
        backgroundColor: Color(0xff282E42),
        title: Text(
          "Quizz App",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  quizzBrain.getQuestionText(),
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {
                    // quizzBrain.nextQuestion();
                    checkAnswer(true, quizzBrain.getAnswerNumber());
                    setState(() {});
                    // Alert(
                    //     context: context,
                    //     type: AlertType.error,
                    //     desc: "esta es la descripcion del quizz",
                    //     buttons: [
                    //       DialogButton(child: Text("ok"), onPressed: () {}),
                    //       DialogButton(child: Text("ok"), onPressed: () {}),
                    //       DialogButton(child: Text("ok"), onPressed: () {}),
                    //       DialogButton(child: Text("ok"), onPressed: () {}),
                    //     ]).show();
                    // showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return AlertDialog(
                    //         title: Text("Alerta"),
                    //         content: Text("Hola Alerta"),
                    //         actions: [
                    //           TextButton(onPressed: () {}, child: Text("ok"))
                    //         ],
                    //       );
                    //     });
                  },
                  color: Colors.green,
                  child: Text("Verdadero"),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    onPressed: () {
                      checkAnswer(false, quizzBrain.getAnswerNumber());
                    },
                    color: Colors.redAccent,
                    child: Text("Falso"),
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: score,
            )
          ],
        ),
      ),
    );
  }
}
