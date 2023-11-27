import '../../widgets/topNavBar.dart';
import 'controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:saidi_s_application3/core/app_export.dart';
import 'package:saidi_s_application3/presentation/dashboard_tab/dashboard_tab.dart';
import 'package:saidi_s_application3/presentation/service_provider_tab/service_provider_tab.dart';

// ignore_for_file: must_be_immutable
class DashboardScreen extends GetWidget<DashboardController> {
  const DashboardScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      appBar: TopNavBar(
        title: "msg_bizytech_profiling".tr.toUpperCase(),
        appBarPreferredSize: kToolbarHeight * 2,
        bottom: PreferredSize(
          child: Container(
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 40.v),
                Container(
                  height: 24.v,
                  width: 427.h,
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
                        child: Text(
                          "lbl_wakulima".tr,
                        ),
                      ),
                      Tab(
                        child: Text(
                          "lbl_watoa_huduma".tr,
                        ),
                      ),
                      Tab(
                        child: Text(
                          "lbl_maghala".tr,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight + 2),
        ),
      ),
      body: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   decoration: AppDecoration.fillOnPrimaryContainer,
              //   child: Column(
              //     children: [
              //       // Container(
              //       //   height: 23.v,
              //       //   width: double.maxFinite,
              //       //   decoration: BoxDecoration(
              //       //     color: appTheme.green900,
              //       //   ),
              //       // ),
              //       Container(
              //         width: double.maxFinite,
              //         padding: EdgeInsets.symmetric(
              //           horizontal: 23.h,
              //           vertical: 18.v,
              //         ),
              //         decoration: AppDecoration.fillGreen90001,
              //         child: Row(
              //           children: [
              //             CustomImageView(
              //               svgPath: ImageConstant.imgMenu,
              //               height: 18.v,
              //               width: 26.h,
              //               margin: EdgeInsets.only(top: 2.v),
              //             ),
              //             Spacer(
              //               flex: 45,
              //             ),
              //             Padding(
              //               padding: EdgeInsets.only(top: 2.v),
              //               child: Text(
              //                 "msg_bizytech_profiling".tr.toUpperCase(),
              //                 style:
              //                     CustomTextStyles.titleSmallOnPrimaryContainer,
              //               ),
              //             ),
              //             Spacer(
              //               flex: 54,
              //             ),
              //             CustomImageView(
              //               svgPath: ImageConstant.imgGroup9,
              //               height: 18.v,
              //               width: 1.h,
              //               margin: EdgeInsets.only(
              //                 top: 2.v,
              //                 right: 9.h,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 787.v,
                child: TabBarView(
                  controller: controller.tabviewController,
                  children: [
                    DashboardTab(),
                    ServiceProviderTab(),
                    ServiceProviderTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
