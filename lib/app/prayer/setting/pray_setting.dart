import 'package:app_settings/app_settings.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:restart_app/restart_app.dart';
import 'package:rudaelmoslem/constants/constants.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/provider/settingsProvider.dart';
import 'package:rudaelmoslem/settings/NotificationSettingPage.dart';
import 'package:rudaelmoslem/settings/troubleshoot_notif.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/utilts/cupertinoSwitchListTile.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';
import 'package:rudaelmoslem/widget/debug_widgets.dart';

class PraySettings extends StatefulWidget {
  PraySettings({Key? key}) : super(key: key);

  @override
  _PraySettingsState createState() => _PraySettingsState();
}

class _PraySettingsState extends State<PraySettings> {
  MyNotificationType _type =
      MyNotificationType.values[GetStorage().read(kNotificationType)];
      
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
        builder: (context, value, child) {
        return Scaffold(
          body:  Container(
            child: Column(
              //direction: Axis.vertical,
              children: [
                Container(
                  height: 10.0.h,
                  width: 100.0.w,
                  //color: Colors.black12,
                  alignment: Alignment.center,
                  child: Text(
                    'prayetime.setting.title'.tr(),
                    style: Theme.of(context).textTheme.headline1
                  ),
                ),
                Expanded(
                  child: Consumer<SettingProvider>(
                     builder: (context, setting, child) {
                       return ListView(
                         padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                         physics: BouncingScrollPhysics(),
                         children: [

                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 3.0.w,vertical: 1.0.h),
                              child: Text(
                                'prayetime.setting.department.item1.title'.tr(),
                                style: Theme.of(context).textTheme.headline5,
                              )),
                            buildTimeFormat(setting),
                            SizedBox(height: 2.0.h),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 3.0.w,vertical: 1.0.h),
                              child: Text(
                                'prayetime.setting.department.item2.title'.tr(),
                                style: Theme.of(context).textTheme.headline5,
                              )),
                            buildAzanSetting(context,setting),
                            SizedBox(height: 2.0.h),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 3.0.w,vertical: 1.0.h),
                              child: Text(
                                'prayetime.setting.department.item3.title'.tr(),
                                style: Theme.of(context).textTheme.headline5,
                              )),
                              Column(children: buildNotificationSetting(context),),
                            SizedBox(height: 1.0.h),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 3.0.w,vertical: 1.0.h),
                              child: Text(
                                'prayetime.setting.department.item3.contant.systemsetting.troubleshooting'.tr(),
                                style: Theme.of(context).textTheme.headline5,
                              )),
                            buildtroubleshootingSetting(),
                            SizedBox(height: 2.0.h),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 3.0.w,vertical: 1.0.h),
                              child: Text(
                                'prayetime.setting.department.item3.contant.systemsetting.advtroubleshooting'.tr(),
                                style: Theme.of(context).textTheme.headline5,
                              )),
                            buildadvancedtroubleshootingSetting(),
                            SizedBox(height: 2.0.h),
                            reschedulingnotification(),
                            SizedBox(height: 5.0.h),
                         ],
                       );
                     }
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  //----------------------------------------------------------
  buildtroubleshootingSetting(){
    return  Card(
      child: ListTile(
        title:  Text(
          'prayetime.setting.department.item3.contant.systemsetting.fix1'.tr(),
          style: Theme.of(context).primaryTextTheme.headline5,
          ),
        subtitle:  Text(
          'prayetime.setting.department.item3.contant.systemsetting.fix2'.tr(),
          style: Theme.of(context).primaryTextTheme.headline5,
          ),
        onTap: () { 
          showDialog(
            context: context,
            builder: (BuildContext context){
              return buildtroubleshootingSettingDialog();
            });
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (_) => const TroubleshootNotif(),
          //   ));
        }
      ),
    );
  }

  buildadvancedtroubleshootingSetting(){
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: CupertinoSwitchListTile(
            activeColor: Theme.of(context).primaryColor,
            title:  Text(
              'prayetime.setting.department.item3.contant.systemsetting.Limit'.tr(),
              style: Theme.of(context).primaryTextTheme.headline5,
              ),
            subtitle:  Text(
                'prayetime.setting.department.item3.contant.systemsetting.experiencing'.tr(),
                style: Theme.of(context).primaryTextTheme.headline5,
                ),
            value: GetStorage().read(kStoredNotificationLimit),
            onChanged: (value) {
              setState(() {
                GetStorage().write(kStoredNotificationLimit, value);
              });
            }),
      ),
    );
  }

  buildtroubleshootingSettingDialog(){
    return Dialog(
      //elevation: 50.0,
      child:   Container(
        height: 65.0.h,
        width: 85.0.w,
        padding: EdgeInsets.symmetric(horizontal: 3.0.w,vertical: 2.0.h),
        child: Consumer<ThemeController>(
            builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text.rich(
                  TextSpan(
                    style: value.themeMode ==ThemeMode.dark? Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Theme.of(context).primaryColor,fontSize: 10.0.sp,fontWeight:FontWeight.w700):
                    Theme.of(context).textTheme.subtitle2,
                    children: [
                      TextSpan(
                        text:  'prayetime.setting.department.item3.contant.systemsetting.installed.text1'.tr(),
                        ),
                      TextSpan(
                          text: 'prayetime.setting.department.item3.contant.systemsetting.installed.text2'.tr(),
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: 'prayetime.setting.department.item3.contant.systemsetting.installed.text3'.tr(),
                        ),
                      TextSpan(
                          text: 'prayetime.setting.department.item3.contant.systemsetting.installed.text4'.tr(),
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'prayetime.setting.department.item3.contant.systemsetting.installed.text5'.tr(),
                              ),
                    ],
                  ),
                ),
                 SizedBox(height: 1.0.h),
                 Text.rich(
                  TextSpan(
                    style: value.themeMode ==ThemeMode.dark? Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Theme.of(context).primaryColor,fontSize: 10.0.sp,fontWeight:FontWeight.w700):
                    Theme.of(context).textTheme.subtitle2,
                    children: [
                      TextSpan(
                        text: 'prayetime.setting.department.item3.contant.systemsetting.installed.text6'.tr(),
                        ),
                      TextSpan(
                          text: 'prayetime.setting.department.item3.contant.systemsetting.installed.text7'.tr(),
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'prayetime.setting.department.item3.contant.systemsetting.installed.text8'.tr(),
                              ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Card(
                  color: value.themeMode ==ThemeMode.dark? Theme.of(context).cardTheme.color:
                  Color(0xffCDD2ED),
                  child: ListTile(
                    title:  Text(
                      'prayetime.setting.department.item3.contant.systemsetting.installed.text9'.tr(),
                      style: value.themeMode ==ThemeMode.dark? Theme.of(context).textTheme.headline5!.copyWith(
                      color: Theme.of(context).primaryColor,):
                    Theme.of(context).textTheme.headline5,
                      ),
                    onTap: () => AppSettings.openAppSettings(),
                    trailing:  Icon(
                      Icons.launch_rounded,
                      color:  value.themeMode ==ThemeMode.dark? Theme.of(context).primaryColor:
                      Theme.of(context).primaryColor,
                      ),
                  ),
                ),
                 Text(
                  'prayetime.setting.department.item3.contant.systemsetting.installed.text10'.tr(),
                  style: value.themeMode ==ThemeMode.dark? Theme.of(context).textTheme.headline5!.copyWith(
                      color: Theme.of(context).primaryColor,):
                    Theme.of(context).textTheme.headline5,
                ),
                TextButton(
                    onPressed: () {
                      // LaunchUrl.normalLaunchUrl(
                      //     url:
                      //         'https://telegra.ph/Notification-didnt-show-on-some-devices-07-31');
                    },
                    child:
                         Text(
                           'prayetime.setting.department.item3.contant.systemsetting.installed.text11'.tr(),
                           ))
              ],
            );
          }
        ),
      ),
      
      
    );
  }
  reschedulingnotification(){
    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return Card(
          child: ListTile(
            title:  Text(
              'prayetime.setting.department.item3.contant.systemsetting.Force'.tr(),
              style:  Theme.of(context).primaryTextTheme.headline5,
              ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    //elevation: 50.0,
                    content:  Text(
                      'prayetime.setting.department.item3.contant.systemsetting.rescheduled'.tr(),
                      style: value.themeMode == ThemeMode.dark? Theme.of(context).primaryTextTheme.headline5!.copyWith(
                        color: Theme.of(context).primaryColor):
                      Theme.of(context).primaryTextTheme.headline5,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child:  Text(
                         'prayetime.setting.department.item3.contant.systemsetting.cancel'.tr(),
                          style:value.themeMode == ThemeMode.dark? Theme.of(context).primaryTextTheme.headline5!.copyWith(
                            color: Theme.of(context).primaryColor):
                          Theme.of(context).primaryTextTheme.headline5,
                          ),
                      ),
                      TextButton(
                        onPressed: () {
                          GetStorage().write(kForceUpdateNotif, true);
                          Restart.restartApp();
                        },
                        child:  Text(
                          'prayetime.setting.department.item3.contant.systemsetting.proceed'.tr(),//cancel
                           style: value.themeMode == ThemeMode.dark? Theme.of(context).textTheme.headline5!.copyWith(
                              color: Theme.of(context).primaryColor):
                            Theme.of(context).textTheme.headline5,
                          ),
                      )
                    ],
                  );
                },
              );
            },
          ),
        );
      }
    );
  }

  List<Widget> buildNotificationSetting(BuildContext context) {
    //Text('prayetime.setting.department.item3.contant.title'.tr())
    return  [
        Card(
          child: Column(
            //shrinkWrap: true,
            children: [
              RadioListTile(
                  value: MyNotificationType.noazan,
                  groupValue: _type,
                  title:  Text(
                    'prayetime.setting.department.item3.contant.settingsound.sound1'.tr(),
                    style: Theme.of(context).primaryTextTheme.headline5,
                    ),
                  onChanged: (MyNotificationType? type) {
                    setState(() => _type = type!);
                  }),
              RadioListTile(
                  value: MyNotificationType.azan,
                  groupValue: _type,
                  title:  Text(
                    'prayetime.setting.department.item3.contant.settingsound.sound2'.tr(),
                    style: Theme.of(context).primaryTextTheme.headline5,
                    ),
                  onChanged: (MyNotificationType? type) {
                    setState(() => _type = type!);
                  }),
              Builder(builder: (context) {
                if (_type !=
                    MyNotificationType
                        .values[GetStorage().read(kNotificationType)]) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Spacer(),
                        Text(
                          'prayetime.setting.department.item3.contant.settingsound.detected'.tr(),         
                          style:  Theme.of(context).primaryTextTheme.headline5,
                        ),
                        Spacer(),
                        ElevatedButton(
                            onPressed: () {
                              GetStorage().write(kForceUpdateNotif, true);
                              GetStorage()
                                  .write(kNotificationType, _type.index);
                              Restart.restartApp();
                            },
                            child:  Text(
                              'prayetime.setting.department.item3.contant.settingsound.restartapp'.tr(),
                              style: Theme.of(context).textTheme.headline6,
                              )),
                              Spacer()
                      ],
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
            ],
          )
        ),
        Card(
          child: ListTile(
            title:  Text(
              'prayetime.setting.department.item3.contant.systemsetting.appnotification'.tr(),
              style: Theme.of(context).primaryTextTheme.headline5,
            ),
            isThreeLine: true,
            subtitle:  Text(
                'prayetime.setting.department.item3.contant.systemsetting.ditil'.tr(),
                style: Theme.of(context).primaryTextTheme.headline5,
                ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.launch_rounded),//-----------------------------
              ],
            ),
            onTap: () async {
              await AppSettings.openNotificationSettings();
            },
          ),
        ),
      ];
  }

   buildAzanSetting(BuildContext context,SettingProvider setting) {
    return Column(
      children: [
        Card(
          child: ListTile(
            title:  Text('prayetime.setting.department.item2.contant.title2'.tr(),
            style: Theme.of(context).primaryTextTheme.headline5,),
            trailing: DropdownButton(
              icon: const Padding(
                padding: EdgeInsets.all(4.0),
                child: FaIcon(FontAwesomeIcons.caretDown, size: 13),
              ),
              items: <String>['azan_hejaz2013_fajr', 'azan_kurdhi2010']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,),//---------
                );
              }).toList(),
              onChanged: (String? newValue) {
                setting.azanSoundName = newValue;
              },
              value: setting.azanSoundName ,
            ),
          ),
        ),
      ],
    );
  }


   Card buildTimeFormat(SettingProvider setting) {
    return Card(
      child: ListTile(
        title:  Text('prayetime.setting.department.item1.contant.title1'.tr(),
        style: Theme.of(context).primaryTextTheme.headline5,),
        trailing: DropdownButton(
          icon: const Padding(
            padding: EdgeInsets.all(4.0),
            child: FaIcon(FontAwesomeIcons.caretDown, size: 13),
          ),
          items: <String>['12 hour', '24 hour']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) =>
              setting.use12hour = (newValue == '12 hour'),
          value: setting.use12hour! ? '12 hour' : '24 hour',
        ),
      ),
    );
  }
}