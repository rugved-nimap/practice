
import 'package:get/get.dart';
import 'package:practice/services/notification_service.dart';

class NotificationController extends GetxController {

  final NotificationService _notificationService = NotificationService();

  @override
  void onInit() {
    _notificationService.initializeNotification();
    super.onInit();
  }

  void getInstantNotification() {
    _notificationService.showInstantNotification();
  }

  void getRepeatedNotification() {
    _notificationService.showRepeatedNotification();
  }

  void cancelAllNotification() {
    _notificationService.cancelAllNotification();
  }


}