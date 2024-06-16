import 'package:saidi_s_application3/presentation/warehouse_tab/warehouse_tab.dart';

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
      body: TabBarView(
        controller: controller.tabviewController,
        children: [
          DashboardTab(),
          ServiceProviderTab(),
          WarehouseTab(),
        ],
      ),
    );
  }
}
