import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../data/databases/shared_preferences_db.dart';
import '../../data/models/apiModels/laguages_model_model.dart';
import '../../widgets/topNavBar.dart';
import 'controllers/change_language.controller.dart';

class ChangeLanguageScreen extends GetView<ChangeLanguageController> {
  const ChangeLanguageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: TopNavBar(
        title: "changeLanguage".tr.toUpperCase(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'languageSetting'.tr,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                color: Color(0xff2bad4b),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'changeLanguageYouWantToUse'.tr,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
                color: Color(0xff4a4a4a),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Obx(
              () => DropdownButtonFormField<LaguagesModel>(
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xff2bad4b),
                ),
                isExpanded: true,
                elevation: 16,
                style: const TextStyle(
                    letterSpacing: 0.1, color: Color(0xff4a4a4a)),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xffe7fff9),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xff2bad4b)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xff2bad4b)),
                  ),
                ),
                onChanged: (LaguagesModel? value) {
                  controller.list.refresh();
                  if (value != null) {
                    setLaguage(value);
                    var locale =
                        Locale(value.languageCode!, value.countryCode!);
                    Get.updateLocale(locale);
                  }
                },
                items: controller.list.map<DropdownMenuItem<LaguagesModel>>(
                    (LaguagesModel value) {
                  return DropdownMenuItem<LaguagesModel>(
                    value: value,
                    child: Text(value.languageName!),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
