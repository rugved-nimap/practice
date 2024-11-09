import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:practice/pages/camera_page.dart';
import 'package:practice/pages/localization_page.dart';
import 'package:practice/pages/notification_page.dart';
import 'package:practice/pages/sms_page.dart';
import 'package:practice/services/notification_service.dart';
import 'package:practice/state_manage/app_provider.dart';
import 'package:provider/provider.dart';

import 'location_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('practice')),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AppProvider>().themeChange();
            },
            icon: Icon(context.read<AppProvider>().isDarkMode
                ? Icons.sunny
                : Icons.nightlight_round_outlined),
          )
        ],
      ),
      body: GridView(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        padding: const EdgeInsets.all(5),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LocationPage(),
                  ),
                );
              },
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                backgroundColor: const WidgetStatePropertyAll(Colors.blue),
              ),
              icon: const Icon(Icons.pin_drop_rounded),
              label: Text(context.tr('location')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SmsPage(),
                  ),
                );
              },
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                backgroundColor:
                    const WidgetStatePropertyAll(Colors.deepPurple),
              ),
              icon: const Icon(Icons.sms_outlined),
              label: Text(context.tr('sms autofill')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton.icon(
              onPressed: () {
                NotificationService().initializeNotification();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationPage(),
                  ),
                );
              },
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                backgroundColor:
                    const WidgetStatePropertyAll(Colors.lightGreen),
              ),
              icon: const Icon(Icons.notifications),
              label: Text(context.tr('notification')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LocalizationPage(),
                  ),
                );
              },
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                backgroundColor: const WidgetStatePropertyAll(Colors.redAccent),
              ),
              icon: const Icon(Icons.language),
              label: Text(context.tr('localization')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton.icon(
              onPressed: () {
                // Provider.of<AppProvider>(context, listen: false).setupCameraController();
                context.read<AppProvider>().setupCameraController();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CameraPage(),
                  ),
                );
              },
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                backgroundColor: const WidgetStatePropertyAll(Colors.amber),
              ),
              icon: const Icon(Icons.camera),
              label: Text(context.tr('camera')),
            ),
          ),
        ],
      ),
    );
  }
}
