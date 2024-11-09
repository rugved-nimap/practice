import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:practice/state_manage/app_provider.dart';
import 'package:provider/provider.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('camera')),
      ),
      body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: FutureBuilder<void>(
            future: context.read<AppProvider>().setupCameraController(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return CameraPreview(context.read<AppProvider>().controller!,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // IconButton(
                            //   onPressed: () {
                            //     Provider.of<AppProvider>(context, listen: false)
                            //         .changeCamera();
                            //   },
                            //   icon: const Icon(
                            //     Icons.settings_backup_restore,
                            //     size: 30,
                            //     color: Colors.white,
                            //   ),
                            // ),
                            IconButton(
                                onPressed: () {
                                  context.read<AppProvider>().takePicture();
                                },
                                icon: const Icon(
                                  Icons.camera,
                                  size: 65,
                                  color: Colors.white,
                                )),
                            // IconButton(
                            //   onPressed: () {},
                            //   icon: const Icon(
                            //     Icons.photo,
                            //     size: 30,
                            //     color: Colors.white,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ));
              }
            },
          )),
    );
  }
}
