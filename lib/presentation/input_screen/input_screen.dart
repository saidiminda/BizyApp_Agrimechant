import 'package:saidi_s_application3/presentation/input_collection_tab/input_collection_tab.screen.dart';

import '../../core/utils/show_dialogs.dart';
import '../../widgets/topNavBar.dart';
import '../input_collection_tab/models/member_orders_request_model.dart';
import '../iphone_14_plus_two_page/iphone_14_plus_two_page.dart';
import 'controller/input_controller.dart';
import 'package:flutter/material.dart';
import 'package:saidi_s_application3/core/app_export.dart';
import 'package:saidi_s_application3/widgets/custom_elevated_button.dart';

import 'widgets/listsaidimindas_item_widget.dart';

class InputScreen extends GetWidget<InputController> {
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        appBar: TopNavBar(
          title: "msg_bizytech_profiling".tr.toUpperCase(),
          appBarPreferredSize: kToolbarHeight * 2,
          bottom: PreferredSize(
            child: Container(
              height: kToolbarHeight,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: theme.colorScheme.onPrimaryContainer,
              ),
              child: TabBar(
                controller: controller.tabviewController,
                labelPadding: EdgeInsets.zero,
                labelColor: appTheme.black900,
                labelStyle: TextStyle(
                  fontSize: 12.fSize,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelColor: appTheme.black900,
                unselectedLabelStyle: TextStyle(
                  fontSize: 12.fSize,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                ),
                indicatorColor: appTheme.indicatorColor,
                tabs: [
                  Tab(
                    child: Text("lbl_oda_zote".tr.toUpperCase(),
                        style: theme.textTheme.labelLarge),
                  ),
                  Tab(
                    child: Text("msg_oda_zilizolipiwa".tr.toUpperCase(),
                        style: theme.textTheme.labelLarge),
                  ),
                  CustomElevatedButton(
                      height: 35.v,
                      width: 109.h,
                      text: "lbl_oda_mpya".tr.toUpperCase(),
                      margin: EdgeInsets.only(top: 14.v, right: 15.h),
                      rightIcon: Container(
                          margin: EdgeInsets.only(left: 10.h),
                          child: CustomImageView(
                              svgPath: ImageConstant.imgMinimize)),
                      buttonStyle: CustomButtonStyles.fillGreen,
                      alignment: Alignment.topRight)
                ],
              ),
            ),
            preferredSize: Size.fromHeight(kToolbarHeight + 2),
          ),
        ),
        body: TabBarView(
          controller: controller.tabviewController,
          children: [
            Obx(
              () => Column(
                children: [
                  Padding(
                      padding:
                          EdgeInsets.only(left: 33.h, top: 15.v, right: 26.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 8.v, bottom: 5.v),
                                child: Text("lbl_filter_by".tr,
                                    style: theme.textTheme.labelLarge)),
                            CustomElevatedButton(
                                height: 33.v,
                                width: (controller.ussdOrder.value &&
                                        !controller.appOrder.value)
                                    ? 110.h
                                    : 88.h,
                                text: "lbl_oda_za_ussd".tr,
                                margin: EdgeInsets.only(left: 27.h),
                                rightIcon: (controller.ussdOrder.value &&
                                        !controller.appOrder.value)
                                    ? Container(
                                        padding: EdgeInsets.all(3.h),
                                        margin: EdgeInsets.only(left: 5.h),
                                        decoration: BoxDecoration(
                                            color: appTheme.green900),
                                        child: CustomImageView(
                                            svgPath: ImageConstant.imgClose))
                                    : null,
                                buttonStyle: (controller.ussdOrder.value &&
                                        !controller.appOrder.value)
                                    ? CustomButtonStyles.fillGreen
                                    : CustomButtonStyles.fillGrayTL5,
                                buttonTextStyle: theme.textTheme.labelMedium!,
                                onTap: () {
                                  controller.appOrder.value = false;
                                  controller.ussdOrder.value =
                                      !controller.ussdOrder.value;
                                }),
                            CustomElevatedButton(
                                height: 33.v,
                                width: (!controller.ussdOrder.value &&
                                        controller.appOrder.value)
                                    ? 110.h
                                    : 84.h,
                                text: "lbl_oda_za_app".tr,
                                margin: EdgeInsets.only(left: 14.h),
                                rightIcon: (!controller.ussdOrder.value &&
                                        controller.appOrder.value)
                                    ? Container(
                                        padding: EdgeInsets.all(3.h),
                                        margin: EdgeInsets.only(left: 5.h),
                                        decoration: BoxDecoration(
                                            color: appTheme.green900),
                                        child: CustomImageView(
                                            svgPath: ImageConstant.imgClose))
                                    : null,
                                buttonStyle: (!controller.ussdOrder.value &&
                                        controller.appOrder.value)
                                    ? CustomButtonStyles.fillGreen
                                    : CustomButtonStyles.fillGrayTL5,
                                buttonTextStyle: theme.textTheme.labelMedium!,
                                onTap: () {
                                  controller.appOrder.value =
                                      !controller.appOrder.value;
                                  controller.ussdOrder.value = false;
                                }),
                            Container(
                                width: 36.h,
                                margin: EdgeInsets.only(
                                    left: 7.h, top: 5.v, bottom: 6.v),
                                child: Text("lbl_chagua_tarehe".tr,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.labelSmall!
                                        .copyWith(height: 1.11))),
                            CustomImageView(
                                svgPath: controller.filterByDate.value
                                    ? ImageConstant.imgCalendar2886665Black900
                                    : ImageConstant.imgCalendar2886665,
                                height: 27.adaptSize,
                                width: 27.adaptSize,
                                margin: EdgeInsets.only(
                                    left: 8.h, top: 3.v, bottom: 3.v))
                          ])),
                  Expanded(
                    child: Padding(
                        padding:
                            EdgeInsets.only(left: 8.h, top: 19.v, right: 8.h),
                        child: Obx(() => ListView.separated(
                            // physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 11.5.v),
                                  child: SizedBox(
                                      width: 411.h,
                                      child: Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray100)));
                            },
                            itemCount:
                                controller.iphone14PlusFiveModelObj.length,
                            itemBuilder: (context, index) {
                              MemberOrdersRequest model =
                                  controller.iphone14PlusFiveModelObj[index];
                              return ListsaidimindasItemWidget(model,
                                  onTapAnkara: () {
                                    showReciptDealog(model);
                              });
                            }))),
                  ),
                ],
              ),
            ),
            Iphone14PlusTwoPage(),
            InputCollectionTabScreen(),
          ],
        ));
  }
}
