import 'dart:async';
import 'dart:math' show pi;

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

import 'loading_indicator.dart';
import 'location_error_widget.dart';


class QiblahCompass extends StatefulWidget {
  @override
  _QiblahCompassState createState() => _QiblahCompassState();
}

class _QiblahCompassState extends State<QiblahCompass> {
  final _locationStreamController =
      StreamController<LocationStatus>.broadcast();

  get stream => _locationStreamController.stream;

  @override
  void initState() {
    _checkLocationStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder(
            stream: stream,
            builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return LoadingIndicator();
              if (snapshot.data!.enabled == true) {
                switch (snapshot.data!.status) {
                  case LocationPermission.always:
                  case LocationPermission.whileInUse:
                    return QiblahCompassWidget();

                  case LocationPermission.denied:
                    return LocationErrorWidget(
                      error: "Location service permission denied",
                      callback: _checkLocationStatus,
                    );
                  case LocationPermission.deniedForever:
                    return LocationErrorWidget(
                      error: "Location service Denied Forever !",
                      callback: _checkLocationStatus,
                    );
                  // case GeolocationStatus.unknown:
                  //   return LocationErrorWidget(
                  //     error: "Unknown Location service error",
                  //     callback: _checkLocationStatus,
                  //   );
                  default:
                    return Container();
                }
              } else {
                return LocationErrorWidget(
                  error: "Please enable Location service",
                  callback: _checkLocationStatus,
                );
              }
            },
          ),
        );
      }
    );
  }

  Future<void> _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
    } else
      _locationStreamController.sink.add(locationStatus);
  }

  @override
  void dispose() {
    super.dispose();
    _locationStreamController.close();
    FlutterQiblah().dispose();
  }
}

class QiblahCompassWidget extends StatelessWidget {
  final _compassSvg = SvgPicture.asset(
    'assets/svg/compass.svg',
    //color: Theme.of(context).primaryColor,
    );
  final _compassPng = Image.asset('assets/images/compass.png');
  final _needleSvg = SvgPicture.asset(
    'assets/svg/needle.svg',
    fit: BoxFit.contain,
    height: 300,
    alignment: Alignment.center,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return Scaffold(
          //backgroundColor:  ColorUtil.buckgrundColor,
          appBar: AppBar(),
          body: StreamBuilder(
            stream: FlutterQiblah.qiblahStream,
            builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return LoadingIndicator();

              final qiblahDirection = snapshot.data!;

              return Container(
                //decoration:boxDecorationGradient,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Transform.rotate(
                      angle: ((qiblahDirection.direction ) * (pi / 180) * -1),// ?? 0
                      child: SvgPicture.asset(
                        'assets/svg/compass.svg',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Transform.rotate(
                      angle: ((qiblahDirection.qiblah ) * (pi / 180) * -1),// ?? 0
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/svg/needle.svg',
                        fit: BoxFit.contain,
                        height: 40.0.h,
                        alignment: Alignment.center,
                        //color: Color(0xffDBDEF2),
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      child: Column(
                        children: [
                          Text(
                            "qiblah.title".tr(),
                            style: Theme.of(context).textTheme.headline3
                          ),
                          Text(
                            "${qiblahDirection.offset.toStringAsFixed(3)}°",
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      }
    );
  }
}
