import 'package:flutter/material.dart';
import 'dart:math' as math;

class AzkarClipper extends  CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height *0.6);
    path.quadraticBezierTo(50, size.height , 100, size.height *0.9);
    path.lineTo(size.width, size.height*0.3);
    path.lineTo(size.width, 0);



    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}