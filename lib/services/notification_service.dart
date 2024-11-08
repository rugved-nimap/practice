import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService() {
    initializeNotification();
  }

  Future<void> _requestPermission() async {
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  void initializeNotification() async {
    await _requestPermission();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void showInstantNotification() async {
    await _flutterLocalNotificationsPlugin.show(
      0,
      'title',
      'body',
      const NotificationDetails(
        android: AndroidNotificationDetails('instant_id', 'instant_name',
            channelDescription: 'instant_description',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false),
      ),
    );
  }

  void showRepeatedNotification() async {
    await _flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      'title',
      'body',
      RepeatInterval.everyMinute,
      const NotificationDetails(
        android: AndroidNotificationDetails('repeated_id', 'repeated_name',
            channelDescription: 'repeated_description',
            importance: Importance.max,
            priority: Priority.high),
      ),
      androidScheduleMode: AndroidScheduleMode.exact,
    );
  }

  void cancelAllNotification() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}
