import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class AppProvider extends ChangeNotifier {
  int number = 0;
  String address = "";
  double lat = 0;
  double lon = 0;
  List<Placemark> placeMarks = [];

  void incrementNumber() {
    number++;
    notifyListeners();
  }

  void getLocation() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      final position = await Geolocator.getCurrentPosition();
      lat = position.latitude;
      lon = position.longitude;

      placeMarks = await placemarkFromCoordinates(lat, lon);

      if (placeMarks.isNotEmpty) {
        address = '${placeMarks[0].name}, ${placeMarks[0].street}, ${placeMarks[0].subLocality}, ${placeMarks[0].country}, ${placeMarks[0].postalCode}';
      }
    } else {
      Geolocator.requestPermission();
    }
    notifyListeners();
  }


}
