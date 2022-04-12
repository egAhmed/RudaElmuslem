import 'package:flutter/material.dart';

class Alarm {
   String? name;
   bool isNext;
 late  String _stringTime;
  late  DateTime _dateTime;

  Alarm({
     this.name,
    this.isNext = false,
  });

  get getSTime => _stringTime;
  set setSTime(String value) {
    _stringTime = value;
  }

  get getDTime => _dateTime;
  set setDTime(DateTime value) {
    _dateTime = value;
  }

  void toggleNextAlarm(bool onOff) {
    isNext = onOff;
  }
}
