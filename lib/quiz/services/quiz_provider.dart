import 'package:flutter/material.dart';

class QuizProvider extends ChangeNotifier {
  String _username = "";
  String get getUsername => _username;
  void setUsername(String username) {
    username = _username;
    notifyListeners();
  }
}
