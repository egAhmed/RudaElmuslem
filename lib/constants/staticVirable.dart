


import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



 
 class PrayerGlobalVariables {
 static var NextPrayer;
 static late PrayerTimes APrayerTimesd ;
 static var CurrentPrayer;
 static var LocationPrayer;
 static var LocalityPrayer;
 static var NextPrayerName;
 static var NextPrayerHoure = 0;
 static var NextPrayerMinutes = 0;
 static var NextPrayerSeconds = 0;

static var NextPrayerFajer;
static  var NextPrayerDhuhre;
static  var NextPrayerAser;
static  var NextPrayerMaghrib;
static var NextPrayerIsha;
static  var NextPrayersunrise;


  static getPrayerName( prayer){
     var p;
     switch(prayer){
        case Prayer.dhuhr:
          p =  'Dhuhr';
          break;
        case Prayer.asr:
          p = 'Asr';
          break;
        case Prayer.maghrib:
          p =  'Maghrib';
          break;
        case Prayer.isha:
          p =  'Isha';
          break;
        case Prayer.sunrise:
          p =  'Sunrise';
          break;
        case Prayer.none:
          p =  'Fajer';
          break;
        case Prayer.fajr:
          p =  'Fajer';
          break;
        
      } 
      return p; 
   }


 }

 
   class GetPrayerTime{
    //List<int>? times = [];
     String? pattern = 'd-MM-y hh:mm:ss';

    static List<int> times = [
      DateFormat('d-MM-y hh:mm:ss').parse(PrayerGlobalVariables.NextPrayerFajer.toString()).millisecondsSinceEpoch,
      DateFormat('d-MM-y hh:mm:ss').parse(PrayerGlobalVariables.NextPrayersunrise.toString()).millisecondsSinceEpoch,
      DateFormat('d-MM-y hh:mm:ss').parse(PrayerGlobalVariables.NextPrayerDhuhre.toString()).millisecondsSinceEpoch,
      DateFormat('d-MM-y hh:mm:ss').parse(PrayerGlobalVariables.NextPrayerAser.toString()).millisecondsSinceEpoch,
      DateFormat('d-MM-y hh:mm:ss').parse(PrayerGlobalVariables.NextPrayerMaghrib.toString()).millisecondsSinceEpoch,
      DateFormat('d-MM-y hh:mm:ss').parse(PrayerGlobalVariables.NextPrayerIsha.toString()).millisecondsSinceEpoch,
    ];

    // print(times);
    //return times;

   }


