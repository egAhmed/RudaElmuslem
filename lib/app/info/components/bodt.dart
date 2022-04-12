import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

import 'content.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return Scaffold(
          body: Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svg/teaching.svg'
                ),

                Container(
                  decoration: BoxDecoration(
                    gradient: ColorUtil.linearGradient2
                  ),
                ),

                Container(
                  height: 100.h,
                  width: 100.w,
                  child: Container(
                   // height: 100.h,
                   //width: 100.w,
                   //alignment: Alignment.center,
                    child: Content()
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}