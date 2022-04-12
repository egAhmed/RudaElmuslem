import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rudaelmoslem/constants/staticVirable.dart';
import 'package:rudaelmoslem/custom_painter/prayer.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

class Design1 extends StatelessWidget {
  const Design1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [

          Positioned(
            right: - 5.0.w,
            top: - 10.0.h,
            child: Container(
              height: 40.0.h,
              width: 40.0.h,
              decoration: BoxDecoration(
                color: Color(0xFFDBDFDB),
                shape: BoxShape.circle
                //borderRadius: BorderRadius.circular(200)
              ),
              child: Container(
                height: 40.0.h,
                width: 40.0.h,
                margin: EdgeInsets.only(left: 2.0.w),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  
                ),
                child: Image.asset(
                  'assets/images/hand.png',
                  fit: BoxFit.contain,
                  width: 100.0.w,
                  height: 35.0.h,
                ),
              ),
            ),
          ),

          Positioned(
              height:72.0.h,
              right: 20.0.w,
              child: CircleAvatar(
                backgroundColor: ColorUtil.buttonColor,
                radius: 22,
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.local_car_wash_outlined),
                    color: Colors.black,
                    iconSize: 30,
                    onPressed: () async{
                      //NotificationPageSetting
                      Navigator.pushNamed(context, '/prayer/setting/notification');
                    }
                  ),
                ),
              )
            ),

            Positioned(
              height:68.0.h,
              right: 45.0.w,
              child: CircleAvatar(
                backgroundColor: ColorUtil.buttonColor,
                radius: 22,
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.settings),
                    color: Colors.black,
                    iconSize: 30,
                    onPressed: () async{
                      //'prayer/setting/prayer'
                      Navigator.pushNamed(context,'/prayer/setting/prayer');
                    }
                  ),
                ),
              )
            ),

            Positioned(
              height:60.0.h,
              right: 65.0.w,
              child: CircleAvatar(
                backgroundColor: ColorUtil.buttonColor,
                radius: 22,
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.settings),
                    color: Colors.black,
                    iconSize: 30,
                    onPressed: () async{
                      //await diloghelpersetting(context);
                      Navigator.pushNamed(context,'/setting/theme');
                    }
                  ),
                ),
              )
            ),


          Positioned(
            //left: - 28.0.h,
            //bottom: - 5.0.h,
            bottom: 0,
            left: 0,
            child: ClipPath(
              clipper: PrayerClipper(),
              child: Container(
                //height: 70.0.h,
                //width: 75.0.h,
                height: 70.0.h,
                width: 100.0.w,
                padding: EdgeInsets.only(right: 2.0.w,),
                decoration: BoxDecoration(
                  color: Color(0xffcecfce),
                  //borderRadius: BorderRadius.circular(200),
                  //shape: BoxShape.circle
                ),
                child: ClipPath(
                  clipper: PrayerClipper(),
                  child: Container(
                    //height: 70.0.h,
                    //width: 70.0.h,
                    //clipBehavior: Clip.hardEdge,
                    //margin: EdgeInsets.only(right: 3.0.w,),
                    //padding: EdgeInsets.only(left: 40.0.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //shape: BoxShape.circle,
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 4.0.w),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //SizedBox(height: 1.0.h,),
                          Spacer(),
                          Container(
                            //color: Colors.black12,
                            //width: 70.0.w,
                            child: Text(
                              GetStorage().read('kLocationCountry').toString(),
                              style: TextStyle(
                                fontSize: 18.0.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'cairo',
                                color: ColorUtil.TextMinColor
                              ),
                              ),
                          ),
                          SizedBox(height: 2.0.h,),

                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Container(
                              height: 35.0.h,
                              width: 80.0.w,
                              color: Colors.black12,
                              
                            ),
                          ),
                          
                          SizedBox(height: 2.0.h,),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'Temps restant pour ${PrayerGlobalVariables.getPrayerName(
                                      PrayerGlobalVariables.NextPrayerName)}',
                                      //textDirection: TextDirection.ltr,
                                  ),
                                ),
                                Divider(endIndent: 50.0.w,),
                                Container(
                                  child: Text(
                                    PrayerGlobalVariables.NextPrayerHoure.toString() +' : '+
                                    PrayerGlobalVariables.NextPrayerMinutes.toString() +' : '+ 
                                    PrayerGlobalVariables.NextPrayerSeconds.toString(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}