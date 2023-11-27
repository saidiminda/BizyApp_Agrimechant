import '../../core/utils/show_dialogs.dart';
import '../iphone_14_plus_two_page/widgets/listsaidimindas3_item_widget.dart';
import 'controller/iphone_14_plus_two_controller.dart';
import 'models/iphone_14_plus_two_model.dart';
import 'models/listsaidimindas3_item_model.dart';
import 'package:flutter/material.dart';
import 'package:saidi_s_application3/core/app_export.dart';

// ignore_for_file: must_be_immutable
class Iphone14PlusTwoPage extends StatelessWidget {
  Iphone14PlusTwoPage({Key? key}) : super(key: key);

  Iphone14PlusTwoController controller =
      Get.put(Iphone14PlusTwoController(Iphone14PlusTwoModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(left: 8.h, top: 16.v, right: 8.h),
            child: Column(children: [
              Padding(
                  padding: EdgeInsets.only(left: 25.h, right: 17.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 7.v, bottom: 4.v),
                            child: Text("lbl_filter_by".tr,
                                style: theme.textTheme.labelLarge)),
                        Spacer(),
                        Container(
                            width: 36.h,
                            margin: EdgeInsets.only(top: 2.v, bottom: 3.v),
                            child: Text("lbl_chagua_tarehe".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.labelSmall!
                                    .copyWith(height: 1.11))),
                        CustomImageView(
                            svgPath: ImageConstant.imgCalendar2886665Black900,
                            height: 27.adaptSize,
                            width: 27.adaptSize,
                            margin: EdgeInsets.only(left: 8.h))
                      ])),
              SizedBox(height: 20.v),
              Expanded(
                child: Obx(() => ListView.separated(
                    // physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.symmetric(vertical: 14.0.v),
                          child: SizedBox(
                              width: 411.h,
                              child: Divider(
                                  height: 1.v,
                                  thickness: 1.v,
                                  color: appTheme.blueGray100)));
                    },
                    itemCount: controller.iphone14PlusTwoModelObj.value
                        .listsaidimindas3ItemList.value.length,
                    itemBuilder: (context, index) {
                      Listsaidimindas3ItemModel model = controller
                          .iphone14PlusTwoModelObj
                          .value
                          .listsaidimindas3ItemList
                          .value[index];
                      return Listsaidimindas3ItemWidget(model,
                          onTapOnarisiti: () {
                        onTapOnarisiti();
                      });
                    })),
              ),
            ])));
  }

  /// Navigates to the reciptOneScreen when the action is triggered.
  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the reciptOneScreen.
  onTapOnarisiti() {
    showReciptOneDealog();
  }

  /// Navigates to the reciptOneScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the reciptOneScreen.
  onTapOnarisiti1() {
    showReciptOneDealog();
  }
}
