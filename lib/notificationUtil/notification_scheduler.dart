import 'package:azan_local_notifications/azan_local_notifications.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rudaelmoslem/constants/constants.dart';
import 'package:rudaelmoslem/settings/NotificationSettingPage.dart';
import 'package:rudaelmoslem/utilts/debug_toast.dart';
import 'package:timezone/timezone.dart' hide LocationDatabase;
import '../models/jakim_esolat_model.dart';
import '../locationUtil/locationDatabase.dart';
import 'notifications_helper.dart';

class MyNotifScheduler {
  static void schedulePrayNotification(List<PrayerTimeNotifi> times) async {
    await AzanLocalNotificationsPlugin().cancelAll(); //reset all
    var _currentDateTime = DateTime.now();

    print(_currentDateTime);

    // String currentDaerah =
    //     LocationDatabase.daerah(GetStorage().read(kStoredLocationJakimCode));

    //if true, notification is scheduled by at most 7 days
    if (GetStorage().read(kStoredNotificationLimit)) {
      times = times.take(7).toList();
    }
    // for debug dialog
    GetStorage().write(kNumberOfNotifsScheduled, times.length);

    MyNotificationType _notifType =
        MyNotificationType.values[GetStorage().read(kNotificationType)];

    switch (_notifType) {
      case MyNotificationType.noazan:
        DebugToast.show('Notification: Default sound');
        _defaultScheduler(
          times,
          _currentDateTime,
        );
        break;
      case MyNotificationType.azan:
        // DebugToast.show('Notification: Azan');
        _azanScheduler(
          times,
          _currentDateTime,
        );
        break;
    }

    scheduleAlertNotification(
      id: 2190,
      title: 'Monthly refresh reminder',
      body:
          'To continue receive prayer notification, open app at least once every month.',
      payload: kPayloadMonthly,
      // if month (12 + 1) = 13, it will auto-increment to next year
      //2021-01-01 00:05:00.000+0800
      scheduledTime: TZDateTime.local(
          _currentDateTime.year, _currentDateTime.month + 1, 1, 0, 5),
    );

    //This timestamp is later used to determine wether notification should be updated or not
    GetStorage()
        .write(kStoredLastUpdateNotif, DateTime.now().millisecondsSinceEpoch);

    print(kStoredLastUpdateNotif);
  }

  /// Classic Notification Scheduler, default notification sound
  static void _defaultScheduler(
    List<PrayerTimeNotifi> times,
    DateTime currentDateTime,
  ) async {
    for (var dayTime in times) {
      DateTime subuhDateTime =
          DateTime.fromMillisecondsSinceEpoch(dayTime.times![1]);
      DateTime syurukDateTime =
          DateTime.fromMillisecondsSinceEpoch(dayTime.times![2]);
      DateTime zuhrDateTime =
          DateTime.fromMillisecondsSinceEpoch(dayTime.times![3]);
      DateTime asarDateTime =
          DateTime.fromMillisecondsSinceEpoch(dayTime.times![4]);
      DateTime maghribDateTime =
          DateTime.fromMillisecondsSinceEpoch(dayTime.times![5]);
      DateTime isyakDateTime =
          DateTime.fromMillisecondsSinceEpoch(dayTime.times![6]);

      if (subuhDateTime.isAfter(currentDateTime)) {
        //to make sure the time is in future
        await scheduleSinglePrayerNotification(
          name: 'Fajr',
          id: int.parse(
              subuhDateTime.millisecondsSinceEpoch.toString().substring(5)),
          title: 'It\'s Subuh',
          scheduledTime: TZDateTime.from(subuhDateTime, local),
          body: 'in ',
        );
      }
      if (syurukDateTime.isAfter(currentDateTime)) {
        await scheduleSinglePrayerNotification(
          name: 'Syuruk',
          id: int.parse(
              syurukDateTime.millisecondsSinceEpoch.toString().substring(5)),
          title: 'It\'s Syuruk',
          body: 'in ',
          summary: 'Ends of Subuh',
          scheduledTime: TZDateTime.from(syurukDateTime, local),
        );
      }
      if (zuhrDateTime.isAfter(currentDateTime)) {
        await scheduleSinglePrayerNotification(
          name: 'Zuhr',
          id: int.parse(
              zuhrDateTime.millisecondsSinceEpoch.toString().substring(5)),
          title: 'It\'s Zohor',
          body: 'in ',
          summary:
              zuhrDateTime.weekday == DateTime.friday ? 'Salam Jumaat' : null,
          scheduledTime: TZDateTime.from(zuhrDateTime, local),
        );
      }
      if (asarDateTime.isAfter(currentDateTime)) {
        await scheduleSinglePrayerNotification(
          name: 'Asr',
          id: int.parse(
              asarDateTime.millisecondsSinceEpoch.toString().substring(5)),
          title: 'It\'s Asar',
          body: 'in ',
          scheduledTime: TZDateTime.from(asarDateTime, local),
        );
      }
      if (maghribDateTime.isAfter(currentDateTime)) {
        await scheduleSinglePrayerNotification(
          name: 'Maghrib',
          id: int.parse(
              maghribDateTime.millisecondsSinceEpoch.toString().substring(5)),
          title: 'It\'s Maghrib',
          body: 'in ',
          scheduledTime: TZDateTime.from(maghribDateTime, local),
        );
      }
      if (isyakDateTime.isAfter(currentDateTime)) {
        await scheduleSinglePrayerNotification(
          name: 'Isya\'',
          id: int.parse(
              isyakDateTime.millisecondsSinceEpoch.toString().substring(5)),
          title: 'It\'s Isyak',
          body: 'in ',
          scheduledTime: TZDateTime.from(isyakDateTime, local),
        );
      }
    }
  }

  /// Notification but with azan
  static void _azanScheduler(
    List<PrayerTimeNotifi> times,
    DateTime currentDateTime,
  ) async {
    var _azanSoundName = GetStorage().read(kAzanSoundName);

    for (var dayTime in times) {
      DateTime subuhDateTime =
          DateTime.fromMillisecondsSinceEpoch(dayTime.times![1]);
      DateTime syurukDateTime =
          DateTime.fromMillisecondsSinceEpoch(dayTime.times![2]);
      DateTime zuhrDateTime =
          DateTime.fromMillisecondsSinceEpoch(dayTime.times![3]);
      DateTime asarDateTime =
          DateTime.fromMillisecondsSinceEpoch(dayTime.times![4]);
      DateTime maghribDateTime =
          DateTime.fromMillisecondsSinceEpoch(dayTime.times![5]);
      DateTime isyakDateTime =
          DateTime.fromMillisecondsSinceEpoch(dayTime.times![6]);

      if (subuhDateTime.isAfter(currentDateTime)) {
        //to make sure the time is in future
        await scheduleSingleAzanNotification(
            name: 'Fajr',
            id: int.parse(
                subuhDateTime.millisecondsSinceEpoch.toString().substring(5)),
            title: 'It\'s Subuh',
            scheduledTime: TZDateTime.from(subuhDateTime, local),
            body: 'in ',
            customSound: _azanSoundName);
      }
      if (syurukDateTime.isAfter(currentDateTime)) {
        await scheduleSinglePrayerNotification(
          name: 'Syuruk',
          id: int.parse(
              syurukDateTime.millisecondsSinceEpoch.toString().substring(5)),
          title: 'It\'s Syuruk',
          body: 'in ',
          summary: 'Ends of Subuh',
          scheduledTime: TZDateTime.from(syurukDateTime, local),
        );
      }
      if (zuhrDateTime.isAfter(currentDateTime)) {
        await scheduleSingleAzanNotification(
            name: 'Zuhr',
            id: int.parse(
                zuhrDateTime.millisecondsSinceEpoch.toString().substring(5)),
            title: 'It\'s Zohor',
            body: 'in ',
            summary:
                zuhrDateTime.weekday == DateTime.friday ? 'Salam Jumaat' : null,
            scheduledTime: TZDateTime.from(zuhrDateTime, local),
            customSound: _azanSoundName);
      }
      if (asarDateTime.isAfter(currentDateTime)) {
        await scheduleSingleAzanNotification(
            name: 'Asr',
            id: int.parse(
                asarDateTime.millisecondsSinceEpoch.toString().substring(5)),
            title: 'It\'s Asar',
            body: 'in ',
            scheduledTime: TZDateTime.from(asarDateTime, local),
            customSound: _azanSoundName);
      }
      if (maghribDateTime.isAfter(currentDateTime)) {
        await scheduleSingleAzanNotification(
            name: 'Maghrib',
            id: int.parse(
                maghribDateTime.millisecondsSinceEpoch.toString().substring(5)),
            title: 'It\'s Maghrib',
            body: 'in ',
            scheduledTime: TZDateTime.from(maghribDateTime, local),
            customSound: _azanSoundName);
      }
      if (isyakDateTime.isAfter(currentDateTime)) {
        await scheduleSingleAzanNotification(
            name: 'Isya\'',
            id: int.parse(
                isyakDateTime.millisecondsSinceEpoch.toString().substring(5)),
            title: 'It\'s Isyak',
            body: 'in ',
            scheduledTime: TZDateTime.from(isyakDateTime, local),
            customSound: _azanSoundName);
      }
    }
  }
}
