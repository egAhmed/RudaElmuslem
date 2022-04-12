import 'package:flutter/material.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

class CardTime extends StatelessWidget {
  const CardTime({Key? key, this.title, this.time, this.isSelected}) : super(key: key);

  final String? title;
  final String? time;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.0.h,
      width: 100.w,
      color: Colors.white24,
      child: ListTile(
        title: Text(
          title!,
          style: TextStyle(
            fontSize: 16.0.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'cairo',
            color: Colors.white
          ),
          ///textAlign: TextAlign.start,
        ),
        subtitle: isSelected! ? Text(
          time!,
          style: TextStyle(
            fontSize: 12.0.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'cairo',
            color: Colors.white
          ),
        ):Text(''),
        trailing:  isSelected! ? Text(''): 
        Text(
          time!,
          style: TextStyle(
            fontSize: 12.0.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'cairo',
            color: Colors.white
          ),
        ),
        leading: Container(width: 2.0.w,),
      ),
    );
    
  }
}