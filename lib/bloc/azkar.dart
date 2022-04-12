
import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:rudaelmoslem/models/azkar/azkar_list.dart';

class AzkarAPI {
  final _azkarListStreamController = StreamController<List<AzkarList>>();
  // final _azkarIndexStreamController = StreamController<int?>();
  

  Stream<List<AzkarList>> get getAzkarListStream =>
      _azkarListStreamController.stream;
  
  StreamSink<List<AzkarList>> get getAzkarSinkController =>
      _azkarListStreamController.sink;

   //StreamSink<int?> get getAzkarid => _azkarIndexStreamController;

  AzkarAPI(){
     _getAzkarist().then(
        (suraList) => {_azkarListStreamController.add(suraList)});
        //_azkarIndexStreamController.stream.listen(_getAzkarist);
      _getAzkarist();
  }
  
  dispose() {
    _azkarListStreamController.close();
  }

  _getAzkarist() async {
    String jsonString =
        await rootBundle.loadString('assets/json/azkar/list.json');
    final jsonResponse = json.decode(jsonString);
    List<AzkarList>? suras = await jsonResponse.map<AzkarList>((json) => AzkarList.fromJson(json)).toList();
        //print(jsonResponse);
        //print(suras![1].titleAr);
        getAzkarSinkController.add(suras!);
        
    return suras;
  }
}