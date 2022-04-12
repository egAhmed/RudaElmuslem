import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:rudaelmoslem/constants/staticVirable.dart';
import 'package:rudaelmoslem/services/location.dart';
import 'package:rudaelmoslem/utilts/alarm/constants.dart';
import 'package:rudaelmoslem/utilts/alarm/functions.dart';
import 'alarm.dart';

// This is a Singleton class, meaning only one object
// can be created from this class. If another object is
// initialized, the first object instance would be returned.
class PrayerTimeAlarm extends ChangeNotifier {
  // singleton
  static final PrayerTimeAlarm _prayerTime = PrayerTimeAlarm._internal();

  factory PrayerTimeAlarm() {
    instance++;
    return _prayerTime;
  }

  PrayerTimeAlarm._internal(); // private constructor

  static int instance = 0;

  late LocationAlarm location;
 // NetworkHelper timeNetworkHelper;
  // dynamic weatherData;

  List<Alarm> _alarms = [
    Alarm(name: 'Fajr'),
    Alarm(name: 'Dhuhr'),
    Alarm(name: 'Asr'),
    Alarm(name: 'Maghrib'),
    Alarm(name: 'Isha')
  ];

  List<String> prayers = [
    'Fajr',
    'Dhuhr',
    'Asr',
    'Maghrib',
    'Isha',
  ];

  late String sahur;

  bool iftarAlarmOnOff = true;
  bool sahurAlarmOnOff = true;
  bool prayerAlarmOnOff = true;

 late Alarm nextAlarm;

  // late String muslimsalat = 'https://muslimsalat.com/kaduna/daily.json?key=$kAPIKEY';
  // String timings = 'http://api.aladhan.com/v1/timings';
  // String timingsByAddress = 'http://api.aladhan.com/v1/timingsByAddress';
  // String timingsByCity = 'http://api.aladhan.com/v1/timingsByCity';
  // String calenderByCity = 'http://api.aladhan.com/v1/calendarByCity';

  late int timestamp; // Number of seconds since Epoch
  int method = 2; // 2 for Islamic Society of North America ISNA
  int school = 0; // 0 for Shafii, Maliki & Hanbali while 1 for Hanafi
  String address = 'Central Mosque, Abuja, Nigeria';
  String city = 'Kaduna';
  String state = 'Kaduna';
  String country = 'Nigeria';
  late int day, month, year;

  late String url;

  void getStarted() async {
    location = LocationAlarm();
    await location.getCurrentLocation();
    //weatherData = await WeatherModel().getLocationWeather();
    getPrayerData();
  }

  getPrayerData() async {
    //url = '';
    day = DateTime.now().day;
    month = DateTime.now().month;
    year = DateTime.now().year;

    // timings += '/$timestamp';
    // timings += '?latitude=${position.latitude}';
    // timings += '&longitude=${position.longitude}';
    // timings += '&method=$method';
    // timings += '&school=$school';
    // print('url: $timings');

    // timingsByAddress += '?address=$address';
    // timingsByAddress += '&method=$method';
    // timingsByAddress += '&school=$school';

    // timingsByCity += '?city=$city';
    // timingsByCity += '&state=$state';
    // timingsByCity += '&country=$country';
    // timingsByCity += '&method=$method';
    // timingsByCity += '&school=$school';

    //-----------------------------
    // url += calenderByCity;
    // url += '?city=$city';
    // url += '&country=$country';
    // url += '&method=$method';
    // url += '&month=$month';
    // url += '&year=$year';
    // print('url: $url');

   // timeNetworkHelper = NetworkHelper(url: url);
    //var timeData = await timeNetworkHelper.getData();

    //if (timeData != null) {
      
      //sahur = fajrToSahur(timeData['data'][day - 1]['timings']['Fajr']);
      sahur = fajrToSahur(DateFormat.jm().format(
          PrayerGlobalVariables.NextPrayerFajer).toString());

      for (int i = 0; i < alarms.length; i++) {
        String s = apiToTime(GetPrayerTime.times[i].toString());

        DateTime d = apiToDateTime(s, year, month, day);

        setTimes(alarms[i], s, d);
      }

      setNextAlarm();
   // }
  }

  // Alarms

  UnmodifiableListView get alarms {
    return UnmodifiableListView(_alarms);
  }

  void setTimes(Alarm alarm, String s, DateTime d) {
    alarm.setSTime = s;
    alarm.setDTime = d;

    print('${alarm.name}: ${alarm.getSTime} :: ${alarm.getDTime}');
  }

  void setNextAlarm() {
    removePreviousAlarm();
    try {
      for (Alarm alarm in alarms) {
        // var now = DateTime(2020, 5, 18, 19, 30);
        var now = DateTime.now();
        var prayer = alarm.getDTime;

        if (now.isBefore(prayer)) {
          nextAlarm = alarm;
          break;
        }
        nextAlarm = alarms[0];
      }
      updateAlarm(nextAlarm, true);
    } catch (e) {
      print('##setNextAlarm##: $e');
    }
  }

  void updateAlarm(Alarm alarm, bool onOff) {
    alarm.toggleNextAlarm(onOff);
    notifyListeners();
  }

  void removePreviousAlarm() {
    if (nextAlarm != null) {
      updateAlarm(nextAlarm, false);
    }
  }

  void notify() {
    notifyListeners();
  }
}
