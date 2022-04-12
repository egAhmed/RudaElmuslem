import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/constants/constants.dart';
import 'package:rudaelmoslem/models/saly/radio_model.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

import 'cardAudio.dart';

class Page2 extends StatefulWidget {
  Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
   int selectedRadio = GetStorage().read(kSalySounditem);
  var cheacked =false;
  List<RadioModelChek> listRadio =[];
  //AudioCache
  late AudioPlayer _audioPlayer ;
  late AudioCache _audioCache ; //--------------------
  PlayerState _playerState = PlayerState.STOPPED;
  var item = GetStorage().read(kSalySounditem);

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
    _audioCache = AudioCache(fixedPlayer: _audioPlayer);

    _audioPlayer.onPlayerError.listen((msg){
      print('audioPlayer error: $msg');
      setState(() {
        _playerState = PlayerState.STOPPED;
      });
    });
    
    addItems();
    
    
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return Container(
          //color: Colors.amber,
          child: Column(
            children: [
              SizedBox(height: 10.0.h,),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.double_music_note,
                    size: 80.0.sp,
                    color: Theme.of(context).primaryColor,
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 3.0.h),
                      child: Text(
                        'salyapp.page2.title'.tr(),
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5.0),
                      width: 90.0.w,
                      child: Text(
                        'salyapp.page2.detil'.tr(),
                        softWrap: true,
                       textAlign: TextAlign.center,
                        style: Theme.of(context).primaryTextTheme.subtitle1,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(top: 3.0.h),
                  child: ListView.builder(
                    primary: false,
                    //padding: EdgeInsets.all(10.0),
                    itemCount: listRadio.length,
                    itemBuilder: (BuildContext context,index){
                    
                     return InkWell(
                        onTap: (){
                          setState(() {
                            //print(index);
                            listRadio.forEach((element) => element.groupValues = 0);
                            listRadio[index].groupValues = index;
                            listRadio.forEach((element) => element.isSelected = false);
                            listRadio[index].isSelected = true;
                            setSelectedRadio(listRadio[index].value!);
                            GetStorage().write(kSalySounditem, index);
                            GetStorage().write(kSalySourceSound, listRadio[index].soundName);
                            //setSelectedRadio()
                            //saveBookmark(listRadio[index].value,index,listRadio[index].title);
                          });
                        },
                        child: CardAudio(items: listRadio[index],onChanged: listRadio[index].onChanged,groupValue:selectedRadio ,),
                      );
                   },
                  )
                )
              )
            ],
          ),
        );
      }
    );
  }

  setSelectedRadio(int val){
    setState(() {
      selectedRadio = val;
    });
  }

  addItems() async{
     //soundName
    listRadio.add(RadioModelChek( false,'salyapp.page2.soundName.0'.tr(),0,selectedRadio,(val){setSelectedRadio(val!);},()async{
      _playPause('saly1.mp3');},'saly1'));
    listRadio.add(RadioModelChek( false,'salyapp.page2.soundName.1'.tr(),1,selectedRadio,(val){setSelectedRadio(val!);},()async{
    _playPause('saly2.mp3');},'saly2'));
    listRadio.add(RadioModelChek(false,'salyapp.page2.soundName.2'.tr(),2,selectedRadio,(val){setSelectedRadio(val!);},()async{
    _playPause('saly3.mp3');},'saly3'));
    listRadio.add(RadioModelChek(false,'salyapp.page2.soundName.3'.tr(),3,selectedRadio,(val){setSelectedRadio(val!);},()async{
    _playPause('saly4.mp3');},'saly4'));
    listRadio.add(RadioModelChek(false,'salyapp.page2.soundName.4'.tr(),4,selectedRadio,(val){setSelectedRadio(val!);},()async{
    _playPause('saly5.mp3');},'saly5'));
    listRadio.add(RadioModelChek(false,'salyapp.page2.soundName.5'.tr(),5,selectedRadio,(val){setSelectedRadio(val!);},()async{
    _playPause('saly6.mp3');},'saly6'));

    item != null?listRadio[item].isSelected = true:listRadio[0].isSelected = true;
  }

  _playPause(String? uri) async{
    //  if(_playerState == PlayerState.PLAYING){
    //   final playerResult = await _audioPlayer.pause();
    //   if(playerResult == 1){
    //     setState(() {
    //       _playerState = PlayerState.PAUSED;
    //     });
    //   }
    // }else if(_playerState == PlayerState.PAUSED){
    //   final playerResult = await _audioPlayer.resume();
    //   if(playerResult == 1){
    //     setState(() {
    //       _playerState = PlayerState.PLAYING;
    //     });
    //   }
    // }else {
      try {
        //var ur= _loadFilePath('audio/saly/1');
        //final path = await _localPath;
        //var file =  File('$path/$uri');
       // await file.writeAsBytes(bytes, flush: true);
       await _audioCache.play('audio/saly/$uri',isNotification:  true,stayAwake: true,);
       //var s = RawResourceAndroidNotificationSound(uri!);
       //print(s.sound.toString());
       //await _audioPlayer.play(file.uri.toString(),isLocal: true,);
       setState(() {
           _playerState = PlayerState.PLAYING;
         });
    } catch (e) {}
    //}
  }

  static Future<String> get _localPath async {
    //getTemporaryDirectory
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/');
  }

  Future<String> _loadFilePath(nameFile)async{
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/ ${nameFile}.mp3');

    if(await _assetAlreadyPresent(file.path)){
      return file.path;
    }

   // final bytes = await readBytes(Uri.parse(_remoteUri));
    //await file.writeAsBytes(bytes);

    return file.path;
  }

  Future<bool> _assetAlreadyPresent(String? filePath) async{
    final File file = File(filePath!);
    return file.exists();
  }
}