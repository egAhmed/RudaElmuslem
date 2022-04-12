import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/app/quran/new/quranN.dart';
import 'package:rudaelmoslem/constants/constants.dart';
import 'package:rudaelmoslem/custom_painter/card_cutom.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';
import 'dart:ui' as ui show window;





class LastRead extends StatefulWidget {

   LastRead({Key? key}) : super(key: key);

   

  @override
  State<LastRead> createState() => _LastReadState();
}

class _LastReadState extends State<LastRead> {
  

  int getNum(){
    var numsurah = 0;
    //setState(() {
      numsurah = GetStorage().read(kBookmarkSurahNum);
   // });
    return numsurah;
  }

  String getName(){
    String namesurah ='' ;
    //setState(() {
       namesurah = GetStorage().read(kBookmarkSurahName);
      
    //});
    return namesurah;
  }

   bool isRTL() {
    return ui.window.locale.languageCode.toLowerCase() == "ar";
  }

  @override
  Widget build(BuildContext context) {
    Locale  locale = Localizations.localeOf(context);
    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return Container(
          width: 100.0.w,
          alignment: Alignment.center,
          child: Card(
            color: value.themeMode == ThemeMode.dark?Theme.of(context).cardTheme.color:
            Color(0xFF3F51B5),
            child: Container(
              height: 25.0.h,
              width: 90.0.w,
              // clipBehavior: Clip.hardEdge,
              // decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(30),
              //   //color: ColorUtil.minColor1
              // ),
              child: GestureDetector(
                 onTap: (){
              
                  Navigator.pushNamed(context,'/quran',arguments: 
                  ScreenArguments(QuranN(suraNum: getNum(),)));
                    //.whenComplete(() => RefreshIndicatorState());
                  //print(numsurah);
                  //QuranN.mykey.currentState!.goToPage(numsurah);
                },
                child: Stack(
                  children: [
                    Row(
                      children: [
                        
                        CustomPaint(
                          painter: CardCustomPrayer(),
                          child: Container(
                            //height: 20.0.h,
                            //color: Color(0xffDBDEF2),
                          ),
                        ),
                        Spacer(),
                        CustomPaint(
                          painter: CardCustomPrayer(),
                          child: Container(
                            //height: 20.0.h,
                            //color: Color(0xffDBDEF2),
                          ),
                        ),
                        Spacer(),
                        CustomPaint(
                          painter: CardCustomPrayer(),
                          child: Container(
                            //height: 20.0.h,
                            //color: Color(0xffDBDEF2),
                          ),
                        ),
                        Spacer(),
                        

                      ],
                    ),
                    Container(
                      child: Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: Container(
                              //color: Colors.white12,
                              padding: EdgeInsets.symmetric(vertical: 1.5.h,horizontal: 5.0.w),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Spacer(),
                                  Container(
                                    child: Text(
                                      'homepage.lastread.last'.tr(),
                                      style:  value.themeMode == ThemeMode.dark? Theme.of(context).textTheme.headline5:
                                      Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white)
                                    ),
                                  ),
                                  Spacer(),
                                  Spacer(),
                                  Container(
                                    child: Text(
                                     'homepage.lastread.suhraname'.tr(namedArgs: {'name': '${getName()}' }),
                                      style:  value.themeMode == ThemeMode.dark? Theme.of(context).textTheme.headline4:
                                      Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white)
                                    ),
                                  ),
                                  SizedBox(height: 0.5.h,),
                                  Container(
                                    child: Text(
                                      'homepage.lastread.pagenum'.tr(namedArgs: {'num':"${getNum()}"}),
                                      style:  value.themeMode == ThemeMode.dark?Theme.of(context).textTheme.headline5:
                                      Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white)
                                    ),
                                  ),
                                  SizedBox(height: 1.0.h,),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          'homepage.lastread.goto'.tr(),
                                          style:  value.themeMode == ThemeMode.dark?Theme.of(context).textTheme.headline4:
                                          Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white)
                                        ),
                                         SizedBox(width: 5.w,),
                                        Icon(
                                          isRTL()?
                                          CupertinoIcons.arrow_left_circle:
                                          CupertinoIcons.arrow_right_circle,
                                          //textDirection: TextDirection.rtl,
                                          color: Colors.white70,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/svg/quran.svg',
                                  height: 8.0.h,
                                  width: 8.0.w,
                                ),
                              ),
                            ),
                          ),
                        ],
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