
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

class SmsController extends GetxController {

  void listenForCode() async {
    await SmsAutoFill().listenForCode();
  }
}