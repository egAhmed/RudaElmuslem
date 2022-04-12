class LocationCoordinateData {
  /// Jakim zone
  String zone;
  String? negeri;
  String? lokasi;
  String? country;
  double? lat;
  double? lng;
  LocationCoordinateData(
      {required this.zone,
      required this.negeri,
      required this.lokasi,
      required this.lat,
      required this.country,
      required this.lng});
}
