import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/bloc/pray_read_json.dart';
import 'package:rudaelmoslem/constants/constants.dart';
import 'package:rudaelmoslem/constants/staticVirable.dart';
import 'package:rudaelmoslem/custom_painter/prayer.dart';
import 'package:rudaelmoslem/models/jakim_esolat_model.dart';
import 'package:rudaelmoslem/notificationUtil/notification_scheduler.dart';
import 'package:rudaelmoslem/provider/location_provider.dart';
import 'package:rudaelmoslem/settings/prayer_setting.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/utilts/erorrspray.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

import '../RawPrayDataHandler.dart';
import 'design2.dart';

class Body extends StatefulWidget {
  final JakimEsolatModel? prayerTime;
  Body({Key? key, this.prayerTime}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var prayerTime = PrayerSetting();
  //late PrayReadJson _bloc ;
  //PrayerTimes prayer ;

  @override
  void initState() {
    //prayer = prayerTime.getTodayTime(widget.latitude, widget.longitude) as PrayerTimes;
    super.initState();
    //_bloc = PrayReadJson();
    //PreventUpdatingNotifs.setNow();
  }

  @override
  Widget build(BuildContext context) {
    
    var prayerTimeData = widget.prayerTime?.prayerTime;

    if (GetStorage().read(kStoredShouldUpdateNotif)) {
      //schedule notification if needed
      MyNotifScheduler.schedulePrayNotification(
          PrayDataHandler.removePastDate(prayerTimeData!));
    }

    return Design2(prayerTimeData: prayerTimeData,);
  }
}
