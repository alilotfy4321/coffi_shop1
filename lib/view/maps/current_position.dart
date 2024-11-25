// ignore_for_file: avoid_print

import 'package:geolocator/geolocator.dart';

/// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  checkLocationPermessin() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled == false) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      print('service not enaple');
    } else {
      print('service  enaple');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('permission denied');
      }
    }

    if (permission == LocationPermission.whileInUse) {
      print('======= location');
      Position position = await Geolocator.getCurrentPosition();
      print('======= latitude');
      print(position.latitude);
      print('======= latitude');
      print(position.longitude);
    }
    
  }