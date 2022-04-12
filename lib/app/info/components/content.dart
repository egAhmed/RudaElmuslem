import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
            builder: (context, value, child)  {
        return Container(
          child: Column(
            children: [
              Spacer(), 
              //SizedBox(height: 100.h*0.2,),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.info,
                    size: 70.0.sp,
                    color: Colors.white,
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 3.0.h),
                      child: Text(
                        'appinfo.title'.tr(),
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0.sp,
                          color: Colors.white
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 3.0.h),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 3.0.h),
                        child: Text(
                          'appinfo.content'.tr(),
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 14.sp,
                            color: Colors.white
                          ),
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                      ),

                      SizedBox(height:1.h,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'appinfo.rengInfo'.tr(),
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 14.0.sp,
                            color: Colors.white
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                     

                     
                
                    ],
                  ),
                ),
              ),
              Spacer(), 
            ],
          ),
        );
      }
    );
  }
}