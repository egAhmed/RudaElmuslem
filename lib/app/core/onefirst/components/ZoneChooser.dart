///This widget is rendered as Location button at header part.
///Also handle the location selection
import 'dart:async';
import 'package:app_settings/app_settings.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoding/geocoding.dart' hide Location;
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/constants/constants.dart';
import 'package:rudaelmoslem/constants/staticVirable.dart';
import 'package:rudaelmoslem/locationUtil/LocationData.dart';
import 'package:rudaelmoslem/locationUtil/location.dart';
import 'package:rudaelmoslem/locationUtil/locationDatabase.dart';
import 'package:rudaelmoslem/locationUtil/location_coordinate.dart';
import 'package:rudaelmoslem/locationUtil/location_coordinate_model.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/provider/location_provider.dart';
import 'package:rudaelmoslem/utilts/debug_toast.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';


class LocationChooser {

  static void onNewLocationSaved(BuildContext context) {
    GetStorage().write(kStoredShouldUpdateNotif,
        true); //if zone changes, update the notification
    //this setState will be called when user select a new location, this will update the Text short code
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 1300),
        content: Row(
          children: [
            Icon(
              Icons.pin_drop_rounded,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black87
                  : Colors.white70,
            ),
            const SizedBox(width: 10),
             Text(
               'onefirst.page1.done'.tr()
             ),
          ],
        ),
      ),
    );
  }

  static Future<LocationCoordinateData> _getAllLocationData() async {
    String? administrativeArea;
    String? locality;
    String? country;

    Position _pos = await LocationData.getCurrentLocation();
    DebugToast.show(_pos.toString());
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(_pos.latitude, _pos.longitude);
      var first = placemarks.first;
      administrativeArea = first.administrativeArea;
      locality = first.locality;
      country = first.country;
      GetStorage().write(kStoredLocationLocality, locality);
    } on PlatformException catch (e) {
      GetStorage().write(kStoredLocationLocality, e.message.toString());
      if (e.message!.contains('A network error occurred')) {
        throw 'A network error occurred trying to lookup the supplied coordinates.';
      } else {
        rethrow;
      }
    }
    DebugToast.show(country);
    if (country!.toLowerCase() != "malaysia") {
      throw 'Outside Malaysia';
    }
    var zone = LocationCoordinate.getJakimCodeNearby(
        _pos.latitude, _pos.longitude, administrativeArea!);

    return LocationCoordinateData(
        zone: zone,
        negeri: administrativeArea,
        lokasi: locality,
        country: country,
        lat: null,
        lng: null);
  }

  static Future<bool> showLocationChooser(BuildContext context) async {
    bool? res = await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
         // backgroundColor: Color(0xffDEE1F3)
         //elevation: 50.0,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(20.0),
          // ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.0.w,horizontal: 1.0.h),
            height: 50.0.h,
            child: FutureBuilder(
                future:
                    getCurrenyLocation().timeout(const Duration(seconds: 12)),
                builder:
                    (context, AsyncSnapshot<LocationCoordinateData> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return _onLoadingWidget(context: context);
                  } else if (snapshot.hasData) {
                    return _onCompletedWidget(context,
                        location: snapshot.data!);
                  } else if (snapshot.hasError) {
                    return _onErrorWidget(
                      context,
                      errorMessage: snapshot.error.toString(),
                    );
                  } else {
                    return _onErrorWidget(context,
                        errorMessage: 'onefirst.page1.error.unexpected'.tr()
                        );
                  }
                }),
          ),
        );
      },
    );
    return res ?? false;
  }

  static  Future<LocationCoordinateData> getCurrenyLocation() async {
    
  double? latitude;
  double? longitude;
  String? location;
   String? administrativeArea;
   Position _pos ;
   String? locality;
    String? country;
    

    try {
      _pos =  await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low,);
      //forceAndroidLocationManager: true,
      //timeLimit: const Duration(seconds: 12)

      DebugToast.show(_pos.toString());

      List<Placemark> placemarks =
            await placemarkFromCoordinates(_pos.latitude, _pos.longitude);
        var first = placemarks.last;
        administrativeArea = first.administrativeArea;
        locality = first.locality;
        country = first.country;
        
        //location = place.locality;
        latitude = _pos.latitude;
        longitude = _pos.longitude;
        PrayerGlobalVariables.LocationPrayer =  location;
        PrayerGlobalVariables.LocalityPrayer =  locality;

        GetStorage().write(kLocationLatitude, latitude);
        GetStorage().write(kLocationlongitude, longitude);
        GetStorage().write(kLocationlocation, location);
        GetStorage().write(kStoredLocationLocality, locality);
        GetStorage().write(kLocationCountry, country);


    } on PlatformException catch (e) {
      GetStorage().write(kStoredLocationLocality, e.message.toString());
      if (e.message!.contains('A network error occurred')) {
        throw 'A network error occurred trying to lookup the supplied coordinates.';
      } else {
        rethrow;
      }
    }



   
    
    
      //location = location == ''?'aswan':location;      
    

    //  print("latitude:"+latitude.toString());
    // print("longitude:"+longitude.toString());
    // print("location:"+country.toString());
    // print("location:"+locality.toString());
    // print("location:"+location.toString());
    // print("location:"+administrativeArea.toString());


    DebugToast.show(country);
    // if (country!.toLowerCase() != "aswan") {
    //   //throw 'Outside Aswan';
    // }
    // var zone = LocationCoordinate.getJakimCodeNearby(
    //     _pos.latitude, _pos.longitude, administrativeArea!);

    DateTime dateTime = DateTime.now();

    return LocationCoordinateData(
        zone: dateTime.timeZoneName,
        negeri: administrativeArea,
        lokasi: locality,
        lat: null,
        country: country,
        lng: null);
  }

  // static Future<bool?> openLocationBottomSheet(BuildContext context) async {
  //   return await showModalBottomSheet(
  //     backgroundColor: Colors.transparent,
  //     context: context,
  //     isScrollControlled: true,
  //     builder: (BuildContext context) {
  //       return Consumer<LocationProvider>(
  //         builder: (context, value, child) {
  //           return FractionallySizedBox(
  //             heightFactor: 0.68,
  //             child: ClipRRect(
  //               borderRadius:
  //                   const BorderRadius.vertical(top: Radius.circular(26)),
  //               child: Container(
  //                 color: Theme.of(context).canvasColor,
  //                 child: Scrollbar(
  //                   child: GroupedListView<Location, String>(
  //                     elements: LocationDatabase.allLocationData,
  //                     groupBy: (element) => element.negeri,
  //                     groupSeparatorBuilder: (String groupByValue) => Padding(
  //                       padding: const EdgeInsets.only(left: 16, top: 8),
  //                       child: Opacity(
  //                         opacity: 0.6,
  //                         child: Text(
  //                           groupByValue,
  //                           style: const TextStyle(
  //                             fontSize: 18,
  //                             fontStyle: FontStyle.italic,
  //                             fontWeight: FontWeight.bold,
  //                             decorationStyle: TextDecorationStyle.dotted,
  //                             decoration: TextDecoration.underline,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     itemBuilder: (context, element) {
  //                       bool _selected =
  //                           value.currentLocationCode == element.jakimCode;
  //                       return ListTile(
  //                         onTap: () {
  //                           value.currentLocationCode = element.jakimCode;
  //                           onNewLocationSaved(context);
  //                           Navigator.pop(context, true);
  //                         },
  //                         title:
  //                             Text('LocationDatabase.daerah(element.jakimCode)'),
  //                         trailing: _locationBubble(context, element.jakimCode,
  //                             selected: _selected),
  //                         selected: _selected,
  //                       );
  //                     },
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  static Widget _locationBubble(BuildContext context, String shortCode,
      {bool selected = false}) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: selected ? Colors.blue : null,
        border: Border.all(
            color: selected
                ? Colors.blue
                : Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        shortCode,
        style: selected ? const TextStyle(color: Colors.white) : null,
      ),
    );
  }

  static Widget _onCompletedWidget(BuildContext context,
      {required LocationCoordinateData location}) {

    var country = GetStorage().read(kLocationCountry);
    var locations = GetStorage().read(kStoredLocationLocality);
    return Consumer<ThemeController>(
            builder: (context, valuetheme, child) {
        return Consumer<LocationProvider>(
          builder: (context, value, child) {
            return Column(
             // mainAxisSize: MainAxisSize.min,
              children: [
                 Center(
                   child: Text(
                     'onefirst.page1.ulocation'.tr(),
                     style: valuetheme.themeMode == ThemeMode.dark?
                     Theme.of(context).textTheme.headline3!.copyWith(color: Theme.of(context).primaryColor ):
                     Theme.of(context).textTheme.headline3
                     )),
                SizedBox(height: 10.0.h,),
                Center(
                  child: Text(
                    location.lokasi!,
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                        fontSize: 18.0.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).bottomAppBarColor,
                  ),
                  child: ListTile(
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _locationBubble(context, location.zone.toUpperCase()),
                      ],
                    ),
                    title: Text(
                      country,
                      style: valuetheme.themeMode == ThemeMode.dark?
                     Theme.of(context).textTheme.headline4:
                     Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
                    ),
                    subtitle: Text(
                      locations.toString(),
                      style: valuetheme.themeMode == ThemeMode.dark?
                     Theme.of(context).textTheme.headline4:
                     Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // TextButton(
                        //   child: const Text('Set manually'),
                        //   onPressed: () async {
                        //     //bool res =await openLocationBottomSheet(context) ?? false;
                        //     //Navigator.pop(context, res);
                        //   },
                        // ),
                        TextButton(
                          child:  Text(
                             'onefirst.page1.setlocation'.tr(),
                             style: valuetheme.themeMode == ThemeMode.dark?
                              Theme.of(context).textTheme.headline5!.copyWith(color: Theme.of(context).primaryColor ):
                              Theme.of(context).textTheme.headline5,
                            ),
                          onPressed: () {
                            value.currentLocationCode = location.zone;
                            onNewLocationSaved(context);

                            Navigator.pop(context, true);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }
    );
  }

  static Widget _onErrorWidget(BuildContext context,
      {required String errorMessage}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
           Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  'onefirst.page1.error.title'.tr()
                ),
              )),
          Expanded(
            flex: 3,
            child: DefaultTextStyle(
              style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.fmd_bad_outlined,
                        size: 40,
                        color: Colors.red.shade300,
                      ),
                      Icon(
                        Icons
                            .signal_cellular_connected_no_internet_0_bar_outlined,
                        size: 40,
                        color: Colors.red.shade300,
                      ),
                    ],
                  ),
                  Text.rich(
                     TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'onefirst.page1.error.ucheck'.tr()
                        ),
                        TextSpan(
                          text: 'onefirst.page1.error.internet'.tr(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'onefirst.page1.error.or'.tr(),
                          ),
                        TextSpan(
                          text: 'onefirst.page1.error.service'.tr(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red.shade300),
                  ),
                  // const Text.rich(
                  //   TextSpan(
                  //     children: <TextSpan>[
                  //       TextSpan(text: '\nPlease'),
                  //       TextSpan(
                  //         text: ' retry ',
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //       TextSpan(text: 'or set your location'),
                  //       TextSpan(
                  //         text: ' manually.',
                  //         style: TextStyle(fontWeight: FontWeight.bold),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 10,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () async =>
                      await AppSettings.openLocationSettings(),
                  child:  Text(
                    'onefirst.page1.error.setting'.tr(),
                  ),
                ),
                // TextButton(
                //   onPressed: () async {
                //     //bool res = await openLocationBottomSheet(context) ?? false;
                //     //Navigator.pop(context, res);
                //   },
                //   child: const Text(
                //     'Set manually',
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }

  static Widget _onLoadingWidget({String loadingMessage ='',  BuildContext? context}) {
    loadingMessage ='onefirst.page1.loading'.tr();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            loadingMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
           SizedBox(height: 24),
           SpinKitPulse(
            color: Theme.of(context!).primaryColor,
          )
        ],
      ),
    );
  }
}
