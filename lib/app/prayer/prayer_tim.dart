import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/bloc/pray_read_json.dart';
import 'package:rudaelmoslem/models/jakim_esolat_model.dart';
import 'package:rudaelmoslem/notificationUtil/prevent_update_notifs.dart';
import 'package:rudaelmoslem/provider/location_provider.dart';
import 'package:rudaelmoslem/utilts/erorrspray.dart';
import 'components/body.dart';

class PrayerTimeAdhan extends StatefulWidget {
  //final double? latitude ;
  //final double? longitude ;

  const PrayerTimeAdhan({
    Key? key,
    //this.latitude, this.longitude
  }) : super(key: key);

  @override
  _PrayerTimeAdhanState createState() => _PrayerTimeAdhanState();
}

class _PrayerTimeAdhanState extends State<PrayerTimeAdhan> {
  // late PrayReadJson _bloc ;

  @override
  void initState() {
    super.initState();
    //_bloc = PrayReadJson();
    PreventUpdatingNotifs.setNow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LocationProvider>(
        builder: (context, value, child) {
          return FutureBuilder<JakimEsolatModel>(
            future: PrayReadJson.fetchMptNow(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return Body(
                  prayerTime: snapshot.data,
                );
              } else {
                //print(snapshot.error);
                return ErrorPray(
                  errorMessage: snapshot.error.toString(),
                  onRetryPressed: () => setState(() {}),
                );
              }
            },
          );
        },
      ),
    );
  }
}
