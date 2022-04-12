import 'package:flutter/material.dart';
import 'dart:math' as math;

class CardClipper extends  CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(0, 120);
    path.lineTo(0 , 120);
    
     path.quadraticBezierTo(50, size.height *0.3+40 , size.width/3+20, size.height * 0.6);
     //path.lineTo(0, size.height);
     path.quadraticBezierTo(size.width/3+70, size.height * 0.8 , size.width, 100);
     //path.quadraticBezierTo(150, size.height * 0.6 , size.width, 150);
    //path.lineTo(0, size.height);
    path.lineTo(size.width , size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}