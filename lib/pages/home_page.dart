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
          gridTile(
            context,
            'location',
            Icons.pin_drop_rounded,
            Colors.blueAccent,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LocationPage(),
                ),
              );
            },
          ),
          gridTile(
            context,
            'sms autofill',
            Icons.sms_outlined,
            Colors.deepPurple,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SmsPage(),
                ),
              );
            },
          ),
          gridTile(
            context,
            'notification',
            Icons.notifications,
            Colors.lightGreen,
            () {
              NotificationService().initializeNotification();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationPage(),
                ),
              );
            },
          ),
          gridTile(
            context,
            'localization',
            Icons.language,
            Colors.redAccent,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LocalizationPage(),
                ),
              );
            },
          ),
          gridTile(
            context,
            'camera',
            Icons.camera,
            Colors.amber,
            () {
              Provider.of<AppProvider>(context, listen: false)
                  .setupCameraController();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CameraPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget gridTile(BuildContext context, String localeText, IconData icon,
      Color color, VoidCallback action) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FilledButton.icon(
        onPressed: action,
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(color),
        ),
        icon: Icon(icon),
        label: Text(context.tr(localeText)),
      ),
    );
  }
}
