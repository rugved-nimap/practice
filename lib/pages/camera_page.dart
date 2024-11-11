import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/camera_controller.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCameraController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('camera'.tr),
          ),
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: controller.cameraController != null
                ? CameraPreview(controller.cameraController!,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // IconButton(
                            //   onPressed: () {},
                            //   icon: const Icon(
                            //     Icons.photo,
                            //     size: 30,
                            //     color: Colors.white,
                            //   ),
                            // ),
                            const SizedBox(
                              width: 24,
                            ),
                            IconButton(
                              onPressed: () {
                                controller.takePicture();
                              },
                              icon: const Icon(
                                Icons.camera,
                                size: 65,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.changeCamera();
                              },
                              icon: const Icon(
                                Icons.settings_backup_restore,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        );
      },
    );
  }
}
