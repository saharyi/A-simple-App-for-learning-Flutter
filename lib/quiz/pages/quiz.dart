import 'package:flutter/material.dart';
import 'package:forthappv3/quiz/pages/finish.dart';
import '../widgets/nextquestionButton.dart';
import '../widgets/quiz_question.dart';

class Quizpage extends StatefulWidget {
  static const Pageroute = "/quizMain";

  @override
  _QuizpageState createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  int currentquestion = 0;

  @override
  Widget build(BuildContext context) {
    final String username = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "کوییزاپ",
            style: TextStyle(
                fontWeight: FontWeight.w200, fontStyle: FontStyle.italic),
          ),
        ),
        backgroundColor: Colors.red[400],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.pink[200],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 700,
                  height: 60,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    border: Border.all(color: Colors.green[300]),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "سلام $username خوش اومدی",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                QuizQuestion(quizInex: currentquestion),
                SizedBox(
                  height: 5,
                ),
                NextQuizButton(
                  onNextClick: () {
                    setState(() {
                      if (currentquestion == 3) {
                        Navigator.of(context).pushNamed(Finish.PageRoute);
                      } else
                        currentquestion++;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
