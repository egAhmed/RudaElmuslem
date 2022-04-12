import 'package:flutter/material.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

class AyaQuran extends StatelessWidget {
  const AyaQuran({
    Key? key,
    this.ayaTextAr,
    this.ayaTextEn,
    this.ayanum
  
  }) : super(key: key);

  final String? ayaTextAr;
  final String? ayaTextEn;
  final int? ayanum;

  @override
  Widget build(BuildContext context) {
    return  Container(
      //height: 60.0.h,
      //margin: EdgeInsets.symmetric(horizontal: 1.0.w),
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Wrap(
        //spacing: 2.0.h,
        //runAlignment: WrapAlignment.start,
        //direction: Axis.vertical,
        //verticalDirection: VerticalDirection.down,
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Container(
            //fit: FlexFit.tight,
            //flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                ayaTextAr!,
                textDirection: TextDirection.rtl,
                softWrap: true,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0.sp,
                  color: ColorUtil.TextMinColor
                ),
              ),
            ),
          ),
          SizedBox(height: 4.0.h,width: 100.0.w,),
          Container(
            //flex: 2,
            //fit: FlexFit.tight,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                ayaTextEn!,
                textDirection: TextDirection.ltr,
                softWrap: true,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0.sp,
                  color: ColorUtil.TextMinColor
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}

// Container(
          //   height: 3.0.h,
          //   margin: EdgeInsets.symmetric(horizontal: 5.0.w),
          //   padding: EdgeInsets.symmetric(horizontal: 2.0.w),
          //   alignment: Alignment.centerLeft,
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(5)
          //   ),
          //   child: Container(
          //     height: 2.5.h,
          //     width: 2.5.h,
          //     decoration: BoxDecoration(
          //       color: Color(0xff39b6ab),
          //       borderRadius: BorderRadius.circular(50)
          //     ),
          //     child: Center(
          //       child: Text(
          //             ayanum.toString(),
          //             textDirection: TextDirection.rtl,
          //             //softWrap: true,
          //             style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               fontSize: 12.0.sp,
          //               color: Colors.white
          //             ),
          //           ),
          //     ),
          //   ),
          // ),
          // SizedBox(height: 2.0.h,),