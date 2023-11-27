import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saidi_s_application3/core/utils/size_utils.dart';

import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';

// import '../core/utils/functions/global.dart';
// import '../routes/app_pages.dart';

// This is the type used by the popup menu below.
enum SampleItem { itemZero, itemOne, itemTwo, itemThree }

// ignore: must_be_immutable
class TopNavBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  PreferredSizeWidget? bottom;
  double? appBarPreferredSize;
  TopNavBar({
    Key? key,
    this.bottom,
    this.appBarPreferredSize = kToolbarHeight,
    this.title = "Home",
  }) : super(key: key);

  SampleItem? selectedMenu;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: appTheme.green90001,
      leading: Center(
        child: PopupMenuButton<SampleItem>(
          initialValue: selectedMenu,
          // Callback that sets the selected popup menu item.
          onSelected: (SampleItem item) {
            selectedMenu = item;
            // if (item == SampleItem.itemOne) {
            //   Get.toNamed(Routes.CHANGE_PASSWORD_PAGE);
            // } else if (item == SampleItem.itemTwo) {
            //   // Get.toNamed(Routes.SETTING_PAGE);
            // } else if (item == SampleItem.itemThree) {
            //   logOut();
            // }
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
            PopupMenuItem<SampleItem>(
              value: SampleItem.itemZero,
              child: Container(
                height: 46.2,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x28c1c1c1),
                      offset: Offset(0, 1),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Container(
                      height: 20.0,
                      width: 20.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/settings_icon.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'settings'.tr,
                      style: const TextStyle(
                        fontFamily: 'Informative',
                        fontSize: 18,
                        color: Color(0xff2d3c49),
                        fontWeight: FontWeight.w500,
                      ),
                      textHeightBehavior: const TextHeightBehavior(
                          applyHeightToFirstAscent: false),
                    ),
                  ],
                ),
              ),
            ),
            PopupMenuItem<SampleItem>(
              value: SampleItem.itemOne,
              child: Container(
                height: 46.2,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x28c1c1c1),
                      offset: Offset(0, 1),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    Center(
                      child: Container(
                        height: 20.0,
                        width: 20.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/lock_icon.png'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'changePassword'.tr,
                      style: const TextStyle(
                        fontFamily: 'Informative',
                        fontSize: 18,
                        color: Color(0xff2d3c49),
                        fontWeight: FontWeight.w500,
                      ),
                      textHeightBehavior: const TextHeightBehavior(
                          applyHeightToFirstAscent: false),
                    ),
                  ],
                ),
              ),
            ),
            PopupMenuItem<SampleItem>(
              value: SampleItem.itemTwo,
              child: Container(
                height: 46.2,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x28c1c1c1),
                      offset: Offset(0, 1),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    Center(
                      child: Container(
                        height: 20.0,
                        width: 20.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/change_language_icon.png'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'changeLanguage'.tr,
                      style: const TextStyle(
                        fontFamily: 'Informative',
                        fontSize: 18,
                        color: Color(0xff2d3c49),
                        fontWeight: FontWeight.w500,
                      ),
                      textHeightBehavior: const TextHeightBehavior(
                          applyHeightToFirstAscent: false),
                    ),
                  ],
                ),
              ),
            ),
            PopupMenuItem<SampleItem>(
              value: SampleItem.itemThree,
              child: Container(
                height: 46.2,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x28c1c1c1),
                      offset: Offset(0, 1),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      child: Center(
                        child: Container(
                          height: 20.0,
                          width: 20.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/logout_icon.png'),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'logout'.tr,
                      style: const TextStyle(
                        fontFamily: 'Informative',
                        fontSize: 19,
                        color: Color(0xff2d3c49),
                        fontWeight: FontWeight.w500,
                      ),
                      textHeightBehavior: const TextHeightBehavior(
                          applyHeightToFirstAscent: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(top: 2.v),
        child: Text(
          title.toString(),
          style: CustomTextStyles.titleSmallOnPrimaryContainer,
        ),
      ),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(appBarPreferredSize ?? kToolbarHeight);
}
