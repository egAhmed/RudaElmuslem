import 'dart:convert';
import 'dart:io';

import 'package:adhan/src/data/date_components.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rudaelmoslem/constants/constants.dart';
import 'package:rudaelmoslem/settings/prayer_setting.dart';

class PrayWirtJson {
   // First initialization of _json (if there is no json in the file)
 static Map<String, dynamic> _json = {};
  static String _jsonString = '';
  static List<Map<String, dynamic>> listdata = [];
   
  static  late TextEditingController _controllerKey, _controllerValue;
   static  bool _fileExists = false;
   static  late File _filePath;
   static String kFileName = 'prayertime.json';

    // InputDecoration kInputDecoration = InputDecoration(
    //   border: OutlineInputBorder(),
    //   labelText: 'Label Text',
    // );
    // TextStyle kInputTextStyle = TextStyle(
    //   fontSize: 22,
    //   color: Colors.blue,
    // );



  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$kFileName');
  }


   static void convertToList({var date,var imsak,var fajr,var syuruk,
   var dhuhr,var asr,var maghrib,var isha}) async {
    // Initialize the local _filePath
    final Map<String, dynamic> data = new Map<String, dynamic>();
     data['date'] = date;
    data['imsak'] = imsak;
    data['fajr'] = fajr;
    data['syuruk'] = syuruk;
    data['dhuhr'] = dhuhr;
    data['asr'] = asr;
    data['maghrib'] = maghrib;
    data['isha'] = isha;

    

    listdata.add(data);

    
  }

  static void writeJson() async{

    final _filePath = await _localFile;


    var time = DateTime.now();
    var mounths = time.month;
    var days = time.day;
    var years = time.year;
    DateComponents dateComponents;
    int month = getMonth(time.month,time.year);
    //print(month);
     
    var d ;
    //print(time.day);
    

    

    for (var i = 1 ; i <= month; i++) {
      dateComponents = DateComponents(years, mounths, i);
      var pray = PrayerSetting.getMonthTimes(dateComponents);
       d = years.toString()+"-"+mounths.toString()+"-"+i.toString();
      Map<String, dynamic> data = new Map<String, dynamic>();
      data['date'] = d.toString();
      data['imsak'] = pray.fajr.toString();
      data['fajr'] = pray.fajr.toString();
      data['syuruk'] = pray.sunrise.toString();
      data['dhuhr'] = pray.dhuhr.toString();
      data['asr'] = pray.asr.toString();
      data['maghrib'] = pray.maghrib.toString();
      data['isha'] = pray.isha.toString();
      //listdata.
      listdata.add(data);
      //print(i);
      //days++;
    }
    
    Map<String, dynamic> data1 = new Map<String, dynamic>();
    data1['prayerTime'] = listdata;

    _json = data1;

    //print(listdata.first);
    ///print(listdata.last);
    

    //1. Create _newJson<Map> from input<TextField>
    // Map<String, dynamic> _newJson = {key: value};
    // print('1.(_writeJson) _newJson: $_newJson');

    //2. Update _json by adding _newJson<Map> -> _json<Map>
    
    //print('2.(_writeJson) _json(updated): $_json');
    // print('----------------------');
    // print(listdata);
    // print('---------------------');
    //3. Convert _json ->_jsonString

    _jsonString = jsonEncode(_json);
     //print('3.(_writeJson) _jsonString: $_jsonString\n - \n');

    //4. Write _jsonString to the _filePath
    _filePath.writeAsString(_jsonString);
    GetStorage().write(kJsonCacheCheck, true);
  }

  static bool isLeapYear(int year) {
    if (year % 4 == 0) {
      if (year % 100 == 0) {
        if (year % 400 == 0) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else {
      return false;
    }
  }



 static int getMonth(month,yer) {
    
    switch (month) {
      case 1:
        return 31; 
        //break;
      case 2:
        if(isLeapYear(yer)){
          return 29;
        } else{
          return  28;
        }
        //break;
      case 3:
        return 31; 
        //break;
      case 4:
        return 30; 
       // break;
      case 5:
        return 31; 
        //break;
      case 6:
        return  30; 
        //break;
      case 7:
        return 31; 
       // break;
      case 8:
        return  31; 
        //break;
      case 9:
        return  30; 
       // break;
      case 10:
        return 31; 
      //  break;
      case 11:
        return  30; 
        //break;
      case 12:
        return 31; 
        //break;
      default:
      return 30; 
    }
  }

}