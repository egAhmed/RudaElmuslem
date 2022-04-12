import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

class AyaNum extends StatelessWidget {
  const AyaNum({Key? key,this.ayanum}) : super(key: key);
  final String? ayanum;

  @override
  Widget build(BuildContext context) {

    // return CircleAvatar(
    //   backgroundColor: Colors.transparent,
    //   backgroundImage: SvgPicture.asset(
    //         'assets/svg/Decorative-Ornamental-Round-Frame.svg',//Decorative-Flourish-Frame-Large
    //         color: Colors.white,
    //       ),
    // );


    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.0.w),
      height: 4.5.h,
      width: 4.5.h,
      //color: Colors.white24,
      child: Stack(
        children: [
          SvgPicture.asset(
            'assets/svg/Decorative-Ornamental-Round-Frame.svg',//Decorative-Flourish-Frame-Large
            color: Colors.white,
          ),

          Center(
            child: Text(
              ayanum.toString()==null?'':ayanum.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 6.0.sp
              ),
            ),
          )
        ],
      )
    );
  }
}