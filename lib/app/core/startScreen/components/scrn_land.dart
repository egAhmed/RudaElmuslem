import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rudaelmoslem/straing_app.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/theme/font_style.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

class ScrnLandSape extends StatefulWidget {
  ScrnLandSape({Key? key}) : super(key: key);

  @override
  _ScrnLandSapeState createState() => _ScrnLandSapeState();
}

class _ScrnLandSapeState extends State<ScrnLandSape> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecorationGradient,
      //color: Color(0xff0be18),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [

               Positioned(
                top: 15.0.w,
                right: 35.0.h,
                child: Container(
                  //height:30.0.h,
                  //width: 100.0.w,
                  //color: Colors.amber,
                  child: Text(
                    titleApp_string,
                    style: TextStyle(
                      fontFamily: 'Mada',
                      color: Colors.white,
                      fontSize: 30.0.sp,
                      fontWeight: titleApp_FontWeight
                      ),
                    textAlign: TextAlign.center,
                  ), 
                ),
              ),

              Positioned(
                top: 40.0.w,
                right: 25.0.h,
                child: Container(
                  child: Text(
                    infoApp,
                    style: TextStyle(
                        fontSize: 12.0.sp,
                        fontWeight:  contantApp_FontWeight,
                        color: Colors.white60
                      ),
                    textAlign: TextAlign.center,
                  ),
                )
              ),

              Positioned(
                top: 30.0.w,
                left: 5.0.h,
                child: Container(
                  height: 8.0.h,
                  width: 30.0.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xff0b1a2d),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 30,horizontal: 50),
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Center(
                      child: Text(
                        'ابدء',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Mada',
                            fontSize: 18.0.sp,
                            fontWeight:  contantApp_FontWeight,
                            color: Colors.white
                          ),
                        ),
                    ),
                  ),
                ),
              ),

              
              Positioned(
                bottom: 50,
                right: 5.0.h,
                //bottom: 0,
                child: Hero(
                  tag: 'dashImageland',
                  child: Container(
                    height:50.0.w,
                    width: 50.0.h,
                    //decoration: BoxDecoration(),
                    child: SvgPicture.asset(
                      'assets/svg/1296511.svg',
                      fit: BoxFit.fill,
                      color: Colors.white,
                      //scale: 10.0,
                    ),
                  ),
                ),
              ),

            ] 
          ),
        )
      )
    );
  }
}