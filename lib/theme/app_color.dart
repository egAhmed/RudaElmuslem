import 'package:flutter/material.dart';



class ColorUtil{
  static const Color minColor = Color(0xff060812);
  static const Color minColor1 = Color(0xFF3F51B5);
  static const Color minColordark = Color(0xFF576BDA);
  static const Color TextMinColor = Color(0xff324090);
  static const Color  TextColorGury = Color(0xFFA0A2B1);
  static const Color   buttonColor = Color(0xFFf7ce80);
  static const Color  buckgrundColor =Color(0xffebedf7);
  static const LinearGradient linearGradient = LinearGradient(
  colors:[
    Color(0xff1f285a),
    Color(0xff3f51b5),
  ],);

  static  LinearGradient linearGradient2 = LinearGradient(
    
  colors:[
    Color(0xff1f285a).withOpacity(0.7),
    Color(0xff3f51b5).withOpacity(0.8),
  ],);

  static final List<LinearGradient> prayerTimeColors = [
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    colors:[
      Color(0xFFF5C263).withOpacity(0.7),
      Color(0xFFf7ce80).withOpacity(0.8),
    ],),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    colors:[      
      Color(0xFFFfc107).withOpacity(0.7),
      Color(0xFFff8300).withOpacity(0.8),
    ],),
    LinearGradient(
       begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    colors:[
      Color(0xFFff8f00).withOpacity(0.7),
      Color(0xFFA17117).withOpacity(0.8),
    ],),
    LinearGradient(
       begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    colors:[
      Color(0xFFF8813D).withOpacity(0.7),
      Color(0xFF675F80).withOpacity(0.8),
    ],),
    LinearGradient(
       begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    colors:[
      Color(0xff211E2B).withOpacity(0.7),
      Color(0xFF51465A).withOpacity(0.8),
    ],),
    LinearGradient(
       begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    colors:[
      Color(0xff211E2B).withOpacity(0.7),
      Color(0xFF0E0D0F).withOpacity(0.8),
    ],),
  ];

}


//-----------  Main Colors
final Color themeColor_p = Color(0xff373332);
final Color titleApp_color = Colors.white;

final LinearGradient linearGradient = LinearGradient(
  colors:[
    Color(0xff373332),
    Color(0xff161514),
  ],);

final BoxDecoration boxDecorationGradient =  BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: [
        0.0,
        1.0,
      ],
      colors: [
        Color(0xff239cb1),//45c2da / 0xff239cb1
        Color(0xff0b1a2d),//0f233d / 0xff0b1a2d
      ],
    )
  );
/*
0xff010313
373332
0xff010719
0xff0b0045
0xff003148
 */

//---------- Dashbord
final Color colorImage = Color(0xffd6d6d6);
