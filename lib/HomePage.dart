import 'package:flutter/material.dart';
import './weather/weather_home.dart';
import './quiz/pages/login.dart';
import './makharej/expanse_home.dart';

class HomePage extends StatelessWidget {
  @override
  Future<int> _asyncTest() async {
    await Future.delayed(Duration(seconds: 3));
    return 1000;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("HOME")),
          backgroundColor: Colors.redAccent,
        ),
        body: FutureBuilder(
            future: _asyncTest(),
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  // Navigator.of(context).pushNamed("/quizlogin");ravesh1
                                  Navigator.of(context)
                                      .pushNamed(Login.PageRoute);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "کوییزاپ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(color: Colors.white),
                                  ),
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(ExpanseHome.PageRoute);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "مدیریت مخارج",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(color: Colors.white),
                                  ),
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(WeatherHome.PageRoute);
                          },
                          child: Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "هواشناسی",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(color: Colors.white),
                              ),
                              color: Colors.teal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "تنظیمات",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(color: Colors.white),
                              ),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                );
              }
            })
        /* body: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.red,
                        child: Text("کوییزاپ"),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.lime,
                        child: Text("فروشگاه"),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container()
          ],
        )*/
        );
  }
}
