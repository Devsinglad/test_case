
import 'package:geolocator/geolocator.dart';



class Maps{
  Position? currentPosition;



  /// Get location Permission
  Future<Position> getLocationPermission() async {
    bool locationEnabled = await Geolocator.isLocationServiceEnabled();

    if (!locationEnabled) {
      return Future.error('Location disabled');
    }

    LocationPermission locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
    }

    if (locationPermission == LocationPermission.denied) {
      return Future.error('Location permissions denied');
    }

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  }


}