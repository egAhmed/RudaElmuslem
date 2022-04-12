import 'package:flutter/material.dart';
import 'dart:math' as math;

class PrayerClipper extends  CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();

    //path.moveTo(0, 20);
    //path.lineTo(0, size.height);
    //path.lineTo(size.width/3, size.height);
    //path.quadraticBezierTo(0, 20 , size.width/2, size.height/2);
    //path.lineTo(size.width, size.height*0.3);
    //path.lineTo(size.width, 0);



    path.moveTo(0, 80);
    path.lineTo(0, 80);
    path.quadraticBezierTo(size.width , 10, size.width - 20, size.height/2);
    path.quadraticBezierTo(size.width-20 , size.height *0.95, size.width - 100, size.height);
    path.lineTo(0, size.height);
    
    
    //path.lineTo(0, size.height);
    //path.arcToPoint(Offset(size.width, size.height),
    //radius: Radius.elliptical(30, 10));
    //path.lineTo(size.width, 0);
   
   
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}