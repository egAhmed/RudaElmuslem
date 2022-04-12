import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

import 'cardpdf.dart';

class CardLibarary extends StatelessWidget {
  final String? pathfile;
  final String? nameBook;

  const CardLibarary({Key? key, this.pathfile, this.nameBook}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0.w,),
      child: Column(
        children: [
          Container(
            //color: Colors.black54,
            height: 53.0.h,
            child: Stack(
              children: [
                Container(
                  height: 50.0.h,
                  width: 70.0.w,
                  decoration: BoxDecoration(
                    color: ColorUtil.buckgrundColor,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 3.0.h,),
                      Container(
                        height: 33.0.h,
                        width: 70.0.w*0.8,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0,3)
                            )
                          ]
                        ),
                        child: CardPDF(pathfile: pathfile,),
                      ),
                      Container(
                        //color: Colors.amber,
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                        alignment: Alignment.centerLeft,
                        height: 10.0.h,
                        child: Text('Name secstion'),
                      ),
                      SizedBox(height: 1.0.h,),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 70.sp*1.2,
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                      height: 7.0.h,
                      width: 15.0.w,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: Icon(CupertinoIcons.ellipsis),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}