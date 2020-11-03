import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import './quiz.dart';

//import '../services/quiz_provider.dart';

class Login extends StatelessWidget {
  final TextEditingController namecontroller = TextEditingController();
  static const PageRoute = "/quizlogin";

  @override
  Widget build(BuildContext context) {
    //  final quizprovider = Provider.of<QuizProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "LOGIN",
            style: TextStyle(
                fontWeight: FontWeight.w200, fontStyle: FontStyle.italic),
          ),
        ),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.pink[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              width: 500,
              height: 580,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.pink[500], width: 5),
                borderRadius: BorderRadius.circular(10),
                color: Colors.purple[100],
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /* Center(
                      child: Text(
                        //quizprovider.getUsername,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),*/
                    Image.asset(
                      "assets/images/img.png",
                      width: 300,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.pink[50], width: 5),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: EdgeInsets.all(10),
                        width: 400,
                        child: TextField(
                          controller: namecontroller,
                          minLines: 1,
                          maxLength: 10,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                        color: Colors.white,
                        child: Text(
                          "!بزن بریم",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(Quizpage.Pageroute,
                              arguments: namecontroller.text);

                          /* Navigator.of(context).push(
                              MaterialPageRoute(builder: (ctx) => Quizpage()));*/
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
