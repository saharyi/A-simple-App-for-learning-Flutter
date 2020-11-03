import 'package:flutter/material.dart';

class Finish extends StatelessWidget {
  static const PageRoute = "/Finish";

  @override
  Widget build(BuildContext context) {
    final int score = ModalRoute.of(context).settings.arguments;
    print(score);
    return Scaffold(
      body: Container(
        child: Text(score.toString()),
      ),
    );
  }
}
