import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

class CardAzkarList extends StatelessWidget {

  final String? title;
  final String? titlear;
  final String? srcImage;
  final bool? isRaght;
  final Function? onTap;

  const CardAzkarList({Key? key, this.title,this.titlear,
   this.srcImage, this.onTap,this.isRaght}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    Locale  locale = Localizations.localeOf(context);
    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return Container(
          width: 100.0.w,
          margin: EdgeInsets.only(bottom: 3.0.h),
          //color: Colors.transparent,
          child: GestureDetector(
            onTap: onTap as void Function()?,
            child: Card(
              child: Container(
                height: 15.0.h,
                width: 80.0.w,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(30),
                //   color: Colors.black,
                // ),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        //color: Colors.black26,
                        child: Center(
                          child: SvgPicture.asset(
                            srcImage!, //'assets/svg/002-islamic.svg',
                            height: 6.0.h,
                            width: 6.0.h,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                        child: Text(
                          locale.countryCode =='EG'?titlear!:title!,
                          style: Theme.of(context).textTheme.headline4
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}