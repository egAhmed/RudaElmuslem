import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/app/qibla/qiblah_compass.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'dart:math';

import 'loading_indicator.dart';
//import 'package:flutter_qiblah/flutter_qiblah.dart';



class QiplahPlayer extends StatefulWidget {
  @override
  _QiplahPlayerState createState() => _QiplahPlayerState();
}

class _QiplahPlayerState extends State<QiplahPlayer> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return Scaffold(
          body: FutureBuilder(
                future: _deviceSupport,
                builder: (_, AsyncSnapshot<bool?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return LoadingIndicator();
                  if (snapshot.hasError)
                    return Center(
                      child: Text(
                        "Error: ${snapshot.error.toString()}",
                        style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(color: Colors.red[300]),
                        ),
                    );

                  if (snapshot.data!)
                    return QiblahCompass();
                  //else
                    //return QiblahMaps();
                  else{
                    return Container();
                  }
                },
          ),
        );
      }
    );
  }
}

class QiblahCompassWidget extends StatelessWidget {
  final _compassSvg = SvgPicture.asset('assets/svg/compass.svg');
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
          //backgroundColor: ColorUtil.buckgrundColor,
          body: StreamBuilder(
            stream: FlutterQiblah.qiblahStream,
            builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return LoadingIndicator();

              final qiblahDirection = snapshot.data!;

              return Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Transform.rotate(
                    angle: ((qiblahDirection.direction ) * (pi / 180) * -1),// ?? 0
                    child: _compassSvg,
                  ),
                  Transform.rotate(
                    angle: ((qiblahDirection.qiblah ) * (pi / 180) * -1), // ?? 0
                    alignment: Alignment.center,
                    child: _needleSvg,
                  ),
                  Positioned(
                    bottom: 8,
                    child: Text("${qiblahDirection.offset.toStringAsFixed(3)}°"),
                  )
                ],
              );
            },
          ),
        );
      }
    );
  }
}

class CenterEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: RaisedButton(
            color: Theme.of(context).accentColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text("Compass"),
                      ),
                      body: TestingCompassWidget(),
                    );
                  },
                ),
              );
            },
            child: Text('Open Compass'),
          ),
        ));
  }
}

class TestingCompassWidget extends StatefulWidget {
  @override
  _TestingCompassWidgetState createState() => _TestingCompassWidgetState();
}

class _TestingCompassWidgetState extends State<TestingCompassWidget> {
  @override
  void dispose() {
    //FlutterCompass().dispose(); ----------------------------------------
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildManualReader(),
    );
  }

  Widget _buildManualReader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: StreamBuilder<CompassEvent>(
          stream: FlutterCompass.events,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error reading heading: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            var direction = snapshot.data!.heading;
            return Text(
              '$direction',
              style: Theme.of(context).textTheme.button,
            );
          }),
    );
  }
}


//class Example extends StatelessWidget {
  //@override
 /* Widget build(BuildContext context) {
    //final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: FutureBuilder(
        future: _deviceSupport,
        builder: (_, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){}
            //return LoadingIndicator();
          if (snapshot.hasError)
            return Center(
              child: Text("Error: ${snapshot.error.toString()}"),
            );

          if (snapshot.data){}
            //return QiblahCompass();
          //else{}
            //return QiblahMaps();
        },
      ),
    );
  }
}

class CenterEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: RaisedButton(
            color: Theme.of(context).accentColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text("Compass"),
                      ),
                      body: TestingCompassWidget(),
                    );
                  },
                ),
              );
            },
            child: Text('Open Compass'),
          ),
        ));
  }
}

class TestingCompassWidget extends StatefulWidget {
  @override
  _TestingCompassWidgetState createState() => _TestingCompassWidgetState();
}

class _TestingCompassWidgetState extends State<TestingCompassWidget> {
  @override
  void dispose() {
    FlutterCompass().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildManualReader(),
    );
  }

  Widget _buildManualReader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: StreamBuilder<double>(
          stream: FlutterCompass.events,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error reading heading: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            double direction = snapshot.data;
            return Text(
              '$direction',
              style: Theme.of(context).textTheme.button,
            );
          }),
    );
  }
}*/
//}