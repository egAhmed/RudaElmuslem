import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/app/prayer/RawPrayDataHandler.dart';
import 'package:rudaelmoslem/constants/constants.dart';
import 'package:rudaelmoslem/constants/staticVirable.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:rudaelmoslem/models/jakim_esolat_model.dart';
import 'package:rudaelmoslem/provider/settingsProvider.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:intl/intl.dart' as intl;
import 'package:rudaelmoslem/utilts/DateAndTime.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';
import 'package:rudaelmoslem/utilts/temp_prayer_data.dart';

import 'cardtime.dart';
import 'light_sun_moon.dart';

class Design2 extends StatefulWidget {
  List<PrayerTimeNotifi>? prayerTimeData;
  Design2({Key? key, this.prayerTimeData}) : super(key: key);

  @override
  _Design2State createState() => _Design2State();
}

class _Design2State extends State<Design2> with TickerProviderStateMixin {
  bool? use12hour = GetStorage().read(kStoredTimeIs12);
  bool? showOtherPrayerTime;
 // ScrollController? _Cntroller;
  final FixedExtentScrollController _fixedController = FixedExtentScrollController();
  //final AnimationController _animationController = AnimationController(vsync: ,duration: Duration(seconds: 1000));
  List<Color> colorsList = [
    ColorUtil.minColor1,
    Colors.amber,
    Colors.black38,
    Colors.blueAccent,
    Colors.cyanAccent,
    Colors.cyanAccent,
  ]; 
  int indexList = 0;
  bool isSelected = false;


  @override
  void initState() {
    super.initState();
    // _Cntroller = ScrollController(initialScrollOffset: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(
      builder: (context, setting, child) {
        use12hour = setting.use12hour;
        showOtherPrayerTime = setting.showOtherPrayerTime;
        //print( DateTime.fromMillisecondsSinceEpoch(widget.prayerTimeData![14].times![4]));
        var _today = PrayDataHandler.todayPrayData(widget.prayerTimeData!)!;
        //print(_today);

        //String imsakTime = DateAndTime.toTimeReadable(_today[0], use12hour!);
        String fajerTime = DateAndTime.toTimeReadable(_today[1], use12hour!);
        String syurukTime = DateAndTime.toTimeReadable(_today[2], use12hour!);
        //String dhuhaTime = DateAndTime.toTimeReadable(_today[3], use12hour!);
        String zohorTime = DateAndTime.toTimeReadable(_today[4], use12hour!);
        String asarTime = DateAndTime.toTimeReadable(_today[5], use12hour!);
        String maghribTime = DateAndTime.toTimeReadable(_today[6], use12hour!);
        String ishaTime = DateAndTime.toTimeReadable(_today[7], use12hour!);

        TempPrayerTimeData.subuhTime = fajerTime;
        TempPrayerTimeData.zohorTime = zohorTime;
        TempPrayerTimeData.asarTime = asarTime;
        TempPrayerTimeData.maghribTime = maghribTime;
        TempPrayerTimeData.isyaTime = ishaTime;

        return  Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
            gradient: ColorUtil.prayerTimeColors[indexList],
          ),
          child: Column(
            children: [
              Container(
                height: 22.0.h,
                //color: Colors.black26,
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.settings),
                        color: Colors.white,
                        onPressed: (){
                          Navigator.pushNamed(context,'/prayer/setting');
                        },
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: (){
                            Navigator.pushNamed(context,'/prayer/setting/prayer');
                          },
                          icon: Icon(Icons.room_outlined,size: 19.0.sp,),
                          color: Colors.white,
                        ),
                        SizedBox(width: 1.0.w,),
                        Text(
                          GetStorage().read(kLocationCountry).toString(),
                          style: TextStyle(
                            fontSize: 19.0.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'cairo',
                            color: Colors.white
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'prayetime.title'.tr(),
                      style: TextStyle(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'cairo',
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                child: Stack(
                  children: [

                    // Positioned(
                    //   top: 100.0.h*0.3,
                    //   left: -5.0.h,
                    //   child:LightSunMoon(
                    //     imgPath: 'assets/svg/moon-hlal.svg',
                    //   )
                    // ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 75.w,
                        height: 75.h,
                        //color: Colors.black12,
                        child: ListWheelScrollView(
                          itemExtent: 100,
                          diameterRatio: 3,
                          controller: _fixedController,
                          physics: FixedExtentScrollPhysics(),
                          //clipBehavior: Clip.hardEdge,
                          //offAxisFraction: 0.8,
                          squeeze: 0.9,
                          restorationId: '1',
                          //renderChildrenOutsideViewport: true,
                          //scrollBehavior: ScrollBehavior(),
                          //perspective: 0.01,
                          overAndUnderCenterOpacity: 0.6,
                          useMagnifier: true,
                          magnification: 1.5,
                          onSelectedItemChanged: (index){
                            setState(() {
                              indexList = index;
                              // if(_fixedController.selectedItem == index){
                              //   isSelected = true;
                              // }else{
                              //   isSelected = false;
                              // }
                            });
                            //_fixedController.jumpToItem(index);
                          },
                          children: [
                            CardTime(
                              title: 'prayetime.pray.sunrise'.tr() ,
                              isSelected:  indexList == 0?true:false,
                              time: syurukTime 
                              //intl.DateFormat.jm().format(
                                //PrayerGlobalVariables.NextPrayersunrise).toString()
                            ),
                            CardTime(
                              title: 'prayetime.pray.dhuhr'.tr() ,
                              isSelected: indexList == 1?true:false,
                              time: zohorTime
                            ),
                            CardTime(
                              title: 'prayetime.pray.asr'.tr(),
                              isSelected: indexList == 2?true:false,
                              time: asarTime
                            ),
                            CardTime(
                              title: 'prayetime.pray.maghrib'.tr() ,
                              isSelected: indexList == 3?true:false,
                              time: maghribTime
                            ),
                            CardTime(
                              title: 'prayetime.pray.isha'.tr() ,
                              isSelected: indexList == 4?true:false,
                              time: ishaTime
                            ),
                            CardTime(
                              title: 'prayetime.pray.fajer'.tr() ,
                              isSelected: indexList == 5?true:false,
                              time: fajerTime
                            ),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: 100.0.h*0.2,
                      left: -5.0.h,
                      child:LightSunMoon(
                        indexList: indexList,
                      )
                    ),

                    Positioned(
                      top: 100.0.h*0.013,
                      left: 18.0.w,
                      child: Container(
                        height: 25.0.h,
                        width: 0.5.w,
                        color: Colors.white10,                      
                      ),
                    ),
                    Positioned(
                      top: 100.0.h*0.45,
                      left: 18.0.w,
                      child: Container(
                        height: 25.0.h,
                        width: 0.5.w,
                        color: Colors.white10,                      
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}