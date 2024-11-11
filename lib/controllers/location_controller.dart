
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {

  String address = "";
  double lat = 0;
  double lon = 0;
  List<Placemark> placeMarks = [];

  void getLocation() async {
    try {
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
        await Geolocator.requestPermission();
      }
      update();
    } catch (e) {
      address = "Failed to fetched the location !!";
      update();
    }
  }

}