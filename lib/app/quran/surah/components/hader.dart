import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

class HaderSurah extends StatelessWidget {
  const HaderSurah({Key? key,this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.5.w,vertical: 2.0.h),
      height: 11.0.h,
      width: 95.0.w,
      child: Stack(
        children: [
          SvgPicture.asset(
          'assets/svg/Ornamental-Rectangular-Frame.svg',
          fit: BoxFit.fill,
          color: Colors.white,
          ),

          Center(
            child: Text(
              'الفاتحة',
              style: TextStyle(
                color: Colors.white,
              ),
            )
          )
        ],
      )
    );
  }
}