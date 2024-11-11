
import 'package:get/get.dart';
import 'package:practice/translations/en.dart';
import 'package:practice/translations/hi.dart';

class LocalizationService extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
    'en': en,
    'hi': hi,
  };

}