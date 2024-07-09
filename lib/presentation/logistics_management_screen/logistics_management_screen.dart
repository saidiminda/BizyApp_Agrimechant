import 'package:get/get.dart';
import 'package:saidi_s_application3/core/utils/size_utils.dart';

import '../../core/utils/functions/global.dart';
import '../../data/models/apiModels/register_farmer_request_model.dart';
import '../../data/models/questionnaires_request_model.dart';
import '../../routes/app_routes.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/topNavBar.dart';
import 'controller/logistics_management_controller.dart';
import 'package:flutter/material.dart';

class LogisticsManagementScreen
    extends GetWidget<LogisticsManagementController> {
  const LogisticsManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: TopNavBar(
        appBarPreferredSize: kToolbarHeight * 2.5,
        title: "logisticsManagement".tr.toUpperCase(),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Column(
              children: [
                _buildAppBar(),
              ],
            )),
      ),
      body: Obx(
        () => SizedBox(
            width: double.maxFinite,
            child: Column(children: [
              SizedBox(height: 24.v),
              Expanded(
                  child: SingleChildScrollView(
                      child: Container(
                          margin: EdgeInsets.only(bottom: 5.v),
                          padding: EdgeInsets.symmetric(horizontal: 3.h),
                          child: Column(children: [
                            Visibility(
                              visible: (controller.localRegisterFarmerRequest
                                          .value.questionnaireResponse ??
                                      [])
                                  .isNotEmpty,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Table(
                                    columnWidths: const <int, TableColumnWidth>{
                                      0: FixedColumnWidth(50),
                                      1: FlexColumnWidth(),
                                      2: FlexColumnWidth(),
                                      3: FlexColumnWidth(),
                                    },
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    children: <TableRow>[
                                      TableRow(
                                        children: <Widget>[
                                          const Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Text(
                                              'No.',
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 12,
                                                color: Color(0xff2bad4b),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Text(
                                              'name'.tr,
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 10,
                                                color: Color(0xff2bad4b),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              'lbl_phone_number'.tr,
                                              style: const TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 10,
                                                color: Color(0xff2bad4b),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              'action'.tr,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 10,
                                                color: Color(0xff2bad4b),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Divider(
                                      color: appTheme.blueGray100,
                                      indent: 3.h,
                                      endIndent: 3.h),
                                  Obx(
                                    () => Table(
                                      columnWidths: const <int,
                                          TableColumnWidth>{
                                        0: FixedColumnWidth(50),
                                        1: FlexColumnWidth(),
                                        2: FlexColumnWidth(),
                                        3: FlexColumnWidth(),
                                      },
                                      defaultVerticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      children: <TableRow>[
                                        for (QuestionnaireResponse item
                                            in controller
                                                    .localRegisterFarmerRequest
                                                    .value
                                                    .questionnaireResponse ??
                                                [])
                                          TableRow(
                                            decoration: BoxDecoration(
                                              color: (controller.localRegisterFarmerRequest.value
                                                                      .questionnaireResponse ??
                                                                  [])
                                                              .indexOf(item) %
                                                          2 <
                                                      1
                                                  ? Color(0xffe7fff9)
                                                  : Colors.transparent,
                                            ),
                                            children: <Widget>[
                                              Center(
                                                child: Text(
                                                  "${(controller.localRegisterFarmerRequest.value.questionnaireResponse ?? []).indexOf(item) + 1}",
                                                  style: theme
                                                      .textTheme.titleSmall!
                                                      .copyWith(
                                                          color: appTheme
                                                              .black900),
                                                ),
                                              ),
                                              Text(
                                                (item.basicInformation ??
                                                        BasicInformation())
                                                    .nameOfEntity
                                                    .toString()
                                                    .toUpperCase(),
                                                style: CustomTextStyles
                                                    .titleMediumGray90016
                                                    .copyWith(
                                                        color:
                                                            appTheme.gray900),
                                              ),
                                              TableCell(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Text(
                                                    "${((item.basicInformation ?? BasicInformation()).contactPerson ?? ContactPerson()).phoneNo}",
                                                    style: CustomTextStyles
                                                        .titleMediumGray90016
                                                        .copyWith(
                                                            color: appTheme
                                                                .gray900),
                                                  ),
                                                ),
                                              ),
                                              TableCell(
                                                child: Center(
                                                  child: PopupMenuButton<
                                                      SampleItem>(
                                                    initialValue:
                                                        controller.selectedMenu,
                                                    // Callback that sets the selected popup menu item.
                                                    onSelected:
                                                        (SampleItem item1) {
                                                      controller.selectedMenu =
                                                          item1;
                                                      if (item1 ==
                                                          SampleItem.itemZero) {
                                                        // controller
                                                        //     .showFamerBottomSheet(
                                                        //         item);
                                                      } else if (item1 ==
                                                          SampleItem.itemOne) {
                                                        Get.toNamed(
                                                                AppRoutes
                                                                    .logisticsRegistrationScreen,
                                                                arguments: {
                                                              "type": item
                                                                  .registrationStatus,
                                                              "questionnair":
                                                                  item
                                                            })!
                                                            .then((value) {
                                                          controller
                                                              .getLocalData();
                                                        });
                                                      } else if (item1 ==
                                                          SampleItem.itemTwo) {
                                                        if (item.editingStatus !=
                                                            1) {
                                                          Get.defaultDialog(
                                                            title: "Thibitisha",
                                                            middleText:
                                                                "Unahuakika unataka kufuta taarifa za ${item.basicInformation!.nameOfEntity}",
                                                            middleTextStyle:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .red),
                                                            textCancel: "no"
                                                                .tr
                                                                .toUpperCase(),
                                                            textConfirm: "yes"
                                                                .tr
                                                                .toUpperCase(),
                                                            onCancel: () {
                                                              // Get.back();
                                                            },
                                                            onConfirm: () {
                                                              controller
                                                                  .localRegisterFarmerRequest
                                                                  .value
                                                                  .questionnaireResponse!
                                                                  .remove(item);
                                                              controller
                                                                  .localRegisterFarmerRequest
                                                                  .refresh();
                                                              // setFarmerLocalData(
                                                              //     controller
                                                              //         .localRegisterFarmerRequest
                                                              //         .value);
                                                              Get.back();
                                                            },
                                                          );
                                                        } else {
                                                          showErrorToast(
                                                              "Hauwezi kufuta mkulima amefanyiwa kazi");
                                                        }
                                                      }
                                                    },
                                                    itemBuilder: (BuildContext
                                                            context) =>
                                                        <PopupMenuEntry<
                                                            SampleItem>>[
                                                      PopupMenuItem<SampleItem>(
                                                        value:
                                                            SampleItem.itemZero,
                                                        child: Container(
                                                          height: 46.2,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0xffffffff),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                color: Color(
                                                                    0x28c1c1c1),
                                                                offset: Offset(
                                                                    0, 1),
                                                                blurRadius: 10,
                                                              ),
                                                            ],
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 8,
                                                                ),
                                                                const Icon(
                                                                  Icons
                                                                      .remove_red_eye_outlined,
                                                                  // color: Colors
                                                                  //     .red,
                                                                ),
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  'view'.tr,
                                                                  style:
                                                                      const TextStyle(
                                                                    fontFamily:
                                                                        'Informative',
                                                                    fontSize:
                                                                        18,
                                                                    color: Color(
                                                                        0xff2d3c49),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                  textHeightBehavior:
                                                                      const TextHeightBehavior(
                                                                          applyHeightToFirstAscent:
                                                                              false),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      PopupMenuItem<SampleItem>(
                                                        value:
                                                            SampleItem.itemOne,
                                                        child: Container(
                                                          height: 46.2,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0xffffffff),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                color: Color(
                                                                    0x28c1c1c1),
                                                                offset: Offset(
                                                                    0, 1),
                                                                blurRadius: 10,
                                                              ),
                                                            ],
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              children: [
                                                                const SizedBox(
                                                                    width: 8),
                                                                const Icon(
                                                                  Icons.edit,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  'edit'.tr,
                                                                  style:
                                                                      const TextStyle(
                                                                    fontFamily:
                                                                        'Informative',
                                                                    fontSize:
                                                                        18,
                                                                    color: Color(
                                                                        0xff2d3c49),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                  textHeightBehavior:
                                                                      const TextHeightBehavior(
                                                                          applyHeightToFirstAscent:
                                                                              false),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      PopupMenuItem<SampleItem>(
                                                        value:
                                                            SampleItem.itemTwo,
                                                        child: Container(
                                                          height: 46.2,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0xffffffff),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                color: Color(
                                                                    0x28c1c1c1),
                                                                offset: Offset(
                                                                    0, 1),
                                                                blurRadius: 10,
                                                              ),
                                                            ],
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 8,
                                                                ),
                                                                const Icon(
                                                                  Icons.delete,
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  'delete'.tr,
                                                                  style:
                                                                      const TextStyle(
                                                                    fontFamily:
                                                                        'Informative',
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .red,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                  textHeightBehavior:
                                                                      const TextHeightBehavior(
                                                                          applyHeightToFirstAscent:
                                                                              false),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]))))
            ])),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppBar() {
    return Container(
        color: Colors.white,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(right: 34.h),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          onTapArrowDown();
                                        },
                                        child: Container(
                                            height: 58.v,
                                            width: 83.h,
                                            margin:
                                                EdgeInsets.only(bottom: 6.v),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 27.h,
                                                vertical: 16.v),
                                            child: Icon(
                                              Icons.arrow_back_rounded,
                                              size: 27,
                                            ))),
                                    CustomOutlinedButton(
                                        height: 42.v,
                                        width: 150.h,
                                        text: "addNew".tr,
                                        margin: EdgeInsets.only(top: 22.v),
                                        buttonStyle:
                                            CustomButtonStyles.fillBlue,
                                        onPressed: () {
                                          onTapAddFarmer();
                                        })
                                  ])),
                          SizedBox(height: 20.v),
                          Padding(
                            padding: EdgeInsets.only(left: 23.h),
                            child: Text(
                              "logisticsList".tr,
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                          Divider(
                              color: appTheme.blueGray100,
                              indent: 3.h,
                              endIndent: 3.h),
                          SizedBox(width: 145.h, child: Divider(indent: 23.h))
                        ]),
                  ]))
        ]));
  }

  /// Navigates to the dashboardScreen when the action is triggered.
  onTapArrowDown() {
    Get.back();
  }

  /// Navigates to the farmerRegistrationScreen when the action is triggered.
  onTapAddFarmer() {
    Get.toNamed(AppRoutes.logisticsRegistrationScreen,
            arguments: {"type": "new", "farmer": Farmers()})!
        .then((value) {
      controller.getLocalData();
    });
  }
}
