import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:rudaelmoslem/app/prayer/prayer_tim.dart';
import 'package:rudaelmoslem/constants/constants.dart';
import 'package:rudaelmoslem/constants/staticVirable.dart';


class PrayerSetting {

  static final  latitude = GetStorage().read(kLocationLatitude);
  static final longitude = GetStorage().read(kLocationlongitude);
  static final calculationMethods = GetStorage().read(kCalculationMethod);
  static final calculationMethodMadhab = GetStorage().read(kCalculationMethodMadhab);
   
//PrayerTimes
  static  getPrayerTime(lat, lon,  madhab, methodNum) {
    final Coordinates coordinates = new Coordinates(lat, lon);
    var time = DateTime.now();
    final DateComponents dateComponents =
        DateComponents(time.year, time.month, time.day);
    // final CalculationParameters parameters =
    //     CalculationMethod.getCalculationMethodParams(methodNum);
    // if (madhab == Madhab.HANAFI) {
    //   parameters.madhab = Madhab.HANAFI;
    // } else if (madhab == Madhab.SHAFI) {
    //   parameters.madhab = Madhab.SHAFI;
    // }
    // return PrayerTimes(coordinates, dateComponents, parameters);
    // return;
  }

  static  calculationMethodsparams(calculationMethods){
    var parameters ;
    //Prayer prayer;
    var params ;
    //calculationMethodMadhab == 'hanafi'? params.madhab = Madhab.hanafi:params.madhab = Madhab.shafi;
    switch(calculationMethods){
      case 'egyptian':
        params = CalculationMethod.egyptian.getParameters();
         parameters = CalculationParameters(
          fajrAngle: 19.5,
          ishaAngle: 17.5,
          method: CalculationMethod.egyptian,
          madhab: calculationMethodMadhab == 'hanafi'?  Madhab.hanafi: Madhab.shafi,
          adjustments: PrayerAdjustments(fajr: 2)
        );
        break;
      case 'karachi':
        params = CalculationMethod.karachi.getParameters();
        parameters = CalculationParameters(
          fajrAngle: 19.5,
          ishaAngle: 17.5,
          method: CalculationMethod.karachi,
          madhab: calculationMethodMadhab == 'hanafi'?  Madhab.hanafi: Madhab.shafi,
          adjustments: PrayerAdjustments(fajr: 2)
        );
        break;
      case 'kuwait':
        params = CalculationMethod.kuwait.getParameters();
        parameters = CalculationParameters(
          fajrAngle: 19.5,
          ishaAngle: 17.5,
          method: CalculationMethod.kuwait,
          madhab: calculationMethodMadhab == 'hanafi'?  Madhab.hanafi: Madhab.shafi,
          adjustments: PrayerAdjustments(fajr: 2)
        );
        break;
      case 'moon_sighting_committee':
        params = CalculationMethod.moon_sighting_committee.getParameters();
        parameters = CalculationParameters(
          fajrAngle: 19.5,
          ishaAngle: 17.5,
          method: CalculationMethod.moon_sighting_committee,
          madhab: calculationMethodMadhab == 'hanafi'?  Madhab.hanafi: Madhab.shafi,
          adjustments: PrayerAdjustments(fajr: 2)
        );
        break;
      case 'muslim_world_league':
        params = CalculationMethod.muslim_world_league.getParameters();
        parameters = CalculationParameters(
          fajrAngle: 19.5,
          ishaAngle: 17.5,
          method: CalculationMethod.muslim_world_league,
          madhab: calculationMethodMadhab == 'hanafi'?  Madhab.hanafi: Madhab.shafi,
          adjustments: PrayerAdjustments(fajr: 2)
        );
        break;
      case 'north_america':
        params = CalculationMethod.north_america.getParameters();
        parameters = CalculationParameters(
          fajrAngle: 19.5,
          ishaAngle: 17.5,
          method: CalculationMethod.north_america,
          madhab: calculationMethodMadhab == 'hanafi'?  Madhab.hanafi: Madhab.shafi,
          adjustments: PrayerAdjustments(fajr: 2)
        );
        break;
      case 'other':
        params = CalculationMethod.other.getParameters();
        parameters = CalculationParameters(
          fajrAngle: 19.5,
          ishaAngle: 17.5,
          method: CalculationMethod.other,
          madhab: calculationMethodMadhab == 'hanafi'?  Madhab.hanafi: Madhab.shafi,
          adjustments: PrayerAdjustments(fajr: 2)
        );
        break;
      case 'qatar':
        params = CalculationMethod.qatar.getParameters();
        parameters = CalculationParameters(
          fajrAngle: 19.5,
          ishaAngle: 17.5,
          method: CalculationMethod.qatar,
          madhab: calculationMethodMadhab == 'hanafi'?  Madhab.hanafi: Madhab.shafi,
          adjustments: PrayerAdjustments(fajr: 2)
        );
        break;
      case 'singapore':
        params = CalculationMethod.singapore.getParameters();
        parameters = CalculationParameters(
          fajrAngle: 19.5,
          ishaAngle: 17.5,
          method: CalculationMethod.singapore,
          madhab: calculationMethodMadhab == 'hanafi'?  Madhab.hanafi: Madhab.shafi,
          adjustments: PrayerAdjustments(fajr: 2)
        );
        break;
      case 'tehran':
        params = CalculationMethod.tehran.getParameters();
        parameters = CalculationParameters(
          fajrAngle: 19.5,
          ishaAngle: 17.5,
          method: CalculationMethod.tehran,
          madhab: calculationMethodMadhab == 'hanafi'?  Madhab.hanafi: Madhab.shafi,
          adjustments: PrayerAdjustments(fajr: 2)
        );
        break;
      case 'turkey':
        params = CalculationMethod.turkey.getParameters();
        parameters = CalculationParameters(
          fajrAngle: 19.5,
          ishaAngle: 17.5,
          method: CalculationMethod.turkey,
          madhab: calculationMethodMadhab == 'hanafi'?  Madhab.hanafi: Madhab.shafi,
          adjustments: PrayerAdjustments(fajr: 2)
        );
        break;
      case 'umm_al_qura':
        params = CalculationMethod.umm_al_qura.getParameters();
        parameters = CalculationParameters(
          fajrAngle: 19.5,
          ishaAngle: 17.5,
          method: CalculationMethod.umm_al_qura,
          madhab: calculationMethodMadhab == 'hanafi'?  Madhab.hanafi: Madhab.shafi,
          adjustments: PrayerAdjustments(fajr: 2)
        );
        break;

    }
    return parameters;
  }

  static  getTodayTimes(dateComponents){
    //32.88120534271002
    //24.19159374665469
     final Coordinates coordinates = new Coordinates(latitude, longitude);
    // var parameters ;
    // Prayer prayer;
    // var params ;
      // params.madhab = calculationMethodMadhab;
      // params.adjustments.fajr = 2;
    
    
    
    var prayerTimes = PrayerTimes(coordinates, dateComponents,calculationMethodsparams(calculationMethods));
    //print(prayerTimes);
     PrayerGlobalVariables.NextPrayer = prayerTimes.timeForPrayer(prayerTimes.nextPrayer());
     PrayerGlobalVariables.NextPrayerName = prayerTimes.nextPrayer();
     PrayerGlobalVariables.CurrentPrayer = prayerTimes.currentPrayer();
     //print(prayerTimes.asr);
     //DateFormat.jm().format(prayerTimes.fajr);
     PrayerGlobalVariables.NextPrayerFajer =  prayerTimes.fajr;
     PrayerGlobalVariables.NextPrayerDhuhre = prayerTimes.dhuhr;
     PrayerGlobalVariables.NextPrayerAser = prayerTimes.asr;
     PrayerGlobalVariables.NextPrayerMaghrib = prayerTimes.maghrib;
     PrayerGlobalVariables.NextPrayerIsha = prayerTimes.isha;
     PrayerGlobalVariables.NextPrayersunrise =prayerTimes.sunrise;
     PrayerGlobalVariables.APrayerTimesd = prayerTimes;

    
     //print(DateFormat.jm().format(prayerTimes.maghrib));
     //print(prayerTimes.currentPrayer());
     //print(prayerTimes.nextPrayer());
    //print('dddd :' + PrayerGlobalVariables.NextPrayerDhuhre.toString());
    //print(prayerTimes.);
    return prayerTimes;
  }

  static PrayerTimes  getMonthTimes(dateComponents){
    final Coordinates coordinates = new Coordinates(latitude, longitude);
    var prayerTimes = PrayerTimes(coordinates, dateComponents,calculationMethodsparams(calculationMethods));
    //--

    return prayerTimes;
  }

  static getNextPrayer(nextPrayer,PrayerTimes prayerTimeday){
    var time = DateTime.now();    
     DateComponents dateComponents = DateComponents(time.year, time.month, time.day);

     var yers = DateTime.now().year;
     //var math = int.parse(reder)

    if(DateTime.friday ==2){
      if(yers / 400 ==0 && yers / 100 ==0 ) {
        if(DateTime.now().day == 29){
          return dateComponents = DateComponents(time.year, time.month+1, 1);
        }
      }else if(yers / 4 == 0 && yers / 100 != 0){
        if(DateTime.now().day == 29){
          return dateComponents = DateComponents(time.year, time.month+1, 1);
        }
      }else if(DateTime.now().day == 28){
        return dateComponents = DateComponents(time.year, time.month+1, 1);
      }
    }else if(DateTime.now().day == 30 ){
      if(DateTime.january == 1|| DateTime.march == 3 || DateTime.may == 5
      || DateTime.july == 7 || DateTime.august == 8 || DateTime.october == 10
      || DateTime.december == 30){
         return dateComponents = DateComponents(time.year, time.month, time.day+1);
      }else if(DateTime.friday !=2 ) {
        return dateComponents = DateComponents(time.year, time.month+1, 1);
      }
    }else if(DateTime.now().day == 31){
      return dateComponents = DateComponents(time.year, time.month+1, 1);
    }else{
      dateComponents = DateComponents(time.year, time.month, time.day);
    }

   //print(DateTime.now().year);

    var prayerTimet = getTodayTimes(dateComponents);
    var prayer = prayerTimet.fajr;
    var prayerday =  prayerTimeday.isha;
    var nextPrayerHoure ;
    var nextPrayerMinutes ;
    var nextPrayerSeconds ;
    //var nm = prayerday.difference(prayer)..inMinutes;
    //var ns = prayerday.difference(prayer).inSeconds;

    if(nextPrayer == Prayer.none){
      nextPrayerHoure =  time.difference(prayer).inHours;
      //var t = nextPrayerHoure.ads();
      nextPrayerMinutes =  time.difference(prayer).inMinutes.remainder(60);
      nextPrayerSeconds =  time.difference(prayer).inSeconds.remainder(60);
      //PrayerGlobalVariables.NextPrayerName = 'Fajer';
    }else {
      nextPrayerHoure =  time.difference(PrayerGlobalVariables.NextPrayer).inHours;
      nextPrayerMinutes =  time.difference(PrayerGlobalVariables.NextPrayer).inMinutes.remainder(60);
      nextPrayerSeconds =  time.difference(PrayerGlobalVariables.NextPrayer).inSeconds.remainder(60);


      
    }



    PrayerGlobalVariables.NextPrayerHoure  = nextPrayerHoure.abs();
    PrayerGlobalVariables.NextPrayerMinutes = nextPrayerMinutes.abs();
    PrayerGlobalVariables.NextPrayerSeconds = nextPrayerSeconds.abs();
     
    //  print(nextPrayer);
    //  print(PrayerGlobalVariables.NextPrayerName);
    //  print(PrayerGlobalVariables.NextPrayer);
    //  print(time);
    //  print(nextPrayerHoure.abs());
    //  print(PrayerGlobalVariables.NextPrayerSeconds);
    // print(10.abs());
    //print(ns);
    
    
  }


  Future getMonthPrayer(dateComponents) async{
    //32.88120534271002
    //24.19159374665469
     final Coordinates coordinates = new Coordinates(latitude, longitude);
    var parameters ;
    Prayer prayer;
    var params ;
    var prayerTimes = PrayerTimes(coordinates, dateComponents,parameters);
  }

//   Future prayerget(longitude,latitude,) async{
//    //await _getCurrentLocation();
//    final myCoordinates = Coordinates(latitude, longitude);
//    final params = CalculationMethod.egyptian.getParameters();
//    params.madhab = Madhab.hanafi;
//    params.adjustments.fajr=2;
//    PrayerTimes prayerTimes = PrayerTimes.today(
//               Coordinates(latitude, longitude),
//               params);
//     final sunnahTimes = SunnahTimes(prayerTimes);
//  }

//  Future<DateTime> getTodayFajerTime(latitude, longitude) async{
//    var coordinates = Coordinates(latitude, longitude);
//    var date = DateTime.now();
//    CalculationMethod method = CalculationMethod.EGYPTIAN;
//    //method.noSuchMethod(invocation)
//    final adhan = AdhanFlutter.create(coordinates, date, method);
//    return  adhan.fajr;
//  }

//  Future getTodayTime(latitude, longitude) async{
//    var coordinates = Coordinates(latitude, longitude);
//    var date = DateComponents.from(DateTime.now());
//    var method = CalculationMethod.egyptian.getParameters();
//    method.madhab = Madhab.hanafi;
//    //method.noSuchMethod(invocation)
//    //final adhan = AdhanFlutter.create(coordinates, date, method);
   
//    final prayer = PrayerTimes(coordinates,date, method);
//    final sun = SunnahTimes(prayer);
//    sun.lastThirdOfTheNight;
//    //print(sun);
//    print(prayer.dateComponents.day);
//    print(prayer.runtimeType);
//    var next = prayer.nextPrayer();
//    print(prayer.isha.timeZoneName);
//    print(prayer.currentPrayer());
//    print(next== null? prayer.fajr:prayer.nextPrayer());
//    print(prayer.isha.isUtc);
//    print(DateFormat.jm().format(prayer.isha));
//    print(prayer.nextPrayerByDateTime(prayer.timeForPrayer(Prayer.maghrib)));
//    print(prayer.timeForPrayer(Prayer.isha));
   
   
//    return  prayer;
//  }

 // ignore: non_constant_identifier_names
//Future Grtfgf(){
   /**
    * progress_dialog: ^1.2.2
  geolocator: ^5.3.1  
  adhan_flutter: ^0.0.2
  android_alarm_manager: ^0.4.5+11
    */
 //}





  
}