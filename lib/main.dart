import 'package:flutter/material.dart';
import 'package:forthappv3/quiz/pages/finish.dart';
import 'package:forthappv3/quiz/pages/quiz.dart';
import 'package:provider/provider.dart';
import './quiz/widgets/nextquestionButton.dart';
import './quiz/pages/login.dart';
import './HomePage.dart';
import './quiz/pages/finish.dart';
import './makharej/expanse_home.dart';
import './makharej/services/expanse_provider.dart';
import './weather/weather_home.dart';
import './weather/services/weather_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ExpanseProvider()),
        ChangeNotifierProvider.value(value: WeatherProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) =>
            Directionality(textDirection: TextDirection.rtl, child: child),
        title: 'HOME',
        routes: {
          "/": (context) => HomePage(),

          /// "/quizlogin": (context) => Login(),ravesh1
          Login.PageRoute: (context) => Login(),
          Quizpage.Pageroute: (context) => Quizpage(),
          Finish.PageRoute: (context) => Finish(),
          NextQuizButton.Pageroute: (context) => NextQuizButton(),
          ExpanseHome.PageRoute: (context) => ExpanseHome(),
          WeatherHome.PageRoute: (context) => WeatherHome(),
        },
      ),
    );
  }
}

//ba mediatequery
class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(title: Text("home"));
    double maxheight = MediaQuery.of(context).size.height -
        appbar.preferredSize.height -
        MediaQuery.of(context)
            .padding
            .top; //ertefae kole safhe - ertefae appbar
    double maxwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appbar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                color: Colors.red,
                width: maxwidth * 0.5,
                height: maxheight * 0.5,
              ),
              Container(
                color: Colors.green,
                width: maxwidth * 0.5,
                height: maxheight * 0.5,
              ),
            ],
          ),
          Container(
            color: Colors.yellow,
            width: maxwidth,
            height: maxheight * 0.25,
          ),
          Container(
            color: Colors.blue,
            width: maxwidth,
            height: maxheight * 0.25,
          )
        ],
      ),
    );
  }
}

//ba expand flex
class TestApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("home"))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.yellow,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}

//ba layaoughtbuilder
class TestApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("home"))),
      body: LayoutBuilder(
        builder: (ctx, constraint) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: (constraint.maxWidth * 0.5) - 16,
                      height: constraint.maxHeight * 0.5,
                      color: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: (constraint.maxWidth * 0.5) - 16,
                      height: constraint.maxHeight * 0.5,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.yellow,
                height: constraint.maxHeight *
                    0.236, //:( fazesho dark nakardam osolan bayad 0.25 mibod
              ),
              Container(
                color: Colors.blue,
                height: constraint.maxHeight * 0.236,
              )
            ],
          );
        },
      ),
    );
  }
}
