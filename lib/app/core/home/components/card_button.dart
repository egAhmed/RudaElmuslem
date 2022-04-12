import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rudaelmoslem/custom_painter/card_painter.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';


class CardButton extends StatelessWidget {
  
  //final DeviceIformation deviceIformation;
  //final String titlebutton;
  final String? titleCard;
  final String? contantCrad;
  final String? imageCard;
  final String? tag;
  //final double imageWidth;
  final double? buttonHight;
  final double? buttonWidth;
  //final String textButton;
  final Function? onTap;

  const CardButton({Key? key, this.titleCard, this.contantCrad, this.imageCard, this.tag, this.buttonHight, this.buttonWidth, this.onTap}) : super(key: key);
  //final double imgCardHigth;


  @override
  Widget build(BuildContext context) {
    return Container(
      //height: buttonHight == null ?15.0.h:buttonHight,
      margin: EdgeInsets.symmetric(vertical: 1.0.h),
      width: buttonWidth == null ? 20.0.w:buttonWidth,
      child: Column(
        children: [

          Card(
            //elevation: 0,
            //color: Color(0xffDBDEF2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
            ),
            child: GestureDetector(
              onTap:onTap as void Function()? ,
              child: Container(
                height: buttonHight == null ?9.0.h:buttonHight,
                width: 100.0.w,
                child: Center(
                  child: SvgPicture.asset(
                      imageCard!,
                      height: 5.0.h,
                      width: 5.0.h,
                      fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),

          Container(
            child: Hero(
              tag: tag!,
              child: Text(
                titleCard!,
                softWrap: true,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6
              ),
            ),
          ),
        ],
      ),
    );
  }
}