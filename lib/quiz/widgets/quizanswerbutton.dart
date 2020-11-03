import 'package:flutter/material.dart';

class QuizAnswerButton extends StatelessWidget {
  final String answer;
  final Function answerEvent;
  final AnswerButtonState state;

  QuizAnswerButton({
    @required this.answer,
    this.answerEvent,
    this.state = AnswerButtonState.none,
  });

  Color _getButtonColor() {
    switch (state) {
      case AnswerButtonState.none:
        return Colors.grey[300];

      case AnswerButtonState.correct:
        return Colors.green;

      case AnswerButtonState.wrong:
        return Colors.red;

      default:
        return Colors.grey[300];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: RaisedButton(
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        //color: Colors.lime,
        child: Text(
          answer,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        onPressed: answerEvent,

        color: _getButtonColor(),
      ),
    );
  }
}

enum AnswerButtonState {
  none,
  correct,
  wrong,
}
