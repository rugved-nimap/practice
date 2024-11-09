import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:practice/services/notification_service.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('notification')),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    NotificationService().showInstantNotification();
                  },
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.lightGreen),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                  ),
                  child: Text(context.tr('instant'), style: const TextStyle(color: Colors.white, fontSize: 16),),
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    NotificationService().showRepeatedNotification();
                  },
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.lightGreen),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                  ),
                  child: Text(context.tr('repeated'), style: const TextStyle(color: Colors.white, fontSize: 16),),
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    NotificationService().cancelAllNotification();
                  },
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.lightGreen),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                  ),
                  child: Text(context.tr('cancel'), style: const TextStyle(color: Colors.white, fontSize: 16),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
