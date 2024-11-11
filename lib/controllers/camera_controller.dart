import 'package:camera/camera.dart';
import 'package:gal/gal.dart';
import 'package:get/get.dart';

class MyCameraController extends GetxController {
  late List<CameraDescription> cameras;
  CameraController? cameraController;
  int currentCameraIndex = 0;
  bool isVideoModeOn = false;

  @override
  void onInit() {
    super.onInit();
    setupCameraController();
  }

  Future<void> setupCameraController() async {
    try {
      cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        cameraController = CameraController(cameras[currentCameraIndex], ResolutionPreset.high);
        await cameraController?.initialize();
        update();
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  void takePicture() async {
    try {
      if (cameraController != null) {
        final XFile picture = await cameraController!.takePicture();
        Gal.putImage(picture.path);
      }
    } catch (e) {
      print('Error taking picture: $e');
    }
  }

  void toggleCameraMode() async {
    try {
      if (cameraController != null) {
        if (isVideoModeOn) {
          isVideoModeOn = false;
        } else {
          await cameraController!.prepareForVideoRecording();
          isVideoModeOn = true;
        }
        update();
      }
    } catch (e) {
      print('Error changing camera mode: $e');
    }
  }

  void changeCamera() async {
    try {
      if (cameras.isNotEmpty) {
        currentCameraIndex = (currentCameraIndex + 1) % cameras.length;
        await cameraController?.dispose();
        cameraController = CameraController(cameras[currentCameraIndex], ResolutionPreset.high);
        await cameraController?.initialize();
        update();
      }
    } catch (e) {
      print('Error changing camera: $e');
    }
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }
}
