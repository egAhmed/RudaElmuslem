import 'package:flutter/material.dart';
import 'dart:math' as math;



class  CardCustomPrayer extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();
    Path path =  Path();
    Offset center = Offset(width/2, height/2);
    var radius = 20.0;

    paint.color= Colors.white10;
    path.moveTo(120, 0);
    path.lineTo(120, 0);
    path.quadraticBezierTo(100, 0 , 75,15);
    path.quadraticBezierTo(60, 20 , 90,70);
    path.quadraticBezierTo(90, 90 , 50,100);
    path.quadraticBezierTo(10, 120 , 0,height - 30);
    path.lineTo(0, height);
    path.quadraticBezierTo(50, height-50 , 100, 120);
    path.quadraticBezierTo(100, 120 , 120, 80);
    path.quadraticBezierTo(100, 70 ,150, 0);
    path.close();
    //return path;


    // paint.color= Colors.amber;
    // path.moveTo(200, 0);
    // path.lineTo(200, 0);
    // path.quadraticBezierTo(180, 0 , 125,15);
    // path.quadraticBezierTo(140, 20 , 140,70);
    // path.quadraticBezierTo(170, 90 , 100,100);
    // path.quadraticBezierTo(90, 120 , 50,height - 30);
    // path.lineTo(50, height);
    // path.quadraticBezierTo(50, height-50 , 100, 120);
    // path.quadraticBezierTo(100, 120 , 120, 80);
    // path.quadraticBezierTo(100, 70 ,150, 0);
    // path.close();
    canvas.drawPath(path, paint);
    
  
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

