

import 'package:rudaelmoslem/models/jakim_esolat_model.dart';

final int day = DateTime.now().day;

class PrayDataHandler {
  /// return prayer times for today and the future, past days are removed
  static List<PrayerTimeNotifi> removePastDate(List<PrayerTimeNotifi> times) =>
      times.sublist(day - 1);

  static List<int>? todayPrayData(List<PrayerTimeNotifi> times) =>
      times[day - 1].times;
}
