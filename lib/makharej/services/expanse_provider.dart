import 'package:flutter/material.dart';
import 'package:persian_date/persian_date.dart';

class ExpanseData {
  final id;
  final title;
  final price;
  final dateTime;
  ExpanseData({this.id, this.title, this.price, this.dateTime});
}

class ExpanseProvider extends ChangeNotifier {
  List<ExpanseData> _expanses = [
    /* ExpanseData(
        id: 1,
        title: "خرید نون",
        price: 5000,
        dateTime: DateTime(2020, 2, 26, 9, 15).toString()),
    ExpanseData(
        id: 2,
        title: "خرید خمیر دندان",
        price: 3000,
        dateTime: DateTime(2020, 2, 25, 18, 30).toString()),*/
  ];
  List<ExpanseData> get expansess => _expanses;

  void addExpanse(String title1, int price1, String Time1) {
    _expanses.add(ExpanseData(
        //id: _expanses[_expanses.length - 1].id + 1,
        id: expansess.length > 0 ? _expanses[_expanses.length - 1].id + 1 : 1,
        // id: expansess.length > 0 ? _expanses[_expanses.length] : 1,
        title: title1,
        price: price1,
        dateTime: Time1));
    notifyListeners();
  }

  String getFormatedTime(String SelectedTime) {
    PersianDate date = PersianDate(gregorian: SelectedTime);
    return "${date.hour}:${date.minute} -  ${date.day} ${date.monthname}  ";
  }

  void deleteExpanse(int id) {
    _expanses.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
