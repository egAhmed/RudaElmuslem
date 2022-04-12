
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rudaelmoslem/app/core/startScreen/startscren.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => StartScreen())));
  }

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    //print(SizerUtil.orientation);
    return SizerUtil.orientation == Orientation.portrait
    ? scrnPortrait()
    : scrnLandScape();

     

  }

  Widget scrnPortrait(){
    return Material(
      child: Container(
        color: ColorUtil.minColor,
        child: Center(
          child: Container(
            height: 40.0.h,
            width: 50.0.w,
            child: Image.asset(
              'assets/icons/icon.png',
              fit: BoxFit.contain,
            )
          )
        ),
      ),
    );
  }

  Widget scrnLandScape(){
    return Material(
      
      child: Scaffold(
        backgroundColor:  ColorUtil.minColor,
        body: Center(
          child: Container(
            height: 40.0.h,
            width: 50.0.w,
            child: Image.asset(
              'assets/icons/icon.png',
              fit: BoxFit.contain,
            )
          ),
        ),
      ),
    );
  }
}