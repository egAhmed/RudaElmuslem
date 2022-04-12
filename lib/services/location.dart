import 'package:geolocator/geolocator.dart';

class LocationAlarm {
  // singleton_start
  static final LocationAlarm _location = LocationAlarm._internal();

  factory LocationAlarm() {
    instance++;
    return _location;
  }

  LocationAlarm._internal(); // private constructor

  static int instance = 0;
  // singleton_end

  late double latitude;
  late double longitude;
  late Position _position;

  Future<void> getCurrentLocation() async {
    try {
      //_position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      _position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low,);
      latitude = _position.latitude;
      longitude = _position.longitude;
      print('getCurrentLocation exited');
    } catch (e) {
      throw 'Problem with the location request';
    }
  }
}
