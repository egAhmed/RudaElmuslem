import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/models/saly/radio_model.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

class CardSalyTimer extends StatelessWidget {
  const CardSalyTimer({
     Key? key,
     required this.item,
    //this.time,
    //this.type,
    //this.ontap,
    //this.checked
  }) : super(key: key);

  final RadioModel item;
  //final String time;
  //final String type;
  //final Function ontap;
  //final bool checked ;
  

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          color: item.isSelected?Theme.of(context).primaryColor:Theme.of(context).cardTheme.color,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(20),
          //   color: item.isSelected?ColorUtil.minColor:Colors.grey,
          // ),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item.time,
                style: item.isSelected?Theme.of(context).primaryTextTheme.subtitle1!.copyWith(color: Colors.white):
                Theme.of(context).primaryTextTheme.subtitle1,
              ),
              Container(
                margin: EdgeInsets.only(top: 1.0.h,bottom: 1.0.h),
                height: 0.2.h,
                color: Colors.white24,
              ),
              Text(
                item.type,
                style:  item.isSelected?Theme.of(context).primaryTextTheme.subtitle1!.copyWith(color: Colors.white,fontSize: 10.0.sp):
                Theme.of(context).primaryTextTheme.subtitle1!.copyWith(fontSize: 10.0.sp),
              ),
            ],
            ),
        );
      }
    );
  }
}