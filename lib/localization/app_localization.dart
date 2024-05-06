import 'package:get/get.dart';
import 'en_us/en_us_translations.dart';
import 'sw_tz/sw_tz_translations.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en_US': enUs, 'sw_TZ': swTZ};
}
