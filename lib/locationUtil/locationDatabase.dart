///Latest is coming from https://mpt.i906.my/code.html
///All location data get from https://api.azanpro.com/reference/zone/grouped based on JAKIM website
///Previosly, location data is fetch from JSON https://gist.github.com/fareezMaple/02648187370acb6db11e20ee143e471e also come from same API.
import 'location.dart';

class LocationDatabase {
  static final List<Location> _locationDatabase = [];
  
  static get allLocationData => _locationDatabase;

  static int indexOfLocation(String jakimCode) => _locationDatabase
      .indexWhere((element) => element.jakimCode == jakimCode.toUpperCase());

  /// Length of all location data
  static int getLength() => _locationDatabase.length;

  static String negeri(String jakimCode) {
    jakimCode = jakimCode.toUpperCase();
    var res =
        _locationDatabase.where((element) => element.jakimCode == jakimCode);

    if (res.isEmpty) {
      throw 'Not found. Check location code if entered correctly.';
    }

    return res.first.negeri;
  }

  static daerah(String jakimCode) {
    jakimCode = jakimCode.toUpperCase();
    var res =
        _locationDatabase.where((element) => element.jakimCode == jakimCode);

    if (res.isEmpty) {
      throw 'Not found. Check location code if entered correctly.';
    }

    return res.first.daerah;
  }

  @Deprecated(
      'Migration: Using JAKIM CODE directly instead. No longer using index.')
  static String getJakimCode(int index) => _locationDatabase[index].jakimCode;

  @Deprecated('Use negeri instead')
  static String getNegeri(int index) => _locationDatabase[index].negeri;

  @Deprecated('Use daerah instead')
  static String getDaerah(int index) => _locationDatabase[index].daerah;
}
