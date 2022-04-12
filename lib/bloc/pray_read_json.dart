import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rudaelmoslem/constants/constants.dart';
import 'package:rudaelmoslem/models/jakim_esolat_model.dart';
import 'package:rudaelmoslem/utilts/DateAndTime.dart';
import 'package:rudaelmoslem/utilts/debug_toast.dart';

class PrayReadJson{

  static Map<String, dynamic> _json = {};
 static  String _jsonString = '';
 static   bool _fileExists = false;
 static   late File _filePath;
  static  String kFileName = 'prayertime.json';


 static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$kFileName');
  }

  final _prayerTimeStreamController = StreamController<List<PrayerTimeNotifi>>();
  //final _suraAyasIndexStreamController = StreamController<int>();

  Stream<List<PrayerTimeNotifi>> get getprayerTimeStream =>
      _prayerTimeStreamController.stream;
  
  StreamSink<List<PrayerTimeNotifi>> get getprayerTimeSinkController =>
      _prayerTimeStreamController.sink;
  
  //StreamSink<int> get getSuraAyesAid => _suraAyasIndexStreamController;

  

  PrayReadJson() {
    

    // _getPrayerTime().then (
    //     (pray) => { print(pray),
    //       _prayerTimeStreamController.add(pray)
    //       });
    
    //_suraAyasIndexStreamController.stream.listen(_getSuraList());
    //_getPrayerTime();
  }

  dispose() {
    _prayerTimeStreamController.close();
  }

  _getPrayerTime()async{
    _filePath = await _localFile;

    // 0. Check whether the _file exists
    _fileExists = await _filePath.exists();

    if (_fileExists) {
      try {
        //1. Read _jsonString<String> from the _file.
       // String jsonString  = await _filePath.readAsString();
        //print('ll'+jsonString);
        String _jsonString = await rootBundle.loadString(_filePath.path);
        print(_jsonString);

        final jsonResponse = await json.decode(_jsonString);
        print( '-----------------------');
        print(jsonResponse);

        GetStorage().write(kJsonCache, jsonResponse);
        var f = GetStorage().read(kJsonCache);
        print( '-----------------------');
        print(f);

        var s = PrayerTimeNotifi.fromJson(jsonResponse);
        print( '-----------------------');
        print(s.asr);
        print(s);

        List<PrayerTimeNotifi>? pray =[] ;
        print( pray);
        pray = await jsonResponse.map<PrayerTimeNotifi>((jsone) => PrayerTimeNotifi.fromJson(jsone)).toList();
           print( '-----------------------');
            print(jsonResponse);
            //print(suras[1].place);
            getprayerTimeSinkController.add(pray!);
            print( '---------------ccxcxcx--------');
            print( pray);
        return pray;
     }catch(e){}
    }
  }






  void _readJson() async {
    // Initialize _filePath
    _filePath = await _localFile;

    // 0. Check whether the _file exists
    _fileExists = await _filePath.exists();
    print('0. File exists? $_fileExists');

    // If the _file exists->read it: update initialized _json by what's in the _file
    if (_fileExists) {
      try {
        //1. Read _jsonString<String> from the _file.
        _jsonString = await _filePath.readAsString();
        //_jsonString =await rootBundle.loadString('$_filePath');
        print('1.(_readJson) _jsonString: $_jsonString');

        //2. Update initialized _json by converting _jsonString<String>->_json<Map>
        _json = jsonDecode(_jsonString);
        print('2.(_readJson) _json: $_json \n - \n');
      } catch (e) {
        // Print exception errors
        print('Tried reading _file error: $e');
        // If encountering an error, return null
      }
    }
  }

  static Future<JakimEsolatModel> fetchMpt() async{
    // Initialize _filePath
    var _filePath = await _localFile;

    // 0. Check whether the _file exists
    var _fileExists = await _filePath.exists();

    JakimEsolatModel parsedModel ;

    if (GetStorage().read(kJsonCache) != null) {
      var json = GetStorage().read(kJsonCache);
       parsedModel = JakimEsolatModel.fromJson(json);
      //var sjson =  await json.decode(json); 
      //return parsedModel = await sjson.map<PrayerTimeNotifi>((jsone) => PrayerTimeNotifi.fromJson(jsone)).toList();
      // Check is same location code, month and year
      // if (_validateResponse(parsedModel, location)) {
      //   DebugToast.show('Reading from cache');
       //return parsedMod
      // }
      
    }

  //  try{

      if (_fileExists) {
        _jsonString = await _filePath.readAsString();
        var json = jsonDecode(_jsonString);
        GetStorage().write(kJsonCache, json);
        //parsedModel = PrayerTimeNotifi.fromJson(json);
         return parsedModel = await json.map<PrayerTimeNotifi>((jsone) => PrayerTimeNotifi.fromJson(jsone)).toList();
        //return parsedModel;
      }
      else{
        // var json = jsonDecode(response.body);
        //   var parsedModel = JakimEsolatModel.fromJson(json);
        //   if (_validateResponse(parsedModel, location)) {
        //     GetStorage().write(kJsonCache, json);
        //     return parsedModel;
        //   }
        
        throw 'Failed to load prayer time. Status code';
      }

    //}catch (e) {
        // Print exception errors
       // print('Tried reading _file error: $e');
        // If encountering an error, return null
    //}
    //return parsedModel;
  }

  /// Attempt to read from cache first, if cache not available,
  /// proceed using JAKIM's API, if unreachable, use the backup API.
  static Future<JakimEsolatModel> fetchMptNow() async { //String location
    // Initialize _filePath
    var _filePath = await _localFile;

    // 0. Check whether the _file exists
    var _fileExists = await _filePath.exists();

    if (GetStorage().read(kJsonCache) != null) {
      var json = GetStorage().read(kJsonCache);

      var parsedModel = JakimEsolatModel.fromJson(json);
      // Check is same location code, month and year
      // if (_validateResponse(parsedModel, location)) {
      //   DebugToast.show('Reading from cache');
      //print('object    hhhhhhhhhhhhhhhhh');
         return parsedModel;
      // }
    }
    try {
      // final api = Uri.https('www.e-solat.gov.my', 'index.php', {
      //   'r': 'esolatApi/takwimsolat',
      //   'period': 'month',
      //   'zone': location,
      // });
      // final response = await http.get(api);
      //GetStorage().write(kStoredApiPrayerCall, api.toString()); //for debug dialog
      //DebugToast.show('Calling jakim api');
      if (_fileExists) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        _jsonString = await _filePath.readAsString();
        var json = jsonDecode(_jsonString);
        //print(json);
        GetStorage().write(kJsonCache, json);
        return JakimEsolatModel.fromJson(json);
      } else {
        // If jakim failed, call the backup API
        // final api =
        //     Uri.parse('https://mpt-backup-api.herokuapp.com/solat/$location');
        // final response = await http.get(api);
        //GetStorage().write(kStoredApiPrayerCall, api.toString()); //for debug dialog
        DebugToast.show('Calling backup API');
        if (_fileExists) {
          _jsonString = await _filePath.readAsString();
          var json = jsonDecode(_jsonString);
          return JakimEsolatModel.fromJson(json);

          // if (_validateResponse(parsedModel, location)) {
          //   GetStorage().write(kJsonCache, json);
          //   return parsedModel;
          // }
        } else {
          throw 'Failed to load prayer time (backup API). Status code ${_fileExists}';
        }

        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw 'Failed to load prayer time. Status code ${_fileExists}';
      }
    } on SocketException {
      throw 'No internet connection.';
    }
  }


  // static bool _validateResponse(
  //     JakimEsolatModel model, String requestedLocationCode) {
  //   var lastApiFetched = DateTime.parse(model.serverTime!);

  //   return (model.zone == requestedLocationCode) &&
  //       DateAndTime.isSameMonthFromM(lastApiFetched.month) &&
  //       DateAndTime.isTheSameYear(lastApiFetched.year);
  // }

}