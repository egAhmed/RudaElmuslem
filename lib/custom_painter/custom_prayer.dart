import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomPrayer extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();
    Path path =  Path();
    Offset center = Offset(width/2, height/2);
    var radius = 20.0;

    /*var sides = 3;
    Offset center = Offset(width/2, height/2);
    var angle = (math.pi * 2 ) / sides;
    Offset stratPoint = Offset(radius * math.cos(0.0),radius * math.sin(0.0));
    //Offset endPoint = Offset(radius * math.cos(0.0),radius * math.sin(0.0));
    path.moveTo(stratPoint.dx + center.dx, stratPoint.dy + center.dy);
    for(int i = 1; i<= sides;i++){
      double x = radius * math.cos(angle +i) + center.dx;
      double y = radius * math.sin(angle +i)+ center.dy;
      path.lineTo(x, y);
    }*/

    var moveheight = height *0.2;
    path.moveTo(50, moveheight);
    //path.lineTo(width - 65,50);
    //path.arcTo(Rect.fromLTWH(70,0,width - 70, 0), 1.5 * math.pi,0.5 *math.pi, true);
    //path.addOval(Rect.fromLTWH(50, 0, 70, 100));
    path.arcToPoint(Offset(width -50 ,moveheight),radius: Radius.circular(10));
    path.arcTo(Rect.fromPoints(
      Offset(width -100,moveheight), Offset(width,200)),
       1.5 * math.pi, 0.5 * math.pi, true);
    /*path.arcTo(Rect.fromCircle(
      center: Offset(width - radius,  radius),radius: radius),
       0, 0.5 * math.pi, false);*/
    path.lineTo(width ,height - radius);
    path.arcToPoint(Offset(width -radius,height),radius: Radius.circular(radius),clockwise: false);
    path.lineTo(radius, height);
    path.arcToPoint(Offset(0,height - radius),radius: Radius.circular(radius),clockwise: false);
    path.lineTo(0, moveheight+50);
    //path.arcToPoint(Offset(0,height - radius),radius: Radius.circular(radius),clockwise: false);
    //path.arcToPoint(Offset(radius,0),radius: Radius.elliptical(70, 50));
    path.arcTo(Rect.fromLTWH(0, moveheight, 100, 100), 1 * math.pi,0.5 *math.pi, false);



    //path.addOval(Rect.fromCircle(center: center,radius: 100));
    //var rect = Rect.fromCircle(center: center,radius: 100);

    //path.close();
    paint.color =Colors.white38;
    paint.strokeWidth = 4.0;
    paint.style = PaintingStyle.fill;
    paint.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path, paint);
    //canvas.drawRect(rect, paint);



  }
  
    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
  
}
//

class CustomPathPrayer extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      Path path = Path();
      Paint paint = Paint();


     /* //path.moveTo(size.width, size.height );
      path.moveTo(0, size.height * 0.3 + 50);
      
      path.lineTo(0, size.height - 70);
      path.quadraticBezierTo(0, size.height, 50, size.height);
      path.lineTo(size.width - 70, size.height);
      path.quadraticBezierTo(
          size.width, size.height, size.width, size.height - 70);
      path.lineTo(size.width, size.height * 0.3 + 50);
      path.quadraticBezierTo(
          size.width, size.height * 0.3, size.width -70, size.height * 0.3 - 50);
      //path.lineTo(0, 0  );
      path.quadraticBezierTo(0,0 , 0, size.height * 0.5 +80);
      //path.lineTo(0, size.height * 0.3 +50);
      //path.quadraticBezierTo(
          //0, size.height * 0.3,  50, size.height * 0.3 - 50);*/
      //----------------------------------------------------------------
      /*path.lineTo(0, size.height *0.75);
      path.quadraticBezierTo(size.width* 0.10, size.height*0.70, size.width*0.17, size.height*0.90);
      path.quadraticBezierTo(size.width*0.20, size.height, size.width*0.25, size.height*0.90);
      path.quadraticBezierTo(size.width*0.40, size.height*0.40, size.width*0.50, size.height*0.70);
      path.quadraticBezierTo(size.width*0.60, size.height*0.85, size.width*0.65, size.height*0.65);
      path.quadraticBezierTo(size.width*0.70, size.height*0.90, size.width, 0);
      */

      //path.close();

      paint.color =  Colors.red;
      canvas.drawRect(
        Offset(100,100) & Size(size.width, size.height),paint
      );

      

      paint.color =  Colors.red;
      //canvas.drawPath(path, paint);

      path = Path();
      path.lineTo(0, size.height*0.50);
      path.quadraticBezierTo(size.width*0.10, size.height*0.80, size.width*0.15, size.height*0.60);
      path.quadraticBezierTo(size.width*0.20, size.height*0.45, size.width*0.27, size.height*0.60);
      path.quadraticBezierTo(size.width*0.45, size.height, size.width*0.50, size.height*0.80);
      path.quadraticBezierTo(size.width*0.55, size.height*0.45, size.width*0.75, size.height*0.75);
      path.quadraticBezierTo(size.width*0.85, size.height*0.93, size.width, size.height*0.60);
      path.lineTo(size.width, 0);
      path.close();

      paint.color = Colors.red[300]!;
      //canvas.drawPath(path, paint);

      path =Path();
      path.lineTo(0, size.height*0.75);
      path.quadraticBezierTo(size.width*0.10, size.height*0.55, size.width*0.22, size.height*0.70);
      path.quadraticBezierTo(size.width*0.30, size.height*0.90, size.width*0.40, size.height*0.75);
      path.quadraticBezierTo(size.width*0.52, size.height*0.50, size.width*0.65, size.height*0.70);
      path.quadraticBezierTo(size.width*0.75, size.height*0.85, size.width, size.height*0.60);
      path.lineTo(size.width, 0);
      path.close();

      //paint.color = Colors.red[100];
      //canvas.drawPath(path, paint);
    }
  
    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
  
}


/*
   child: Center(
        child: ClipPath(
          clipper: PrayerCliper(),
          child: Container(
            height:MediaQuery.of(context).size.height *0.8,
            width: MediaQuery.of(context).size.width*0.92,//0.6,
            color: Colors.white54,
          ),
        ),
      ),
 */

class PrayerCliper extends CustomClipper<Path>{
  
  @override
  Path getClip(Size size) {
      
      var roundnessFactor = 50.0;

      var path = Path();

      /*path.moveTo(0, size.height * 0.33);
      path.lineTo(0, size.height - roundnessFactor);
      path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
      path.lineTo(size.width - roundnessFactor, size.height);
      path.quadraticBezierTo(
          size.width, size.height, size.width, size.height - roundnessFactor);
      path.lineTo(size.width,size.height * 0.33 - roundnessFactor * 0.3);
      path.quadraticBezierTo(size.width - 10, roundnessFactor,
          size.width - roundnessFactor * 1.5, roundnessFactor * 1.5);
      path.lineTo(
          roundnessFactor * 0.6, size.height * 0.33 - roundnessFactor * 0.3);
      path.quadraticBezierTo(
          0, size.height * 0.33, 0, size.height * 0.33 + roundnessFactor);*/
      

      /*
      path.moveTo(0, size.height - 150);

      path.lineTo(0, size.height - 70);
      path.quadraticBezierTo(0, size.height, 70, size.height);

      path.lineTo(size.width - 70, size.height);
      path.quadraticBezierTo(size.width, size.height, size.width, size.height - 70);

      path.lineTo(size.width, size.height * 0.3 + 50);
      path.quadraticBezierTo(size.width, size.height * 0.3, size.width - 50, size.height * 0.3 - 50);

      

      //path.lineTo(size.width - 50,size.height * 0.3+50);
      //path.quadraticBezierTo(size.width - 50, size.height * 0.3, size.width - 100, size.height * 0.3 -50);

      path.lineTo(0, size.height * 0.3 +50);
      path.quadraticBezierTo(0, size.height * 0.3 , 50, size.height * 0.3 -50);

      path.lineTo(50, size.height * 0.3 -50);
      path.quadraticBezierTo(50, 70, 190, 40);
      

      path.lineTo(size.width - 50, size.height * 0.3 -50);
      path.quadraticBezierTo(size.width - 50, 70 , size.width - 190, 40);
      
      
      //path.lineTo(190, 40);
      //path.quadraticBezierTo(190, 40, 195, 40);
      //path.lineTo(size.width -190, 40);
      //path.quadraticBezierTo(size.width - 190, 40, size.width -195, 40);


      //path.moveTo(195, 40);
    */
      path.moveTo(195, 40);

      // rihgt top
      path.lineTo(size.width - 190, 40);
      path.quadraticBezierTo(size.width -50, 70 , size.width - 50, size.height * 0.3 -50);

      // rihgt center
      path.lineTo(size.width - 50, size.height * 0.3 - 50);
      path.quadraticBezierTo(size.width , size.height * 0.3, size.width , size.height * 0.3 + 50);

      // rihgt btoom
      path.lineTo(size.width , size.height -70);
      path.quadraticBezierTo(size.width, size.height , size.width -70, size.height );


      //lifte btoom
      path.lineTo(70, size.height );
      path.quadraticBezierTo(0, size.height, 0, size.height-70);


      //lifte center
      path.lineTo(0, size.height * 0.3 +50);
      path.quadraticBezierTo(0, size.height * 0.3 , 50, size.height * 0.3 -50);


      //lift top
      path.lineTo(50, size.height * 0.3 -50);
      path.quadraticBezierTo(50, 70, 195, 40);

      
      path.close();
      return path;
    }
  
    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
