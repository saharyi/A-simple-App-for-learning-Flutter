import 'package:flutter/material.dart';

class NextQuizButton extends StatelessWidget {
  final Function onNextClick;
  static const Pageroute = "/Nextquestion";

  const NextQuizButton({this.onNextClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onNextClick,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          width: 800,
          height: 50,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.amber, Colors.amberAccent.withOpacity(0.8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            " !برو بعدی ",
            style: TextStyle(fontSize: 30, color: Colors.deepPurple),
          ),
        ),
      ),
    );
  }
}
