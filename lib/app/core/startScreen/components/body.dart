import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/scrn_port.dart';
import '../components/scrn_land.dart';


class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin{

  late Position currentPosition;
  late SharedPreferences prefs;
  double? latitude =24.1967712;
  double? longitude =32.8780689;
   String? mathod;
   String? mathhab;
  bool? islocation;

  getStting() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
       latitude = prefs.get('lat') as double? ?? null;
       longitude = prefs.get('lon') as double? ?? null;
       mathod = prefs.get('mathod') as String? ?? null;
       mathhab = prefs.get('mathhab') as String? ?? null;
       islocation =  prefs.get('islocation') as bool? ?? null;
       
    });
  }

  getCurrentLocation() async{
    final GeolocatorPlatform geolocator = GeolocatorPlatform.instance;
    await geolocator
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
      .then((Position position) {
    setState(() {
      currentPosition = position;
    });
    //_getAddressFromLatLng();
  }).catchError((e) {
    print(e);
  });
 }

   @override
  void initState() {
    super.initState();
    getStting();
    
    
    if(latitude == null || longitude ==null){
       getCurrentLocation();
      latitude = currentPosition.latitude;
      longitude = currentPosition.longitude;
    }

    latitude ==null? 24.1967712 :latitude;
    longitude == null? 32.8780689 :longitude;
  }

  


  @override
  Widget build(BuildContext context) {
    return ScrnPortrait();
    // SizerUtil.orientation  == Orientation.portrait
    // // ? ScrnPortrait() 
    // : ScrnLandSape();
  }
}