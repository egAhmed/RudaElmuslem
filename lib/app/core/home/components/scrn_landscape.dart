import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rudaelmoslem/straing_app.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';
import 'package:rudaelmoslem/theme/app_color.dart';

import 'grid_Card.dart';
import 'grid_v.dart';

class ScrnLandScape extends StatefulWidget {
  ScrnLandScape({Key? key}) : super(key: key);

  @override
  _ScrnLandScapeState createState() => _ScrnLandScapeState();
}

class _ScrnLandScapeState extends State<ScrnLandScape> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: boxDecorationGradient,
      color: Color(0xff285872),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 40.0.w,
                //color: Colors.amber,
                child: Stack(
                  children: [
                    Positioned(
                      left: 30.0.h,
                      top: 2.0.w,
                      child: Container(
                       // height:20.0.h,
                        //width: 100.0.w,
                        //color: Colors.amber,
                        child: Text(
                          titleApp_string,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            color: Colors.white,
                            fontSize: 20.0.sp,
                            //fontWeight: FontWeight.w600
                            ),
                          textAlign: TextAlign.center,
                        ), 
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      right: 25.0.h,
                      //bottom: 0,
                      child: Container(
                        height:35.0.w,
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
                  ],
                ),
              ),
              Container(
                height: 60.0.w,
                width: 100.0.h,
                //color: Colors.white10,
                child: Container(
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 5.0.w,horizontal: 2.0.h),
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    children: [
                     
                      GridCard(
                        buttonHight: 5.0.w,
                        buttonWidth: 20.0.h,
                        titleCard: 'المصحف',
                        imageCard: 'assets/svg/quran.svg',
                        tag: 'quran',
                        onTap: (){
                          Navigator.pushNamed(context,'/quran');
                        },
                      ),
                      GridCard(
                        buttonHight: 10.0.w,
                        buttonWidth: 20.0.h,
                        titleCard: 'أذكار المسلم',
                        imageCard: 'assets/svg/allah.svg',
                        tag: 'azkar',
                        onTap: (){
                          Navigator.pushNamed(context,'/azkar');
                        },
                      ),
                      GridCard(
                        titleCard: 'السبحة',
                        imageCard: 'assets/svg/islam.svg',
                        tag: 'rosary',
                        onTap: (){
                          Navigator.pushNamed(context,'/rosary');
                        },
                      ),
                       GridCard(
                        titleCard: 'صلى على النبى',
                        imageCard: 'assets/svg/islamMohamed.svg',
                        tag: 'saly',
                        onTap: (){
                          Navigator.pushNamed(context,'/saly');
                        },
                      ),
                      GridCard(
                        titleCard: 'مواقيت الصلاه',
                        imageCard: 'assets/svg/clock.svg',
                        tag: 'prayer',
                        onTap: (){
                          Navigator.pushNamed(context,'/prayer');
                        },
                      ),
                      GridCard(
                        titleCard: 'البوصلة',
                        imageCard: 'assets/svg/kaaba.svg',
                        tag: 'qiplah',
                        onTap: (){
                          Navigator.pushNamed(context,'/qiplah');
                        },
                      ),
                      GridCard(
                        titleCard: 'أعرف دينك',
                        imageCard: 'assets/svg/information.svg',
                        tag: 'info1',
                        onTap: (){
                          Navigator.pushNamed(context,'/info');
                        },
                      ),
                      GridCard(
                        titleCard: 'المكتبة الاسلامية',
                        imageCard: 'assets/svg/information.svg',
                        tag: 'info2',
                        onTap: (){
                          Navigator.pushNamed(context,'/info');
                        },
                      ),
                      GridCard(
                        titleCard: 'عن التطبيق',
                        imageCard: 'assets/svg/information.svg',
                        tag: 'info3',
                        onTap: (){
                          Navigator.pushNamed(context,'/info');
                        },
                      ),
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}