import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:rudaelmoslem/models/surah/sura_list_model.dart';



class SuraListBloc {
  final _suraListStreamController = StreamController<List<SuraList>>();
  //final _suraAyasIndexStreamController = StreamController<int>();

  Stream<List<SuraList>> get getSuraListStream =>
      _suraListStreamController.stream;
  
  StreamSink<List<SuraList>> get getSuraSinkController =>
      _suraListStreamController.sink;
  
  //StreamSink<int> get getSuraAyesAid => _suraAyasIndexStreamController;

  dispose() {
    _suraListStreamController.close();
  }

  SuraListBloc() {
    _getSuraList().then(
        (suraList) => {_suraListStreamController.add(suraList)});
    
    //_suraAyasIndexStreamController.stream.listen(_getSuraList());
    _getSuraList();
  }

  _getSuraList() async {
    String jsonString =
        await rootBundle.loadString('assets/json/surah.json');
    final jsonResponse = json.decode(jsonString);
    List<SuraList>? suras = await jsonResponse.map<SuraList>((json) => SuraList.fromJson(json)).toList();
        //print(jsonResponse);
        //print(suras[1].place);
        //getSuraSinkController.add(suras);
        
    return suras;
  }
}
