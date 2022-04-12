import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:adhan/adhan.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:location/location.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/bloc/pray_writ_json.dart';
import 'package:rudaelmoslem/constants/staticVirable.dart';
import 'package:rudaelmoslem/models/jakim_esolat_model.dart';
import 'package:rudaelmoslem/notificationUtil/alarm_notifier.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/services/location.dart';
import 'package:rudaelmoslem/settings/prayer_setting.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';
import 'dart:io';



class CaedTime extends StatefulWidget {


  

  @override
  _CaedTimeState createState() => _CaedTimeState();
}

class _CaedTimeState extends State<CaedTime> {

  final location = new Location();
  String? locationError;
  var simplePeriodicTask = "simplePeriodicTask";
  final   EVENTS_KEY = "fetch_events";
  PrayerSetting? prayerSetting;
  int minutes =0;
  int hours = 0;
  int seconds = 0;
  late Timer timer ;
  Duration duration = Duration();
  String? nextPrayer = 'Fajer';
  String currntePrayer = '';

  var endTime = DateTime.now().millisecondsSinceEpoch +100 *30;
  final CustomTimerController _controllTimer = CustomTimerController();

  int _status = 0;
   
 


  Future<LocationData?> getLocationData() async {
    var _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    var _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    return await location.getLocation();
  }

  // Future<void> initPlatformState() async {
  //   try {

  //      var status = await BackgroundFetch.configure(BackgroundFetchConfig(
  //       minimumFetchInterval: 23,
  //       /*
  //       forceAlarmManager: false,
  //       stopOnTerminate: false,
  //       startOnBoot: true,
  //       enableHeadless: true,
  //       requiresBatteryNotLow: false,
  //       requiresCharging: false,
  //       requiresStorageNotLow: false,
  //       requiresDeviceIdle: false,
  //       requiredNetworkType: NetworkType.NONE,
  //        */
  //     ), _onBackgroundFetch, _onBackgroundFetchTimeout);

  //     setState(() {
  //       _status = status;
  //     });
      
  //   } catch (e) {
  //   }
  // }

  // void _onBackgroundFetch(String taskId) async {
  //   //var prefs = await SharedPreferences.getInstance();
  //   //var timestamp = DateTime.now();
  //   // This is the fetch-event callback.
  //   print("[BackgroundFetch] Event received: $taskId");
  //   // setState(() {
  //   //   _events.insert(0, "$taskId@${timestamp.toString()}");
  //   // });
  //   // Persist fetch events in SharedPreferences
  //   //prefs.setString(EVENTS_KEY, jsonEncode(_events));

  //   if (taskId == "flutter_background_fetch") {
  //     // Schedule a one-shot task when fetch event received (for testing).
  //     /*
  //     BackgroundFetch.scheduleTask(TaskConfig(
  //         taskId: "com.transistorsoft.customtask",
  //         delay: 5000,
  //         periodic: false,
  //         forceAlarmManager: true,
  //         stopOnTerminate: false,
  //         enableHeadless: true,
  //         requiresNetworkConnectivity: true,
  //         requiresCharging: true
  //     ));
  //      */
  //   }
  //   // IMPORTANT:  You must signal completion of your fetch task or the OS can punish your app
  //   // for taking too long in the background.
  //   BackgroundFetch.finish(taskId);
  // }

  // /// This event fires shortly before your task is about to timeout.  You must finish any outstanding work and call BackgroundFetch.finish(taskId).
  // void _onBackgroundFetchTimeout(String taskId) {
  //   print("[BackgroundFetch] TIMEOUT: $taskId");
  //   BackgroundFetch.finish(taskId);
  // }



  
  @override
  void initState() {
    super.initState();
    //initPlatformState();
    prayerSetting = PrayerSetting();
   startTimer();
   

  }

  @override
  void dispose() {
   timer.cancel();
    _controllTimer.dispose();
    // _controllerKey.dispose();
    // _controllerValue.dispose();
    super.dispose();
  }

 timerStart(){
   timer = Timer.periodic(Duration(seconds: 1), (timer) => startTimer());
 }

  void startTimer()async{
   // Workmanager().registerPeriodicTask('1', 'simplePeriodicTask',);
   
    var time = DateTime.now();
    final DateComponents dateComponents = DateComponents(time.year, time.month, time.day);
    var p = PrayerSetting.getTodayTimes(dateComponents);
     setState(() {
      PrayerSetting.getNextPrayer(p.nextPrayer(),p);  
      hours = PrayerGlobalVariables.NextPrayerHoure;
      minutes = PrayerGlobalVariables.NextPrayerMinutes;
      seconds = PrayerGlobalVariables.NextPrayerSeconds;
      nextPrayer = PrayerGlobalVariables.getPrayerName( PrayerGlobalVariables.NextPrayerName);
      currntePrayer = PrayerGlobalVariables.getPrayerName( PrayerGlobalVariables.CurrentPrayer);
       //_controllTimer.start();
    });
    //print(PrayerGlobalVariables.NextPrayerHoure);
    //print(PrayerGlobalVariables.NextPrayerMinutes);
    //_controllTimer.start();
  }


  @override
  Widget build(BuildContext context) {
    Locale  locale = Localizations.localeOf(context);
    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return Container(
          //height: 100.h < 600? 20.0.h:50.0.h,
          padding: EdgeInsets.symmetric(horizontal: 5.0.w,vertical: 1.0.h),
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                             //Workmanager().registerPeriodicTask('1', 'simplePeriodicTask',);
                             //context.setLocale(context.supportedLocales[0]);
                             //context.deviceLocale
                             
                            },
                            child: Container(
                              height: 5.0.h,
                              width: 5.0.h,
                              decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Icon(CupertinoIcons.info,
                              color: Colors.white,
                            ),
                            ),
                          ),
                          SizedBox(width: 2.0.w,),
                          Container(
                            child: Text(
                              
                              'homepage.mute'.tr(),
                              style:  value.themeMode == ThemeMode.dark?Theme.of(context).textTheme.headline5:
                              Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.0.h,),
                      Container(
                        child: Text(
                          //'',
                          'homepage.${currntePrayer}'.tr(),
                          style: value.themeMode == ThemeMode.dark?Theme.of(context).textTheme.headline4:
                              Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 1.0.h,),
                       Container(
                        child: CustomTimer(
                           controller: _controllTimer,
                           from: Duration( hours: hours ,minutes: minutes,seconds: seconds),
                           to: Duration( hours: 0,minutes: 0),
                           onBuildAction: CustomTimerAction.auto_start,
                           builder: (CustomTimerRemainingTime remaing){
                             return Text(
                               "${remaing.hours} : ${remaing.minutes} : ${remaing.seconds}",
                              textDirection:  TextDirection.ltr,
                              style: value.themeMode == ThemeMode.dark?Theme.of(context).textTheme.overline:
                              Theme.of(context).textTheme.overline!.copyWith(color: Colors.white),
                            );
                          },
                          onFinish: (){
                            startTimer();
                            _controllTimer.start();
                          },
                         )
                       ),
                      SizedBox(height: 1.0.h,),
                      Container(
                        child: Text(
                          'homepage.nextslahtime'.tr(namedArgs: {'hours':'${hours}','minutes':'${minutes}'})
                          + 'homepage.${nextPrayer}'.tr(),
                          //textDirection: TextDirection.ltr,
                          style: locale.countryCode == 'EG'?
                              value.themeMode == ThemeMode.dark?Theme.of(context).textTheme.headline5:
                              Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white):
                              value.themeMode == ThemeMode.dark?Theme.of(context).textTheme.headline6:
                              Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Text(
              //              minutes.toString(),
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 30.0.sp,
              //               fontWeight: FontWeight.bold
              //             ),
              //           ),

              Flexible(
                flex: 1,
                //right: 0,
                //bottom: 0.5.h,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/svg/mosque (3).svg',//mosque (3)
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}