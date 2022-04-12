import 'package:geolocator/geolocator.dart';

///Taken and modified from https://api.azanpro.com/zone/zones.json#
///As suggested by Aizal Manan
import 'location_coordinate_model.dart';

class LocationCoordinate {
  static final List<LocationCoordinateData> _locationCoordinate = [];

  /// Return nearest JAKIM code from the given coordinate and negeri.
  /// Pass administrative area as negeri.
  static String getJakimCodeNearby(
      double latitude, double longitude, String negeri) {
    List<int> tempIndex = [];
    double nearestDistance = 50; //init distance to be 50 km
    late int nearestIndex;

    for (var i = 0; i < _locationCoordinate.length; i++) {
      if (_locationCoordinate[i].negeri == negeri) {
        // collect index of the same negeri
        tempIndex.add(i);
      }
    }

    for (var index in tempIndex) {
      // calculate distance each of indexes location with user location
      double distance = Geolocator.distanceBetween(latitude, longitude,
          _locationCoordinate[index].lat!, _locationCoordinate[index].lng!);
      // distance returned in meter

      if (distance.compareTo(nearestDistance) == -1) {
        // check the shortest distance
        nearestDistance = distance;
        nearestIndex = index;
      }
    }
    // return the nearby jakim code
    return _locationCoordinate[nearestIndex].zone;
  }
}
