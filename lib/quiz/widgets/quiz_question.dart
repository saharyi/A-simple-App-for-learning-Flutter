import 'package:flutter/material.dart';
import './quizanswerbutton.dart';
import '../Models/quiz.dart';

class QuizQuestion extends StatefulWidget {
  final int quizInex;
  bool questionAnswered = false;
  QuizQuestion({@required this.quizInex}) {
    questionAnswered = false;
  }

  @override
  _QuizQuestionState createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  int selectedAnswer;
  bool questionAnswered = false;

  void _answerToQuestion(int answerIndex) {
    if (widget.questionAnswered) return;
    setState(() {
      widget.questionAnswered = true;
      selectedAnswer = answerIndex;
    });
  }

  AnswerButtonState _getButtonState(int answerIndex) {
    if (!widget.questionAnswered)
      return AnswerButtonState.none;
    else if (answerIndex == quizes[widget.quizInex].aswerindex)
      return AnswerButtonState.correct;
    else if (answerIndex == selectedAnswer)
      return AnswerButtonState.wrong;
    else
      return AnswerButtonState.none;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Container(
                //width: 200,
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange[900]),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange[100],
                ),
                child: Text(
                  quizes[widget.quizInex].question,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              )),
        ),
        QuizAnswerButton(
          answer: quizes[widget.quizInex].answer1,
          answerEvent: () {
            _answerToQuestion(1);
          },
          state: _getButtonState(1),
        ),
        QuizAnswerButton(
          answer: quizes[widget.quizInex].answer2,
          answerEvent: () {
            _answerToQuestion(2);
          },
          state: _getButtonState(2),
        ),
        QuizAnswerButton(
          answer: quizes[widget.quizInex].answer3,
          answerEvent: () {
            _answerToQuestion(3);
          },
          state: _getButtonState(3),
        ),
        QuizAnswerButton(
          answer: quizes[widget.quizInex].answer4,
          answerEvent: () {
            _answerToQuestion(4);
          }, //shenasaii in ke kodom dokmeh feshar dade shode
          state: _getButtonState(4),
        ),
      ],
    );
  }
}
