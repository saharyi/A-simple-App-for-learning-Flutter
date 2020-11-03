import 'dart:convert';

import 'package:flutter/material.dart';
import './services/weather_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class WeatherHome extends StatefulWidget {
  static const PageRoute = "/WeaderHome";

  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  bool searching = false;
  http.Response res;
  void _getData() async {
    setState(() {
      searching = true;
    });
    res = await http.get(
        "http://api.openweathermap.org/data/2.5/weather?q=Urmia&appid=54efc4f79abf428aa8324574be994609&units=metric");
    setState(() {
      searching = false;
    });
  }

  String _getCurrentTemp() {
    if (res == null || res.body == null) return "";
    Map<String, dynamic> body = jsonDecode(res.body);
    Map<String, dynamic> MainTemp = body["main"];
    return MainTemp["temp"].toString();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/img5.jpg"), fit: BoxFit.cover)),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            top: 50,
            right: 100,
            child: Row(
              children: [
                Text("ارومیه",
                    style: Theme.of(context).textTheme.headline3.copyWith(
                          color: Colors.white,
                        )),
                IconButton(
                    icon: Icon(
                  Icons.location_on,
                  color: Colors.white,
                )),
              ],
            ),
          ),
          Positioned(
              bottom: 100,
              left: 130,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "C",
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(color: Colors.white),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.data_usage,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    _getCurrentTemp(),
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(color: Colors.white),
                  ),
                ],
              )),
          Positioned(
            bottom: 400,
            right: 100,
            child: Text("رطوبت:40",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.white)),
          ),
          Positioned(
            bottom: 300,
            right: 100,
            child: Text("حداکثردما:45",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.white)),
          ),
          Positioned(
            bottom: 200,
            right: 100,
            child: Text("حداقل دما:10",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.white)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              curve: Curves.ease,
              duration: Duration(milliseconds: 400),
              width: searching ? 70 : MediaQuery.of(context).size.width,
              height: 70,
              child: RaisedButton(
                  color: Colors.red,
                  onPressed: _getData,
                  child: searching
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white))
                      : Text("دریافت اطلاعات آب و هوا",
                          style: Theme.of(context).textTheme.headline5.copyWith(
                                color: Colors.white,
                              ))),
            ),
          )
        ],
      ),
    ));
  }
}
