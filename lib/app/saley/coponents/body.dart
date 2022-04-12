import 'dart:math';

import 'package:azan_local_notifications/azan_local_notifications.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/app/saley/coponents/page2.dart';
import 'package:rudaelmoslem/constants/constants.dart';
import 'package:rudaelmoslem/notificationUtil/notifications_helper.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

import 'page1.dart';
import 'page3.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  final _pageDecoration = PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
    bodyTextStyle: TextStyle(fontSize: 19.0),
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    imagePadding: EdgeInsets.all(8.0),
  );
  bool _isDoneSetLocation = false;
  AnimationController? _animController;
  late PageController _pageController;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    _animController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    scrollController = ScrollController();
    //Workmanager().initialize(callbackDispatcher,isInDebugMode: true);
  }

  // void callbackDispatcher() {
  //   print("callbackDispatcher");
  //   //Workmanager().executeTask((task, inputData) {
  //     return Future.value(true);
  //   });
  // }

  List<Widget> _pages = [
    Page1(),
    Page2(),
    Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(builder: (context, value, child) {
      return IntroductionScreen(
        rawPages: _pages,
        color: ColorUtil.minColor1,
        dotsDecorator: DotsDecorator(
          activeColor: ColorUtil.minColor1,
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Text('Next', style: TextStyle(fontWeight: FontWeight.w600)),
        curve: Curves.fastLinearToSlowEaseIn,
        scrollController: scrollController,
        onDone: () async {
          String sound = GetStorage().read(kSalySourceSound);
          int time = GetStorage().read(kSalyMinetRemnd);
          String timetype = GetStorage().read(kSalyMinetRemndtimeType);

          await periodiSingleSalyNotification(
            id: 55,
            name: 'name',
            body: 'salyapp.page2.soundName.0'.tr(),
            title: 'salyapp.page2.soundName.4'.tr(),
            customSound: sound,
            summary: 'صلى علي النبي',
            time: time,
            timetype: timetype,
          );

          Navigator.pushReplacementNamed(
            context,
            '/home',
          );
        },
      );
    });
  }

  Future<void> animateScroll(double page) async {
    //setState(() => _isScrolling = true);
    await scrollController.animateTo(
      max(min(page, _pages.length - 1), 0),
      duration: Duration(milliseconds: 350),
      curve: Curves.easeIn,
    );
    // await _pageController.animateToPage(
    //   max(min(page, _pages.length - 1), 0),
    //   duration: Duration(milliseconds: 350),
    //   curve: Curves.easeIn,
    // );
    // if (mounted) {
    //   setState(() => _isScrolling = false);
    // }
  }

  Future scheduleSingleSalyNotificationss() async {
    var androidDetails = new AndroidNotificationDetails("582", "saly5ns",
        channelDescription: "This is my channel",
        importance: Importance.defaultImportance);
    var iSODetails = new IOSNotificationDetails();
    var notificationDetails =
        new NotificationDetails(android: androidDetails, iOS: iSODetails);
    AzanLocalNotificationsPlugin().periodicallyShow(6262, 'title5Saly', 'body',
        RepeatInterval.everyMinute, notificationDetails,
        androidAllowWhileIdle: true);
  }

  Future<void> periodiSingleSalyNotification(
      //for main prayer functionality
      {required String name,
      required int id,
      required String title,
      required String body,
      required int time,
      required String timetype,
      //required tz.TZDateTime scheduledTime,
      required String customSound,
      String? summary}) async {
    BigTextStyleInformation styleInformation =
        BigTextStyleInformation(body, summaryText: summary);
    var androidSpecifics = AndroidNotificationDetails(
      '$name saly id', // This specifies the ID of the Notification
      '$name saly notification', // This specifies the name of the notification channel
      channelDescription:
          'Scheduled daily prayer saly', //This specifies the description of the channel
      priority: Priority.max,
      importance: Importance.high,
      styleInformation: styleInformation,
      // when: scheduledTime.millisecondsSinceEpoch,
      playSound: true,
      sound: RawResourceAndroidNotificationSound(customSound),
      color: const Color(0xFF19e3cb),
    );
    var iOSSpecifics = const IOSNotificationDetails();
    var platformChannelSpecifics =
        NotificationDetails(android: androidSpecifics, iOS: iOSSpecifics);

    await AzanLocalNotificationsPlugin().periodicallyShow(
      id,
      title,
      body,
      perioditimetype(time, timetype),
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
    );
    // This literally schedules the notification
    //print(name);
    // uiLocalNotificationDateInterpretation:
    // UILocalNotificationDateInterpretation
    //     .absoluteTime
  }

  RepeatInterval perioditimetype(time, type) {
    if (type == 'm') {
      switch (time) {
        case 5:
          return RepeatInterval.everyMinute;
        case 10:
          return RepeatInterval.everyMinute;
        //break;
        case 15:
          return RepeatInterval.everyMinute;
        //break;
        case 20:
          return RepeatInterval.everyMinute;
        //break;
        case 30:
          return RepeatInterval.everyMinute;
        //break;
        case 40:
          return RepeatInterval.everyMinute;
        //break;
        case 50:
          return RepeatInterval.everyMinute;
        //break;
        default:
          return RepeatInterval.everyMinute;
      }
    } else if (type == 'h') {
      switch (time) {
        case 1:
          return RepeatInterval.hourly;
        //break;
        case 2:
          return RepeatInterval.hourly;
        //break;
        case 4:
          return RepeatInterval.hourly;
        //break;
        case 6:
          return RepeatInterval.hourly;
        //break;
        case 12:
          return RepeatInterval.hourly;
        //break;
        default:
          return RepeatInterval.hourly;
      }
    }
    return RepeatInterval.everyMinute;
  }
}
