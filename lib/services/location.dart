import 'package:geolocator/geolocator.dart';

class Location {
  double? Latitude;
  double? Longitude;
  Future<void> getLocation() async {
    try {
      if (await Geolocator.checkPermission() == LocationPermission.denied) {
        LocationPermission permission;
        permission = await Geolocator.requestPermission();
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      Latitude = position.latitude;
      Longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
