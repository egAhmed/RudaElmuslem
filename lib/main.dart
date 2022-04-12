//import 'package:android_alarm_manager/android_alarm_manager.dart';

import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:huawei_ads/adslite/hw_ads.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/locationUtil/locationDatabase.dart';
import 'package:rudaelmoslem/models/alarm/prayer_time.dart';
import 'package:rudaelmoslem/notificationUtil/alarm_notifier.dart';
import 'package:rudaelmoslem/notificationUtil/notifications_helper.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/provider/updater_provider.dart';
import 'package:rudaelmoslem/settings/NotificationSettingPage.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/theme/dark_theme.dart';
import 'package:rudaelmoslem/theme/light_theme.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:rudaelmoslem/constants/constants.dart';
import 'package:rudaelmoslem/provider/drawer_provider.dart';
import 'package:rudaelmoslem/provider/location_provider.dart';
import 'package:rudaelmoslem/provider/settingsProvider.dart';
import 'package:rudaelmoslem/routes_manage.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:ui' as ui;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await GetStorage.init();

  await Firebase.initializeApp();

  await MobileAds.instance.initialize();

  // await FCMConfig.instance.init(
  //   defaultAndroidForegroundIcon: '@mipmap/ic_launcher', //default is @mipmap/ic_launcher
  //   defaultAndroidChannel: AndroidNotificationChannel(
  //     'high_importance_channel',// same as value from android setup
  //     'Fcm config',
  //     importance: Importance.high,
  //     sound: RawResourceAndroidNotificationSound('saly2'),
  //   )
  // );

  await _configureLocalTimeZone();
  await initNotifications();
  // requestIOSPermissions(notifsPlugin);

  //await AndroidAlarmManager.initialize(); //--------

  initGetStorage();
  //readAllGetStorage

  try {
    await HwAds.init();
  } catch (e) {}

  /// Increment app launch counter
  GetStorage().write(kAppLaunchCount, GetStorage().read(kAppLaunchCount) + 1);

  migrateLocationIndexToLocationCode();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  runApp(DevicePreview(
      enabled: true,
      builder: (context) => EasyLocalization(
            child: MyApp(),
            supportedLocales: MyApp.List,
            path: 'assets/translations',
            useOnlyLangCode: true,
          )));

  showReviewPrompt();

  // Register to receive BackgroundFetch events after app is terminated.
  // Requires {stopOnTerminate: false, enableHeadless: true}
  //BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
}

class MyApp extends StatefulWidget {
  static const List = [
    Locale('ar', 'EG'),
    Locale('en', 'US'),
  ];

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final windowLocale = ui.window.locale;
  late Locale locale;

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    configureSelectNotificationSubject();

    try {
      final firts = MyApp.List.firstWhere(
          (l) => l.languageCode == windowLocale.languageCode);
      locale = firts != null ? firts : Locale('ar', 'EG');
    } catch (e) {}

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: DrawerMenuProvider()),
        ChangeNotifierProvider.value(value: PrayerTimeAlarm()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => SettingProvider()),
        ChangeNotifierProvider(create: (_) => ThemeController()),
        ChangeNotifierProvider(
          create: (_) => AlarmNotifier(),
        ),
        ChangeNotifierProvider(create: (_) => UpdaterProvider()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return Consumer<ThemeController>(builder: (context, value, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                EasyLocalization.of(context)!.delegate,
              ],
              locale: locale,
              supportedLocales: EasyLocalization.of(context)!.supportedLocales,
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocales in supportedLocales) {
                  if (supportedLocales.languageCode == locale!.languageCode &&
                      supportedLocales.countryCode == locale.countryCode) {
                    return supportedLocales;
                  }
                }
                return supportedLocales.first;
              },
              navigatorObservers: [
                FirebaseAnalyticsObserver(analytics: analytics),
              ],
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: value.themeMode,
              initialRoute: '/',
              onGenerateRoute: RoutesManage.routes,
            );
          });
        },
      ),
    );
  }
}

// /// This "Headless Task" is run when app is terminated.
// void backgroundFetchHeadlessTask(HeadlessTask task) async {

//   var taskId = task.taskId;
//   var timeout = task.timeout;

//   if (timeout) {
//     print("[BackgroundFetch] Headless task timed-out: $taskId");
//     BackgroundFetch.finish(taskId);
//     return;
//   }

//   if (taskId == 'flutter_background_fetch') {
//     /* DISABLED:  uncomment to fire a scheduleTask in headlessTask.
//     BackgroundFetch.scheduleTask(TaskConfig(
//         taskId: "com.transistorsoft.customtask",
//         delay: 5000,
//         periodic: false,
//         forceAlarmManager: false,
//         stopOnTerminate: false,
//         enableHeadless: true
//     ));
//      */
//   }
//   BackgroundFetch.finish(taskId);
// }

void migrateLocationIndexToLocationCode() {
  var storedIndex = GetStorage().read(kStoredGlobalIndex);
  if (storedIndex != null) {
    GetStorage().write(
        kStoredLocationJakimCode, LocationDatabase.getJakimCode(storedIndex));
    GetStorage().remove(
        kStoredGlobalIndex); // delete this key so it will never be used again
  }
}

void initGetStorage() {
  // init default settings
  GetStorage _get = GetStorage();
  _get.writeIfNull(kNotificationType, MyNotificationType.azan.index);

  _get.writeIfNull(kBookmarkSurah, 0);
  _get.writeIfNull(kBookmarkSurahName, 'الفاتحة');
  _get.writeIfNull(kBookmarkSurahNum, 1);

  _get.writeIfNull(kShowNotifPrompt, true);
  _get.writeIfNull(kAppLaunchCount, 0);
  _get.writeIfNull(kIsFirstRun, true);
  _get.writeIfNull(kStoredLocationJakimCode, 'WLY01');
  _get.writeIfNull(kStoredTimeIs12, true);
  _get.writeIfNull(kStoredShowOtherPrayerTime, false);

  _get.writeIfNull(kStoredShouldUpdateNotif, true);
  _get.writeIfNull(kStoredLastUpdateNotif, 0);

  _get.writeIfNull(kStoredNotificationLimit, false);
  _get.writeIfNull(kIsDebugMode, false);
  _get.writeIfNull(kForceUpdateNotif, false);

  _get.writeIfNull(kDiscoveredDeveloperOption, false);
  _get.writeIfNull(kLocationCountry, 'Aswan');
  _get.writeIfNull(kSharingFormat, 0);
  _get.writeIfNull(kFontSize, 14.0);
  _get.writeIfNull(kHijriOffset, -1);
  _get.writeIfNull(kCalculationMethod, "egyptian");
  _get.writeIfNull(kCalculationMethodMadhab, 'hanafi');
  _get.writeIfNull(kLocationLatitude, 24.19159374665469);
  _get.writeIfNull(kLocationlongitude, 32.88120534271002);

  _get.writeIfNull(kJsonCacheCheck, false);

  _get.writeIfNull(kthemeMode, 'light');

  _get.writeIfNull(kAzanSoundName, 'azan_hejaz2013_fajr');

  _get.writeIfNull(kSalyMinetRemnd, 5);
  _get.writeIfNull(kSalyMinetRemndtimeType, 'm');
  _get.writeIfNull(kSalyMinetRemnditem, 0);
  _get.writeIfNull(kSalySounditem, 0);
  _get.writeIfNull(kSalySourceSound, 'saly5');
}

Future<void> _configureLocalTimeZone() async {
  // use for notification
  tz.initializeTimeZones();
  DateTime dateTime = DateTime.now();
  final String currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
  var locations = tz.timeZoneDatabase.locations;
  final timeZoneName = tz.getLocation(currentTimeZone);
  tz.setLocalLocation(timeZoneName);
  //print(timeZoneName);
}

// ignore_for_file: avoid_print
void readAllGetStorage() {
  // print (almost) all GetStorage item to the console
  print("-----All GET STORAGE-----\n");

  var keys = GetStorage().getKeys();

  for (var key in keys) {
    print('$key ${GetStorage().read(key)}');
  }
  print('-----------------------\n');
}

/// Show InAppReview if all conditions are met
void showReviewPrompt() async {
  final InAppReview inAppReview = InAppReview.instance;

  int _appLaunchCount = GetStorage().read(kAppLaunchCount);

  if (_appLaunchCount == 10 && await inAppReview.isAvailable()) {
    await Future.delayed(const Duration(seconds: 2));
    inAppReview.requestReview();
  }
}
