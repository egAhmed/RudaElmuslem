import 'package:adhan/adhan.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/bloc/pray_writ_json.dart';
import 'package:rudaelmoslem/constants/constants.dart';
import 'package:rudaelmoslem/constants/staticVirable.dart';
import 'package:rudaelmoslem/models/jakim_esolat_model.dart';
import 'package:rudaelmoslem/notificationUtil/notifications_firebase.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/settings/NotificationSettingPage.dart';
import 'package:rudaelmoslem/settings/prayer_setting.dart';
import 'package:rudaelmoslem/straing_app.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/theme/font_style.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

class ScrnPortrait extends StatefulWidget {
  ScrnPortrait({Key? key}) : super(key: key);

  @override
  _ScrnPortraitState createState() => _ScrnPortraitState();
}

class _ScrnPortraitState extends State<ScrnPortrait> {
String notificationTitle = 'No Title';
  String notificationBody = 'No Body';
  String notificationData = 'No Data';
 bool showFirstChild = true;
  late bool _showNotifPrompt;

  @override
  void initState() {
    super.initState();
    // final firebaseMessaging = FCM();
    // firebaseMessaging.setNotifications();
    
    // firebaseMessaging.streamCtlr.stream.listen(_changeData);
    // firebaseMessaging.bodyCtlr.stream.listen(_changeBody);
    // firebaseMessaging.titleCtlr.stream.listen(_changeTitle);
     // notifi
    _showNotifPrompt = GetStorage().read(kShowNotifPrompt) &&
        GetStorage().read(kAppLaunchCount) > 5;
  }

  //en6qjFCMQzCoTrtQWeLlwY:APA91bEbquJrUNMR8QZxpKJH57em_BCtGqo--536o4W0LPPCUeZmoWBAIBPkfEmnzmgB06U2WNHICbI7rrBO_f6a7K52U1jh55SZZRM635R8UnGCDd8ukI6rzkuOTHwgGFRfk-eUjKpH

  // _changeData(String msg) => setState(() => notificationData = msg);
  // _changeBody(String msg) => setState(() => notificationBody = msg);
  // _changeTitle(String msg) => setState(() => notificationTitle = msg);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return Scaffold(
          //backgroundColor: Color(0xFF161C3E),
          /*Theme.of(context).brightness == Brightness.dark 0xff19152B
              ? Colors.grey[900]
              : Theme.of(context).primaryColor,*/
          body: Container(
            //color: Color(0xffEDEFF9),//.withOpacity(0.85),//0xff14181C
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height:30.0.h,
                    width: 100.0.w,
                    //color: Colors.amber,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'startscreen.titleApp_string'.tr(),
                          style: Theme.of(context).primaryTextTheme.headline1!.copyWith(fontFamily: 'Mada',),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 5.0.h,
                        ),
                        Container(
                          width: 90.0.w,
                          child: Text(
                            'startscreen.infoApp'.tr(),
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.0.h,),
                  Container(
                    height: 44.0.h,
                    child: Stack(
                      children: [

                        Card(
                          //color: Colors.white60,
                          color: value.themeMode == ThemeMode.dark?Theme.of(context).cardTheme.color:
                          Color(0xFF3F51B5),
                          child: Container(
                            height: 40.0.h,
                            width: 80.0.w,
                            // decoration: BoxDecoration(
                            //   color:ColorUtil.minColor1,
                            //   borderRadius: BorderRadius.circular(30),
                            // ),
                            child: Image.asset(
                              'assets/images/Pngtre.png'
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0.0.h,
                          left: 25.0.w,
                          child: Container(
                            height: 8.0.h,
                            width: 30.0.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color:  value.themeMode==ThemeMode.dark?Theme.of(context).primaryColor:
                               Theme.of(context).primaryColorLight,//Color(0xff939DD9),
                            ),
                           // margin: EdgeInsets.symmetric(vertical: 30,horizontal: 50),
                            child: InkWell(
                              onTap: (){
                                //AdhanProvider adhanProvider;
                                //adhanProvider.prayerSetting();
                                var time = DateTime.now();
                                final DateComponents dateComponents = DateComponents(time.year, time.month, time.day);
                                PrayerSetting.getTodayTimes(dateComponents);
                                var j = GetStorage().read(kJsonCacheCheck);


                                if(j == false || j == null){
                                  PrayWirtJson.writeJson();
                                }
                                

                                 showNotifPrompt(context);

                                //PrayerGlobalVariables.getPrayerTime();
                                GetStorage().read(kIsFirstRun)
                                ? Navigator.pushReplacementNamed(context, '/onefirst')
                                : Navigator.pushReplacementNamed(context, '/home');
                              },
                              child: Center(
                                child: Text(
                                  'startscreen.buttonTitle'.tr(),
                                  textAlign: TextAlign.center,
                                  style: value.themeMode==ThemeMode.dark?Theme.of(context).textTheme.headline1!.copyWith(fontFamily: 'Mada',):
                                  Theme.of(context).textTheme.headline1!.copyWith(fontFamily: 'Mada',color: Colors.white)
                                ),
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
        );
      }
    );
  }


  showNotifPrompt(BuildContext context) {
    if (_showNotifPrompt) {
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          content: Text(
            'Did notification(s) from this app shows at prayer time?',
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                setState(() {
                  showFirstChild = false;
                });
                Future.delayed(const Duration(seconds: 3))
                    .then((value) => setState(() {
                          _showNotifPrompt = false;
                          GetStorage().write(kShowNotifPrompt, false);
                        }));
              },
              child: const Text('Yes')),
          TextButton(
              style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            const NotificationPageSetting()));
              },
              child: const Text('No'))
          ],
        );
      }
    );
   }

    var show =  Builder(builder: (_) {
      if (_showNotifPrompt) {
        return AnimatedCrossFade(
          layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
            return Stack(
              clipBehavior: Clip.antiAlias,
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: bottomChild,
                  top: 0,
                  key: bottomChildKey,
                ),
                Positioned(
                  child: topChild,
                  key: topChildKey,
                )
              ],
            );
          },
          duration: const Duration(milliseconds: 200),
          crossFadeState: showFirstChild
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: Column(
            children: [
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Opacity(
                  opacity: 0.8,
                  child: Text(
                    'Did notification(s) from this app shows at prayer time?',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        setState(() {
                          showFirstChild = false;
                        });
                        Future.delayed(const Duration(seconds: 3))
                            .then((value) => setState(() {
                                  _showNotifPrompt = false;
                                  GetStorage().write(kShowNotifPrompt, false);
                                }));
                      },
                      child: const Text('Yes')),
                  TextButton(
                      style: TextButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    const NotificationPageSetting()));
                      },
                      child: const Text('No'))
                ],
              )
            ],
          ),
          secondChild: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Opacity(
              opacity: 0.8,
              child: Text(
                'Cool. Glad to hear that!',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      } else {
        return const SizedBox(height: 10);
      }
    });
  }
  
}