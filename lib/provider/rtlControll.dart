import 'package:flutter/material.dart';

class RTLController with ChangeNotifier{
  Locale? _appLocale ;
  Locale get appLocal => _appLocale! ;

  set appLocal(Locale appLocale){
    _appLocale = appLocale;
    notifyListeners();
  } 

  RTLController(){
    
  }

  void changeDirection() {
    if (_appLocale == Locale("ar")) {
      _appLocale = Locale("en");
    } else {
      _appLocale = Locale("ar");
    }
    notifyListeners();
  }
}