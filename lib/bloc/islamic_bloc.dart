
import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:rudaelmoslem/models/islamic/islamic_list.dart';

class IslamicAPI{

  final _IslamicListStreamController = StreamController<List<IslamicList>>();
  // final _azkarIndexStreamController = StreamController<int?>();
  

  Stream<List<IslamicList>> get getIslamicListStream =>
      _IslamicListStreamController.stream;
  
  StreamSink<List<IslamicList>> get getIslamicSinkController =>
      _IslamicListStreamController.sink;

  IslamicAPI(){
    _getIslamicist().then(
        (suraList) => {_IslamicListStreamController.add(suraList)});
        //_azkarIndexStreamController.stream.listen(_getAzkarist);
      _getIslamicist();
  }

   dispose() {
    _IslamicListStreamController.close();
  }

  _getIslamicist() async {
    String jsonString =
        await rootBundle.loadString('assets/json/islamic/listBook.json');
    final jsonResponse = json.decode(jsonString);
    List<IslamicList>? suras = await jsonResponse.map<IslamicList>((json) => IslamicList.fromJson(json)).toList();
        //print(jsonResponse);
        print(suras![1].titleAr);
        getIslamicSinkController.add(suras);
        
    return suras;
  }

}