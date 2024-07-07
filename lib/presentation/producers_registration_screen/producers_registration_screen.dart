import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:get/get.dart';
import 'package:saidi_s_application3/core/utils/size_utils.dart';

import '../../core/utils/image_constant.dart';
import '../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/topNavBar.dart';
import 'controller/producers_registration_controller.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ProducersRegistrationScreen
    extends GetWidget<ProducersRegistrationController> {
  ProducersRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          appBar: TopNavBar(
            title: "producerRegistration".tr.toUpperCase(),
          ),
          body: SizedBox(
            width: mediaQueryData.size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 21.h,
                      top: 23.v,
                      right: 21.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(height: 33.v),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "basicInformation".tr.toUpperCase(),
                            style: CustomTextStyles.titleMediumGreen900Bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "selectTheRelevantCrop".tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        CustomDropDown(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: appTheme.blueGray10002,
                          ),
                          hintText: "selectTheRelevantCrop".tr,
                          items: controller.relevantCropsDropdownList,
                          onChanged: (value) {
                            for (var element
                                in controller.relevantCropsDropdownList) {
                              element.isSelected = false;
                              if (element.id == value.id) {
                                element.isSelected = true;
                                controller.selectedRelevantCrop.value = value;
                              }
                            }
                            controller.relevantCropsDropdownList.refresh();
                          },
                        ),
                        SizedBox(height: 18.v),
                        // Container(
                        //   padding: EdgeInsets.symmetric(
                        //     horizontal: 33.h,
                        //     vertical: 12.v,
                        //   ),
                        //   decoration:
                        //       AppDecoration.fillOnPrimaryContainer.copyWith(
                        //     borderRadius: BorderRadiusStyle.roundedBorder7,
                        //   ),
                        //   child: Row(
                        //     children: [
                        //       CustomImageView(
                        //         imagePath: ImageConstant.imgShield84433431,
                        //         height: 40.adaptSize,
                        //         width: 40.adaptSize,
                        //       ),
                        //       Padding(
                        //         padding: EdgeInsets.only(
                        //           left: 16.h,
                        //           top: 9.v,
                        //           bottom: 10.v,
                        //         ),
                        //         child: Text(
                        //           "lbl_kampuni".tr.toUpperCase(),
                        //           style: CustomTextStyles.titleMediumGray500,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(height: 20.v),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "${"basicInformation".tr.toUpperCase()} (${"detailsOfContactPerson".tr})"
                                .tr
                                .toUpperCase(),
                            style: CustomTextStyles.titleMediumGreen900Bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "nameOfEntity".tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        CustomTextFormField(
                          controller: controller.jinalaController,
                          hintText: "nameOfEntity".tr,
                          hintStyle: theme.textTheme.titleSmall!,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "name".tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        CustomTextFormField(
                          controller: controller.jinaController,
                          hintText: "name".tr,
                          hintStyle: theme.textTheme.titleSmall!,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "lbl_phone_number".tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        CustomTextFormField(
                          controller: controller.nambariyaController,
                          prefix: Container(
                            decoration: AppDecoration.outlineBlueGray.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder7,
                            ),
                            child: Container(
                              height: 49.v,
                              width: 66.h,
                              decoration: BoxDecoration(
                                color: appTheme.green90001,
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(2.h),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: theme.colorScheme.primary,
                                    spreadRadius: 2.h,
                                    blurRadius: 2.h,
                                    offset: Offset(
                                      0,
                                      0,
                                    ),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "lbl_255".tr,
                                  style: CustomTextStyles
                                      .titleMediumOnPrimaryContainer,
                                ),
                              ),
                            ),
                          ),
                          hintText: "lbl_phone_number".tr,
                          hintStyle: theme.textTheme.titleSmall!,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "emailAddress".tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        CustomTextFormField(
                          controller: controller.baruapepeyaController,
                          hintText: "emailAddress".tr,
                          hintStyle: theme.textTheme.titleSmall!,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "dateOfBirth".tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        CustomTextFormField(
                          controller: controller.nambariyatinController,
                          hintText: "dateOfBirth".tr,
                          hintStyle: theme.textTheme.titleSmall!,
                          suffix: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.h,
                              vertical: 10.v,
                            ),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgCalendar,
                              height: 26.v,
                              width: 22.h,
                            ),
                          ),
                          readOnly: true,
                          onTap: () async {
                            var datePicked =
                                await DatePicker.showSimpleDatePicker(context,
                                    initialDate: DateTime(
                                        DateTime.now().year - 18,
                                        DateTime.now().month,
                                        DateTime.now().day),
                                    lastDate: DateTime(
                                        DateTime.now().year - 18,
                                        DateTime.now().month,
                                        DateTime.now().day),
                                    dateFormat: "dd-MMMM-yyyy",
                                    locale: DateTimePickerLocale.en_us,
                                    confirmText: "ok".tr,
                                    cancelText: "cancel".tr,
                                    titleText: 'date'.tr,
                                    looping: false,
                                    textColor: const Color(0xff2bad4b));
                            if (datePicked != null) {
                              controller.nambariyatinController.text =
                                  datePicked.toString().substring(0, 10);
                            }
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "selectLevelOfEducation".tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        CustomDropDown(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: appTheme.blueGray10002,
                          ),
                          hintText: "selectLevelOfEducation".tr,
                          items: controller.educationLevelsDropdownList,
                          onChanged: (value) {
                            for (var element
                                in controller.educationLevelsDropdownList) {
                              element.isSelected = false;
                              if (element.id == value.id) {
                                element.isSelected = true;
                                controller.selectedEducationLevel.value = value;
                              }
                            }
                            controller.educationLevelsDropdownList.refresh();
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "selectVillage".tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        CustomDropDown(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: appTheme.blueGray10002,
                          ),
                          hintText: "selectVillage".tr,
                          value: controller.selectedVillage.value,
                          items: controller.villagesDropdownList,
                          onChanged: (value) {
                            for (var element
                                in controller.villagesDropdownList) {
                              element.isSelected = false;
                              if (element.id == value.id) {
                                element.isSelected = true;
                                controller.selectedVillage.value = value;
                              }
                            }
                            controller.villagesDropdownList.refresh();
                          },
                        ),
                        SizedBox(height: 20.v),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "socioeconomicAndGeneralBusinessDetails"
                                .tr
                                .toUpperCase(),
                            style: CustomTextStyles.titleMediumGreen900Bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "selectTypeOfBusinessRegistrationOrOwnership".tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        CustomDropDown(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: appTheme.blueGray10002,
                          ),
                          hintText:
                              "selectTypeOfBusinessRegistrationOrOwnership".tr,
                          items: controller.businessTypeDropdownList,
                          onChanged: (value) {
                            for (var element
                                in controller.businessTypeDropdownList) {
                              element.isSelected = false;
                              if (element.id == value.id) {
                                element.isSelected = true;
                                controller.selectedBusinessType.value = value;
                              }
                            }
                            controller.businessTypeDropdownList.refresh();
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "selectOtherValueChainActivitiesDoesYourEntityEngageIn"
                                .tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        CustomDropDown(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: appTheme.blueGray10002,
                          ),
                          hintText:
                              "selectOtherValueChainActivitiesDoesYourEntityEngageIn"
                                  .tr,
                          items: controller.otherValueChainsDropdownList,
                          onChanged: (value) {
                            for (var element
                                in controller.otherValueChainsDropdownList) {
                              element.isSelected = false;
                              if (element.id == value.id) {
                                element.isSelected = true;
                                controller.selectedOtherValueChain.value =
                                    value;
                              }
                            }
                            controller.otherValueChainsDropdownList.refresh();
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "whichOfTheOtherValueChainsDoYouOperateIn".tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        CustomTextFormField(
                          controller: controller
                              .otherValueChainsDoYouOperateInController,
                          hintText:
                              "whichOfTheOtherValueChainsDoYouOperateIn".tr,
                          hintStyle: theme.textTheme.titleSmall!,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "totalAnnualSalesOverThePastThreeYears".tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        Column(
                          children: [
                            Table(
                              columnWidths: const <int, TableColumnWidth>{
                                0: FixedColumnWidth(64),
                                1: FlexColumnWidth(),
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: <TableRow>[
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        'year'.tr.toUpperCase(),
                                        style: const TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                          color: Color(0xff2bad4b),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: SizedBox(
                                        width: 20.0,
                                        height: 15.0,
                                        child: Text(
                                          'annualSales'.tr.toUpperCase(),
                                          style: const TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: Color(0xff2bad4b),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Form(
                              // key: controller.sellingFormKey,
                              child: Table(
                                columnWidths: const <int, TableColumnWidth>{
                                  0: FixedColumnWidth(64),
                                  1: FlexColumnWidth(),
                                },
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                children:
                                    controller.annualSalesList.map((sales) {
                                  return TableRow(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                          height: 36.0,
                                          color: const Color(0xffe7fff9),
                                          child: Center(
                                            child: Text(
                                              sales.year
                                                  .toString()
                                                  .toUpperCase(),
                                              style: const TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 11,
                                                color: Color(0xff4a4a4a),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textHeightBehavior:
                                                  const TextHeightBehavior(
                                                      applyHeightToFirstAscent:
                                                          false),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: SizedBox(
                                          height: 36,
                                          child: TextFormField(
                                            // controller: quantityController,
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              sales.sales = int.tryParse(value);
                                            },
                                            validator: (value) {
                                              return;
                                            },
                                            cursorColor:
                                                const Color(0xff2bad4b),
                                            style: const TextStyle(
                                                letterSpacing: 0.1,
                                                color: Color(0xff4a4a4a)),
                                            decoration: const InputDecoration(
                                              filled: true,
                                              fillColor: Color(0xffe7fff9),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Color(0xff2bad4b)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Color(0xff2bad4b)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "whatIsYourAnnualCostOfOperationsPleaseProvideInformationInTheTableBelow"
                                .tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        Column(
                          children: [
                            Table(
                              columnWidths: const <int, TableColumnWidth>{
                                0: FlexColumnWidth(),
                                1: FlexColumnWidth()
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: <TableRow>[
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        'categoryOfCost'.tr.toUpperCase(),
                                        style: const TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                          color: Color(0xff2bad4b),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: SizedBox(
                                        width: 20.0,
                                        height: 15.0,
                                        child: Text(
                                          'costAmountGHS'.tr.toUpperCase(),
                                          style: const TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: Color(0xff2bad4b),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Form(
                              // key: controller.sellingFormKey,
                              child: Table(
                                columnWidths: const <int, TableColumnWidth>{
                                  0: FlexColumnWidth(),
                                  1: FlexColumnWidth()
                                },
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                children: [
                                  "inputCostIncludingFertilizer".tr,
                                  "laborCost".tr,
                                  "otherOperationalCost".tr
                                ].map((order) {
                                  return TableRow(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                          height: 36.0,
                                          color: const Color(0xffe7fff9),
                                          child: Text(
                                            order.toString().toUpperCase(),
                                            style: const TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 11,
                                              color: Color(0xff4a4a4a),
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textHeightBehavior:
                                                const TextHeightBehavior(
                                                    applyHeightToFirstAscent:
                                                        false),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: SizedBox(
                                          height: 36,
                                          child: TextFormField(
                                            // controller: quantityController,
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              if ("inputCostIncludingFertilizer"
                                                      .tr ==
                                                  order) {
                                                controller.annualCost.value
                                                        .generalExpenses =
                                                    int.tryParse(value);
                                              } else if ("laborCost".tr ==
                                                  order) {
                                                controller.annualCost.value
                                                        .laborCost =
                                                    int.tryParse(value);
                                              } else if ("otherOperationalCost"
                                                      .tr ==
                                                  order) {
                                                controller.annualCost.value
                                                        .operationCosts =
                                                    int.tryParse(value);
                                              }
                                            },
                                            validator: (value) {
                                              return;
                                            },
                                            cursorColor:
                                                const Color(0xff2bad4b),
                                            style: const TextStyle(
                                                letterSpacing: 0.1,
                                                color: Color(0xff4a4a4a)),
                                            decoration: const InputDecoration(
                                              filled: true,
                                              fillColor: Color(0xffe7fff9),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Color(0xff2bad4b)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Color(0xff2bad4b)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "numberOfEmployees".tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        Column(
                          children: [
                            Table(
                              columnWidths: const <int, TableColumnWidth>{
                                0: FlexColumnWidth(),
                                1: FixedColumnWidth(64),
                                2: FixedColumnWidth(64)
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: <TableRow>[
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        'type'.tr.toUpperCase(),
                                        style: const TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                          color: Color(0xff2bad4b),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: SizedBox(
                                        width: 20.0,
                                        height: 15.0,
                                        child: Text(
                                          'male'.tr.toUpperCase(),
                                          style: const TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: Color(0xff2bad4b),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        'female'.tr.toUpperCase(),
                                        style: const TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                          color: Color(0xff2bad4b),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Form(
                              // key: controller.sellingFormKey,
                              child: Table(
                                columnWidths: const <int, TableColumnWidth>{
                                  0: FlexColumnWidth(),
                                  1: FixedColumnWidth(64),
                                  2: FixedColumnWidth(64),
                                },
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                children: controller.employees.map((employee) {
                                  return TableRow(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                          height: 36.0,
                                          color: const Color(0xffe7fff9),
                                          child: Text(
                                            employee.title
                                                .toString()
                                                .toUpperCase(),
                                            style: const TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 11,
                                              color: Color(0xff4a4a4a),
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textHeightBehavior:
                                                const TextHeightBehavior(
                                                    applyHeightToFirstAscent:
                                                        false),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: SizedBox(
                                          height: 36,
                                          child: TextFormField(
                                            // controller: quantityController,
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              employee.male =
                                                  int.tryParse(value);
                                            },
                                            validator: (value) {
                                              return;
                                            },
                                            cursorColor:
                                                const Color(0xff2bad4b),
                                            style: const TextStyle(
                                                letterSpacing: 0.1,
                                                color: Color(0xff4a4a4a)),
                                            decoration: const InputDecoration(
                                              filled: true,
                                              fillColor: Color(0xffe7fff9),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Color(0xff2bad4b)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Color(0xff2bad4b)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: SizedBox(
                                          height: 36,
                                          child: TextFormField(
                                            // controller: quantityController,
                                            keyboardType: TextInputType.number,
                                            validator: (value) {
                                              return;
                                            },
                                            onChanged: (value) {
                                              employee.female =
                                                  int.tryParse(value);
                                            },
                                            cursorColor:
                                                const Color(0xff2bad4b),
                                            style: const TextStyle(
                                                letterSpacing: 0.1,
                                                color: Color(0xff4a4a4a)),
                                            decoration: const InputDecoration(
                                              filled: true,
                                              fillColor: Color(0xffe7fff9),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Color(0xff2bad4b)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Color(0xff2bad4b)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "howDoesYourEntityPromoteAndReachOutToItsMarketsPleaseElaborateBelow"
                                .tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        CustomDropDown(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: appTheme.blueGray10002,
                          ),
                          hintText:
                              "howDoesYourEntityPromoteAndReachOutToItsMarketsPleaseElaborateBelow"
                                  .tr,
                          items: controller.howDoesYourEntityPromoteList,
                          onChanged: (value) {
                            controller.selectedHowDoesYourEntityPromoter.value =
                                value;
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "whoAreTheMain3BuyersOfYourProductsPleaseProvideInformationInTheTableBelow"
                                .tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        ExpansionPanelList.radio(
                            elevation: 0,
                            children: controller.currentBuyers.map((buyer) {
                              // TextEditingController farmSizeController =
                              //     TextEditingController();
                              Rx<SelectionPopupModel> farmOwnership =
                                  SelectionPopupModel(title: "").obs;

                              return ExpansionPanelRadio(
                                  value: buyer,
                                  canTapOnHeader: true,
                                  backgroundColor: Color(0xffe7fff9),
                                  headerBuilder: (c, h) => Container(
                                        alignment: Alignment.centerLeft,
                                        color: Colors.green,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "${'buyer'.tr} #${controller.currentBuyers.indexOf(buyer) + 1}",
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                  body: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'name'.tr,
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 14,
                                            color: Color(0xff2d3c49),
                                            fontWeight: FontWeight.w600,
                                            height: 1.5,
                                          ),
                                          textHeightBehavior:
                                              TextHeightBehavior(
                                                  applyHeightToFirstAscent:
                                                      false),
                                        ),
                                        CustomTextFormField(
                                          // readOnly: true,
                                          // controller: farmSizeController,
                                          onChanged: (value) {
                                            buyer.name = value;
                                          },
                                          validator: (value) {
                                            return null;
                                          },
                                          // textInputType: TextInputType.number,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'region'.tr,
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 14,
                                            color: Color(0xff2d3c49),
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textHeightBehavior:
                                              TextHeightBehavior(
                                                  applyHeightToFirstAscent:
                                                      false),
                                        ),
                                        CustomDropDown(
                                          //  value: village.value.id != null
                                          //     ? village.value
                                          //     : null,
                                          validator: (value) {
                                            if (value == null) {
                                              return "required".tr;
                                            }
                                            return null;
                                          },
                                          onChanged:
                                              (SelectionPopupModel? value) {
                                            if (value != null) {
                                              buyer.region = value.id;
                                            }
                                          },
                                          items: controller.regionList,
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          '${"measurement".tr}\n[${"litres".tr}, MT or KG]'
                                              .tr,
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 14,
                                            color: Color(0xff2d3c49),
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textHeightBehavior:
                                              TextHeightBehavior(
                                                  applyHeightToFirstAscent:
                                                      false),
                                        ),
                                        CustomDropDown(
                                          value:
                                              farmOwnership.value.value != null
                                                  ? farmOwnership.value
                                                  : null,
                                          onChanged:
                                              (SelectionPopupModel? value) {
                                            if (value != null) {
                                              buyer.measure = value.value;
                                            }
                                          },
                                          items: controller.mensurementList,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'volumesBought'.tr,
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 14,
                                            color: Color(0xff2d3c49),
                                            fontWeight: FontWeight.w600,
                                            height: 1.5,
                                          ),
                                          textHeightBehavior:
                                              TextHeightBehavior(
                                                  applyHeightToFirstAscent:
                                                      false),
                                        ),
                                        CustomTextFormField(
                                          // readOnly: true,
                                          // controller: farmSizeController,
                                          onChanged: (value) {
                                            buyer.volume =
                                                double.tryParse(value);
                                          },
                                          validator: (value) {
                                            return null;
                                          },
                                          textInputType: TextInputType.number,
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                      ],
                                    ),
                                  ));
                            }).toList()),

                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "whatDifficultiesDoYouFaceInAccessingMarketsWhatAreTheTop3DifficultiesYouFaceInAccessingClients"
                                .tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        CustomTextFormField(
                          // controller: controller.nambariyaController,
                          hintText:
                              "whatDifficultiesDoYouFaceInAccessingMarketsWhatAreTheTop3DifficultiesYouFaceInAccessingClients"
                                  .tr,
                          hintStyle: theme.textTheme.titleSmall!,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "whatAreYourSourcesOfMarketInformationPleaseSelectAtLeastOne"
                                .tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        CustomTextFormField(
                          // controller: controller.nambariyaController,
                          hintText:
                              "whatAreYourSourcesOfMarketInformationPleaseSelectAtLeastOne"
                                  .tr,
                          hintStyle: theme.textTheme.titleSmall!,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "fromYourExperienceWwhoAreYourTop3Competitors".tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        for (String competitor in controller.currentCompetitors)
                          CustomTextFormField(
                            // controller: controller.nambariyatinController,
                            hintText: "competitor".tr,
                            hintStyle: theme.textTheme.titleSmall!,
                            // controller: farmSizeController,
                            onChanged: (value) {
                              competitor = value;
                            },
                            validator: (value) {
                              return null;
                            },
                          ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "howDoYouSourceClientsPleaseElaborate".tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        CustomTextFormField(
                          // controller: controller.nambariyatinController,
                          hintText: "howDoYouSourceClientsPleaseElaborate".tr,
                          hintStyle: theme.textTheme.titleSmall!,
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "areYouCurrentlyAMemberOfAnyValueChainRelatedOrganization"
                                .tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        CustomDropDown(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: appTheme.blueGray10002,
                          ),
                          hintText:
                              "areYouCurrentlyAMemberOfAnyValueChainRelatedOrganization"
                                  .tr,
                          items: controller
                              .areYouCurrentlyAMemberOfAnyValueChainList,
                          onChanged: (value) {
                            controller.selectedAreYouCurrentlyAMember.value =
                                value;
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "whatTypeOfFinanceHaveYouUsedInTheEstablishmentOfYourEnterpriseOrGroup"
                                .tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        Column(
                          children: [
                            Table(
                              columnWidths: const <int, TableColumnWidth>{
                                0: FlexColumnWidth(),
                                1: FlexColumnWidth(),
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: <TableRow>[
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        'typeOfFinance'.tr.toUpperCase(),
                                        style: const TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                          color: Color(0xff2bad4b),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: SizedBox(
                                        width: 20.0,
                                        height: 15.0,
                                        child: Text(
                                          '%'.tr.toUpperCase(),
                                          style: const TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: Color(0xff2bad4b),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Form(
                              // key: controller.sellingFormKey,
                              child: Table(
                                columnWidths: const <int, TableColumnWidth>{
                                  0: FlexColumnWidth(),
                                  1: FlexColumnWidth(),
                                },
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                children:
                                    controller.financeUsedList.map((order) {
                                  return TableRow(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                          height: 36.0,
                                          color: const Color(0xffe7fff9),
                                          child: Center(
                                            child: Text(
                                              order.title
                                                  .toString()
                                                  .toUpperCase(),
                                              style: const TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 11,
                                                color: Color(0xff4a4a4a),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textHeightBehavior:
                                                  const TextHeightBehavior(
                                                      applyHeightToFirstAscent:
                                                          false),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: SizedBox(
                                          height: 36,
                                          child: TextFormField(
                                            // controller: quantityController,
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              order.amount =
                                                  int.tryParse(value);
                                            },
                                            validator: (value) {
                                              return;
                                            },
                                            cursorColor:
                                                const Color(0xff2bad4b),
                                            style: const TextStyle(
                                                letterSpacing: 0.1,
                                                color: Color(0xff4a4a4a)),
                                            decoration: const InputDecoration(
                                              filled: true,
                                              fillColor: Color(0xffe7fff9),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Color(0xff2bad4b)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Color(0xff2bad4b)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "whatAreTheMajorProblemsRelatedToExistingPoliciesAndRegulationsAroundTheValueChainInWhichYouOperate"
                                .tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        CustomDropDown(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: appTheme.blueGray10002,
                          ),
                          hintText:
                              "whatAreTheMajorProblemsRelatedToExistingPoliciesAndRegulationsAroundTheValueChainInWhichYouOperate"
                                  .tr,
                          items: controller.majorProblemsList,
                          onChanged: (value) {
                            controller.selectedMajorProblem.value = value;
                          },
                        ),
                        SizedBox(height: 20.v),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "coreBusinesAndOPerationalDetails".tr.toUpperCase(),
                            style: CustomTextStyles.titleMediumGreen900Bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "pleaseSpecifyTheTotalProductionAndOrAggregationCapacityVolumesOfYourEntityPerYearOverThePastThreeYears"
                                .tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        Column(
                          children: [
                            Table(
                              columnWidths: const <int, TableColumnWidth>{
                                0: FixedColumnWidth(64),
                                1: FlexColumnWidth(),
                                2: FlexColumnWidth(),
                                3: FlexColumnWidth(),
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: <TableRow>[
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        'year'.tr.toUpperCase(),
                                        style: const TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                          color: Color(0xff2bad4b),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: SizedBox(
                                        width: 20.0,
                                        height: 15.0,
                                        child: Text(
                                          'areaUnderCultivation'
                                              .tr
                                              .toUpperCase(),
                                          style: const TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: Color(0xff2bad4b),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        'measurement'.tr.toUpperCase(),
                                        style: const TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                          color: Color(0xff2bad4b),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        'areaUnderCultivation'.tr.toUpperCase(),
                                        style: const TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                          color: Color(0xff2bad4b),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Form(
                              // key: controller.sellingFormKey,
                              child: Table(
                                columnWidths: const <int, TableColumnWidth>{
                                  0: FixedColumnWidth(64),
                                  1: FlexColumnWidth(),
                                  2: FlexColumnWidth(),
                                  3: FlexColumnWidth(),
                                },
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                children: controller.annualProductionList
                                    .map((order) {
                                  return TableRow(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                          height: 36.0,
                                          color: const Color(0xffe7fff9),
                                          child: Center(
                                            child: Text(
                                              order.year
                                                  .toString()
                                                  .toUpperCase(),
                                              style: const TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 11,
                                                color: Color(0xff4a4a4a),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textHeightBehavior:
                                                  const TextHeightBehavior(
                                                      applyHeightToFirstAscent:
                                                          false),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: SizedBox(
                                          height: 36,
                                          child: TextFormField(
                                            // controller: quantityController,
                                            // keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              order.cultivationArea = value;
                                            },
                                            validator: (value) {
                                              return;
                                            },
                                            cursorColor:
                                                const Color(0xff2bad4b),
                                            style: const TextStyle(
                                                letterSpacing: 0.1,
                                                color: Color(0xff4a4a4a)),
                                            decoration: const InputDecoration(
                                              filled: true,
                                              fillColor: Color(0xffe7fff9),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Color(0xff2bad4b)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Color(0xff2bad4b)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: SizedBox(
                                          height: 36,
                                          child: TextFormField(
                                            // controller: quantityController,
                                            // keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              order.measure = value;
                                            },
                                            validator: (value) {
                                              return;
                                            },
                                            cursorColor:
                                                const Color(0xff2bad4b),
                                            style: const TextStyle(
                                                letterSpacing: 0.1,
                                                color: Color(0xff4a4a4a)),
                                            decoration: const InputDecoration(
                                              filled: true,
                                              fillColor: Color(0xffe7fff9),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Color(0xff2bad4b)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Color(0xff2bad4b)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: SizedBox(
                                          height: 36,
                                          child: TextFormField(
                                            // controller: quantityController,
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              order.volumes =
                                                  double.tryParse(value);
                                            },
                                            validator: (value) {
                                              return;
                                            },
                                            cursorColor:
                                                const Color(0xff2bad4b),
                                            style: const TextStyle(
                                                letterSpacing: 0.1,
                                                color: Color(0xff4a4a4a)),
                                            decoration: const InputDecoration(
                                              filled: true,
                                              fillColor: Color(0xffe7fff9),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Color(0xff2bad4b)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Color(0xff2bad4b)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "pleaseSelectAnyOtherCropYourEntityOperatesInAndSpecifyTheTotalProductionAndOrAggregationVolumeOverThePast3Years"
                                .tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        Column(
                          children: [
                            Table(
                              columnWidths: const <int, TableColumnWidth>{
                                0: FixedColumnWidth(64),
                                1: FlexColumnWidth(),
                                2: FlexColumnWidth(),
                                3: FlexColumnWidth(),
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: <TableRow>[
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        'year'.tr.toUpperCase(),
                                        style: const TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                          color: Color(0xff2bad4b),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: SizedBox(
                                        width: 20.0,
                                        height: 15.0,
                                        child: Text(
                                          'crops'.tr.toUpperCase(),
                                          style: const TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: Color(0xff2bad4b),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        '${"production".tr} (MT)'.toUpperCase(),
                                        style: const TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                          color: Color(0xff2bad4b),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        '${"aggregation".tr} (MT)'
                                            .toUpperCase(),
                                        style: const TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                          color: Color(0xff2bad4b),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Form(
                              // key: controller.sellingFormKey,
                              child: Table(
                                columnWidths: const <int, TableColumnWidth>{
                                  0: FixedColumnWidth(64),
                                  1: FlexColumnWidth(),
                                  2: FlexColumnWidth(),
                                  3: FlexColumnWidth(),
                                },
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                children: controller
                                    .cropProductionAggregationList
                                    .map((order) {
                                  return TableRow(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                          height: 36.0,
                                          color: const Color(0xffe7fff9),
                                          child: Center(
                                            child: Text(
                                              order.year
                                                  .toString()
                                                  .toUpperCase(),
                                              style: const TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 11,
                                                color: Color(0xff4a4a4a),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textHeightBehavior:
                                                  const TextHeightBehavior(
                                                      applyHeightToFirstAscent:
                                                          false),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: SizedBox(
                                          height: 36,
                                          child: TextFormField(
                                            // controller: quantityController,
                                            // keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              order.crops = [value];
                                            },
                                            validator: (value) {
                                              return;
                                            },
                                            cursorColor:
                                                const Color(0xff2bad4b),
                                            style: const TextStyle(
                                                letterSpacing: 0.1,
                                                color: Color(0xff4a4a4a)),
                                            decoration: const InputDecoration(
                                              filled: true,
                                              fillColor: Color(0xffe7fff9),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Color(0xff2bad4b)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Color(0xff2bad4b)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: SizedBox(
                                          height: 36,
                                          child: TextFormField(
                                            // controller: quantityController,
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              order.production =
                                                  int.tryParse(value);
                                            },
                                            validator: (value) {
                                              return;
                                            },
                                            cursorColor:
                                                const Color(0xff2bad4b),
                                            style: const TextStyle(
                                                letterSpacing: 0.1,
                                                color: Color(0xff4a4a4a)),
                                            decoration: const InputDecoration(
                                              filled: true,
                                              fillColor: Color(0xffe7fff9),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Color(0xff2bad4b)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Color(0xff2bad4b)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: SizedBox(
                                          height: 36,
                                          child: TextFormField(
                                            // controller: quantityController,
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              order.aggregation =
                                                  double.tryParse(value);
                                            },
                                            validator: (value) {
                                              return;
                                            },
                                            cursorColor:
                                                const Color(0xff2bad4b),
                                            style: const TextStyle(
                                                letterSpacing: 0.1,
                                                color: Color(0xff4a4a4a)),
                                            decoration: const InputDecoration(
                                              filled: true,
                                              fillColor: Color(0xffe7fff9),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Color(0xff2bad4b)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Color(0xff2bad4b)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "whatIsTheSourceOfEnergyForTheWarehouse".tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        CustomDropDown(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: appTheme.blueGray10002,
                          ),
                          items: controller.sourceOfEnergyList,
                          onChanged: (value) {
                            controller.selectedSourceOfEnergy.value = value;
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 22.v,
                          ),
                          child: Text(
                            "whatTrainingWillYouNeedForYourWorkAsAProducerAndAggregator"
                                .tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        CustomDropDown(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: appTheme.blueGray10002,
                          ),
                          hintText:
                              "whatTrainingWillYouNeedForYourWorkAsAProducerAndAggregator"
                                  .tr,
                          items: controller.trainingList,
                          onChanged: (value) {
                            controller.selecetTraining.value = value;
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 4.h,
                            top: 21.v,
                          ),
                          child: Text(
                            "howDoYouEnsureThatTheRightQualityOfInputsAndOrRawMaterialsAreProvidedByYourSuppliers"
                                .tr,
                            style: CustomTextStyles.titleSmallBluegray400,
                          ),
                        ),
                        SizedBox(height: 10.v),
                        SizedBox(
                          height: 49.v,
                          width: 385.h,
                          child: TextFormField(
                            // controller: quantityController,
                            // keyboardType: TextInputType.number,
                            validator: (value) {
                              return;
                            },
                            cursorColor: const Color(0xff2bad4b),
                            style: const TextStyle(
                                letterSpacing: 0.1, color: Color(0xff4a4a4a)),
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xffe7fff9),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xff2bad4b)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xff2bad4b)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 47.v),
                        Center(
                          child: CustomOutlinedButton(
                              height: 42.v,
                              width: 159.h,
                              text: "send".tr,
                              margin: EdgeInsets.only(top: 22.v),
                              buttonStyle: CustomButtonStyles.fillBlue,
                              onPressed: () {
                                controller.registerQuestionnaireResponse();
                              }),
                        ),
                        SizedBox(height: 47.v),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFarmerRegistration() {
    return Padding(
      padding: EdgeInsets.only(left: 19.h),
      child: Text(
        "msg_farmer_registration".tr,
        style: theme.textTheme.titleMedium,
      ),
    );
  }

  /// Section Widget
  Widget _buildNine() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        // decoration: AppDecoration.fillLightgreen5001,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 16.v),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: CustomImageView(
                imagePath: ImageConstant.imgArrowdown,
                height: 17.v,
                width: 25.h,
                color: Colors.black,
                margin: EdgeInsets.only(left: 28.h)),
          ),
          SizedBox(height: 41.v),
          _buildFarmerRegistration(),
          Divider(color: appTheme.blueGray100)
        ]));
  }

  /// Navigates to the farmerManagementScreen when the action is triggered.
  onTapCancel() {
    Get.toNamed(
      AppRoutes.farmerManagementScreen,
    );
  }

  /// Navigates to the farmerManagementScreen when the action is triggered.
  onTapSubmit() {
    Get.toNamed(
      AppRoutes.farmerManagementScreen,
    );
  }
}
