import 'controller/dashboard_tab_controller.dart';
import 'models/dashboard_tab_model.dart';
import 'package:flutter/material.dart';
import 'package:saidi_s_application3/core/app_export.dart';
import 'package:saidi_s_application3/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class DashboardTab extends StatelessWidget {
  DashboardTab({Key? key}) : super(key: key);

  DashboardTabController controller =
      Get.put(DashboardTabController(DashboardTabModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    child: Column(children: [
                  Padding(
                      padding:
                          EdgeInsets.only(left: 27.h, top: 42.v, right: 27.h),
                      child: Column(children: [
                        Text("msg_maelezo_ya_mkulima".tr.toUpperCase(),
                            style: CustomTextStyles.titleMediumGreen900Bold),
                        Text("msg_kusimamia_taarifa".tr,
                            style: theme.textTheme.labelLarge),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 42.h, top: 19.v, right: 42.h),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
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
                                                svgPath:
                                                    ImageConstant.imgTrophy,
                                                height: 69.v,
                                                width: 70.h),
                                            SizedBox(height: 14.v),
                                            CustomElevatedButton(
                                                height: 40.v,
                                                width: 132.h,
                                                text: "lbl_ongeza_mkulima"
                                                    .tr
                                                    .toUpperCase(),
                                                buttonStyle: CustomButtonStyles
                                                    .fillGreenBL10,
                                                buttonTextStyle: theme
                                                    .textTheme.labelMedium!)
                                          ])),
                                  Container(
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
                                                svgPath: ImageConstant
                                                    .imgLayer1Lime700,
                                                height: 69.v,
                                                width: 70.h),
                                            SizedBox(height: 14.v),
                                            CustomElevatedButton(
                                                height: 40.v,
                                                width: 132.h,
                                                text: "lbl_wakulima"
                                                    .tr
                                                    .toUpperCase(),
                                                buttonStyle: CustomButtonStyles
                                                    .fillGreenBL10,
                                                buttonTextStyle: theme
                                                    .textTheme.labelMedium!)
                                          ]))
                                ])),
                        SizedBox(height: 60.v),
                        Text("msg_shughuli_za_mkulima".tr.toUpperCase(),
                            style: CustomTextStyles.titleMediumGreen900),
                        Text("msg_afisa_ugani_na_ruzuku".tr,
                            style: theme.textTheme.labelLarge),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 42.h, top: 15.v, right: 42.h),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
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
                                                svgPath: ImageConstant
                                                    .imgTrashGreen90001,
                                                height: 60.v,
                                                width: 55.h),
                                            SizedBox(height: 21.v),
                                            CustomElevatedButton(
                                                height: 40.v,
                                                width: 132.h,
                                                text: "lbl_output"
                                                    .tr
                                                    .toUpperCase(),
                                                buttonStyle: CustomButtonStyles
                                                    .fillGreenBL10,
                                                buttonTextStyle: theme
                                                    .textTheme.labelMedium!)
                                          ])),
                                  GestureDetector(
                                      onTap: () {
                                        onTapColumnfileone();
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(left: 26.h),
                                          decoration: AppDecoration
                                              .fillOnPrimaryContainer
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder10),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                SizedBox(height: 27.v),
                                                CustomImageView(
                                                    svgPath:
                                                        ImageConstant.imgFile,
                                                    height: 60.adaptSize,
                                                    width: 55.adaptSize),
                                                SizedBox(height: 24.v),
                                                CustomElevatedButton(
                                                    height: 40.v,
                                                    width: 132.h,
                                                    text: "lbl_input"
                                                        .tr
                                                        .toUpperCase(),
                                                    buttonStyle:
                                                        CustomButtonStyles
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
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                      width: 287.h,
                                      margin: EdgeInsets.only(
                                          left: 8.h, right: 10.h),
                                      child: Text(
                                          "msg_pakua_au_tuma_taafira"
                                              .tr
                                              .toUpperCase(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: CustomTextStyles
                                              .labelMediumBlack900
                                              .copyWith(height: 1.30))),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 14.h, top: 20.v, bottom: 5.v),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                child: Container(
                                                    margin: EdgeInsets.only(
                                                        right: 10.h),
                                                    decoration: AppDecoration
                                                        .fillGreen90001
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder7),
                                                    child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          SizedBox(
                                                              height: 20.v),
                                                          Text(
                                                              "lbl_pakua_taarifa"
                                                                  .tr,
                                                              style: CustomTextStyles
                                                                  .labelLargeOnPrimaryContainer),
                                                          SizedBox(
                                                              height: 23.v),
                                                          CustomImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgBookmark,
                                                              height:
                                                                  23.adaptSize,
                                                              width:
                                                                  23.adaptSize)
                                                        ]))),
                                            Expanded(
                                                child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10.h),
                                                    decoration: AppDecoration
                                                        .fillGreen90001
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder7),
                                                    child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          SizedBox(
                                                              height: 20.v),
                                                          Text(
                                                              "lbl_tuma_taarifa"
                                                                  .tr,
                                                              style: CustomTextStyles
                                                                  .labelLargeOnPrimaryContainer),
                                                          SizedBox(
                                                              height: 23.v),
                                                          CustomImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgUpload,
                                                              height:
                                                                  23.adaptSize,
                                                              width:
                                                                  23.adaptSize)
                                                        ])))
                                          ]))
                                ]))
                      ]))
                ])))));
  }

  /// Navigates to the iphone14PlusFiveScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the iphone14PlusFiveScreen.
  onTapColumnfileone() {
    Get.toNamed(
      AppRoutes.inputScreen,
    );
  }
}
