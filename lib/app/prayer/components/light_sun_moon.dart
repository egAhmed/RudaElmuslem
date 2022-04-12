import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

class LightSunMoon extends StatefulWidget {
  //final String? imgPath;
  
  final int? indexList;
  
  const LightSunMoon({
    Key? key, 
    this.indexList,
   //this.imgPath
   }) : super(key: key);

  @override
  State<LightSunMoon> createState() => _LightSunMoonState();
}

class _LightSunMoonState extends State<LightSunMoon> with TickerProviderStateMixin {

  //final AnimationController _animationController = AnimationController(vsync: this ,duration: Duration(seconds: 1000));


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 30.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(120)
      ),
      child: Container(
        height: 23.h,
        width: 23.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(90)
        ),
        child: Container(
          height: 18.h,
          width: 18.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(80)
          ),
          child: Container(
            height: 12.h,
            width: 12.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(50)
            ),
            child:widget.indexList == 4|| widget.indexList == 5? 
            SlideInLeft(
              animate: true,
              child: SvgPicture.asset(
                  'assets/svg/moon-hlal.svg',
                  ///'assets/svg/moon-hlal.svg',
                  color: Colors.white,
                  height: 8.0.h,
                  width: 8.0.h,
                  fit: BoxFit.fill,
              ),
            ):SlideInUp(
              animate: true,
              //manualTrigger: true,
              child: SvgPicture.asset(
                  'assets/svg/sun-svg.svg',
                  ///'assets/svg/moon-hlal.svg',
                  color: Colors.white,
                  height: 8.0.h,
                  width: 8.0.h,
                  fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}