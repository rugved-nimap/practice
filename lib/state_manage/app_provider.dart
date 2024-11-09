import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class AppProvider extends ChangeNotifier {
  String address = "";
  double lat = 0;
  double lon = 0;
  List<Placemark> placeMarks = [];
  bool isDarkMode = false;
  List<CameraDescription> cameras = [];
  CameraController? controller;
  int currentCameraIndex = 0;
  bool isVideoModeOn = false;


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
      notifyListeners();
    } catch (e) {
      address = "Failed to fetched the location !!";
    }
  }

  void themeChange() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  Future<void> setupCameraController() async {
    try {
      cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        controller = CameraController(cameras[0], ResolutionPreset.high);
        await controller?.initialize().then((value) {
          notifyListeners();
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void takePicture() async {
    try {
      XFile picture = await controller!.takePicture();
      Gal.putImage(picture.path);
    } catch (e) {
      print('Error: $e');
    }
  }

  void changeCameraMode() async {
    try {
      if (cameras.isNotEmpty) {
        if (isVideoModeOn) {
          controller?.prepareForVideoRecording();
        } else {

        }

      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void changeCamera() async {
    try {
      if (cameras.isNotEmpty) {
        if (currentCameraIndex == 0) {
          currentCameraIndex = 1;
        } else {
          currentCameraIndex = 0;
        }
        controller?.dispose();
        controller = CameraController(cameras[currentCameraIndex], ResolutionPreset.high);
        await controller?.initialize();
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

}
