import '../../widgets/custom_elevated_button.dart';
import '../../widgets/topNavBar.dart';
import 'controller/questionnaire_dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:saidi_s_application3/core/app_export.dart';

// ignore_for_file: must_be_immutable
class QuestionnaireDashboardScreen
    extends GetWidget<QuestionnaireDashboardController> {
  const QuestionnaireDashboardScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        appBar: TopNavBar(
          title: "profiling".tr.toUpperCase(),
        ),
        body: SizedBox(
            width: mediaQueryData.size.width,
            child: SingleChildScrollView(
                child: Column(children: [
              Padding(
                  padding: EdgeInsets.only(left: 27.h, top: 42.v, right: 27.h),
                  child: Column(children: [
                    Text(
                        "${"producers".tr} ${"and".tr} ${"aggregators".tr}"
                            .tr
                            .toUpperCase(),
                        style: CustomTextStyles.titleMediumGreen900Bold),
                    Text("${"producers".tr} & ${"aggregators".tr}".tr,
                        style: theme.textTheme.labelLarge),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 42.h, top: 19.v, right: 42.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                      AppRoutes.producersManagementScreen,
                                      arguments: {
                                        "type": "new",
                                        "farmer": null
                                      });
                                },
                                child: Container(
                                    decoration: AppDecoration
                                        .fillOnPrimaryContainer
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SizedBox(height: 21.v),
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgTrophy,
                                              height: 69.v,
                                              width: 70.h),
                                          SizedBox(height: 14.v),
                                          CustomElevatedButton(
                                              height: 40.v,
                                              width: 132.h,
                                              text:
                                                  "producers".tr.toUpperCase(),
                                              buttonStyle: CustomButtonStyles
                                                  .fillGreenBL10,
                                              buttonTextStyle:
                                                  theme.textTheme.labelMedium!)
                                        ])),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                      AppRoutes.aggregatorsManagementScreen);
                                },
                                child: Container(
                                    margin: EdgeInsets.only(left: 26.h),
                                    decoration: AppDecoration
                                        .fillOnPrimaryContainer
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SizedBox(height: 21.v),
                                          CustomImageView(
                                              imagePath: ImageConstant.imgFile,
                                              height: 69.v,
                                              width: 70.h),
                                          SizedBox(height: 14.v),
                                          CustomElevatedButton(
                                              height: 40.v,
                                              width: 132.h,
                                              text: "aggregators"
                                                  .tr
                                                  .toUpperCase(),
                                              buttonStyle: CustomButtonStyles
                                                  .fillGreenBL10,
                                              buttonTextStyle:
                                                  theme.textTheme.labelMedium!)
                                        ])),
                              )
                            ])),
                    SizedBox(height: 60.v),
                    Text(
                        "${"logistics".tr} ${"and".tr} ${"warehousing".tr}"
                            .toUpperCase(),
                        style: CustomTextStyles.titleMediumGreen900),
                    Text("${"logistics".tr} & ${"warehousing".tr}",
                        style: theme.textTheme.labelLarge),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 42.h, top: 15.v, right: 42.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                      AppRoutes.warehouseManagementScreen);
                                },
                                child: Container(
                                    decoration: AppDecoration
                                        .fillOnPrimaryContainer
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SizedBox(height: 23.v),
                                          Icon(
                                            Icons.warehouse,
                                            size: 60,
                                            color: appTheme.green90001,
                                          ),
                                          SizedBox(height: 21.v),
                                          CustomElevatedButton(
                                              height: 40.v,
                                              width: 132.h,
                                              text:
                                                  "warehouses".tr.toUpperCase(),
                                              buttonStyle: CustomButtonStyles
                                                  .fillGreenBL10,
                                              buttonTextStyle:
                                                  theme.textTheme.labelMedium!)
                                        ])),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                        AppRoutes.logisticsManagementScreen);
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(left: 26.h),
                                      decoration: AppDecoration
                                          .fillOnPrimaryContainer
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder10),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(height: 27.v),
                                            Icon(
                                              Icons.local_shipping,
                                              size: 60,
                                              color: appTheme.green90001,
                                            ),
                                            SizedBox(height: 24.v),
                                            CustomElevatedButton(
                                                height: 40.v,
                                                width: 132.h,
                                                text: "logistics"
                                                    .tr
                                                    .toUpperCase(),
                                                buttonStyle: CustomButtonStyles
                                                    .fillGreenBL10,
                                                buttonTextStyle: theme
                                                    .textTheme.labelMedium!)
                                          ])))
                            ])),
                    SizedBox(height: 60.v),
                    Text(
                        "${"inputsSupplier".tr} & ${"equipmentProvider".tr}"
                            .tr
                            .toUpperCase(),
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.titleMediumGreen900),
                    Text("${"inputsSupplier".tr} & ${"equipmentProvider".tr}",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.labelLarge),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 42.h, top: 15.v, right: 42.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                      AppRoutes.inputSupplierManagementScreen);
                                },
                                child: Container(
                                    decoration: AppDecoration
                                        .fillOnPrimaryContainer
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SizedBox(height: 23.v),
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgTrashGreen90001,
                                              height: 60.v,
                                              width: 55.h),
                                          SizedBox(height: 21.v),
                                          CustomElevatedButton(
                                              height: 40.v,
                                              width: 132.h,
                                              text: "inputsSupplier"
                                                  .tr
                                                  .toUpperCase(),
                                              buttonStyle: CustomButtonStyles
                                                  .fillGreenBL10,
                                              buttonTextStyle:
                                                  theme.textTheme.labelMedium!)
                                        ])),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Get.toNamed(AppRoutes
                                        .equipmentProviderrManagementScreen);
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(left: 26.h),
                                      decoration: AppDecoration
                                          .fillOnPrimaryContainer
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder10),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(height: 27.v),
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgFile,
                                                height: 60.adaptSize,
                                                width: 55.adaptSize),
                                            SizedBox(height: 24.v),
                                            CustomElevatedButton(
                                                height: 40.v,
                                                width: 132.h,
                                                text: "equipmentProvider"
                                                    .tr
                                                    .toUpperCase(),
                                                buttonStyle: CustomButtonStyles
                                                    .fillGreenBL10,
                                                buttonTextStyle: theme
                                                    .textTheme.labelMedium!)
                                          ])))
                            ])),
                    SizedBox(height: 42.v),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 34.h, vertical: 18.v),
                        decoration: AppDecoration.fillOnPrimaryContainer
                            .copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder10),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Container(
                              width: 287.h,
                              margin: EdgeInsets.only(left: 8.h, right: 10.h),
                              child: Text(
                                  "msg_pakua_au_tuma_taafira".tr.toUpperCase(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyles.labelMediumBlack900
                                      .copyWith(height: 1.30))),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 14.h, top: 20.v, bottom: 5.v),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: Container(
                                            margin:
                                                EdgeInsets.only(right: 10.h),
                                            decoration: AppDecoration
                                                .fillGreen90001
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder7),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  SizedBox(height: 20.v),
                                                  Text("lbl_pakua_taarifa".tr,
                                                      style: CustomTextStyles
                                                          .labelLargeOnPrimaryContainer),
                                                  SizedBox(height: 23.v),
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgBookmark,
                                                      height: 23.adaptSize,
                                                      width: 23.adaptSize)
                                                ]))),
                                    Expanded(
                                        child: Container(
                                            margin: EdgeInsets.only(left: 10.h),
                                            decoration: AppDecoration
                                                .fillGreen90001
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder7),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  SizedBox(height: 20.v),
                                                  Text("lbl_tuma_taarifa".tr,
                                                      style: CustomTextStyles
                                                          .labelLargeOnPrimaryContainer),
                                                  SizedBox(height: 23.v),
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgUpload,
                                                      height: 23.adaptSize,
                                                      width: 23.adaptSize)
                                                ])))
                                  ]))
                        ]))
                  ]))
            ]))));
  }

  onTapColumnfileone() {
    Get.toNamed(
      AppRoutes.inputScreen,
    );
  }
}
