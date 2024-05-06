import 'dart:convert';

import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:saidi_s_application3/core/utils/size_utils.dart';

import '../../core/utils/functions/global.dart';
import '../../core/utils/image_constant.dart';
import '../../data/models/apiModels/initial_data_response_model.dart';
import '../../data/models/apiModels/register_farmer_request_model.dart';
import '../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../../routes/app_routes.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/topNavBar.dart';
import 'controller/farmer_registration_controller.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class FarmerRegistrationScreen extends GetWidget<FarmerRegistrationController> {
  FarmerRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavBar(
        appBarPreferredSize: kToolbarHeight * 2.5,
        title: "msg_farmer_management".tr.toUpperCase(),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            color: Colors.white,
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNine(),
                SizedBox(width: 218.h, child: Divider(indent: 22.h)),
              ],
            ),
          ),
        ),
      ),
      body: Obx(
        () => Theme(
          data: ThemeData(
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(background: appTheme.lightGreen5001),
          ),
          child: Stepper(
            type: StepperType.horizontal,
            currentStep: controller.currentStep.value,
            elevation: 0,
            connectorColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.green;
              }
              return Colors.grey;
            }),
            steps: [
              Step(
                isActive: controller.currentStep >= 0,
                state: controller.currentStep > 0
                    ? StepState.complete
                    : StepState.indexed,
                title: const Text(""),
                content: Column(
                  children: [
                    Visibility(
                      visible: controller.regType == "edit",
                      child: Form(
                        key: controller.step0FormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 31.h),
                                child: Text('Namba ya utambulisho wa mkulima',
                                    style: theme.textTheme.titleSmall)),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: controller.farmerNumberController,
                              textInputAction: TextInputAction.search,
                              onFieldSubmitted: (value) {
                                if (controller.step0FormKey.currentState!
                                    .validate()) {
                                  controller.getFarmer(
                                      controller.farmerNumberController.text);
                                }
                              },
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "required".tr;
                                } else if (!controller.famerNamberFormat
                                    .hasMatch(value.toString())) {
                                  return "invalid".tr;
                                }

                                return null;
                              },
                              cursorColor: const Color(0xff2bad4b),
                              style: const TextStyle(
                                  letterSpacing: 0.1, color: Color(0xff4a4a4a)),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xffe7fff9),
                                suffixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.search,
                                    color: Color(0xff2bad4b),
                                  ),
                                  onPressed: () {
                                    if (controller.step0FormKey.currentState!
                                        .validate()) {
                                      controller.getFarmer(controller
                                          .farmerNumberController.text);
                                    }
                                  },
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xff2bad4b)),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xff2bad4b)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible:
                          controller.regType != "edit" || controller.edit.value,
                      child: Form(
                        key: controller.step1FormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 31.h),
                                child: Text('registrationType'.tr,
                                    style: theme.textTheme.titleSmall)),
                            Padding(
                              padding: EdgeInsets.only(left: 28.h, right: 38.h),
                              child: CustomDropDown(
                                onChanged: (SelectionPopupModel? value) {
                                  if (value != null) {
                                    controller.selectedRegistrationType.value =
                                        value;
                                  }
                                },
                                validator: (value) {
                                  // if (value == null) {
                                  //   return "required".tr;
                                  // }
                                  return null;
                                },
                                items: controller.registrationTypeList,
                              ),
                            ),
                            SizedBox(height: 19.v),
                            Padding(
                                padding: EdgeInsets.only(left: 31.h),
                                child: Text("lbl_full_name".tr,
                                    style: theme.textTheme.titleSmall)),
                            SizedBox(height: 9.v),
                            _buildFullName(),
                            SizedBox(height: 21.v),
                            Visibility(
                              visible: controller
                                      .selectedRegistrationType.value.value !=
                                  "INSTITUTION",
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 31.h),
                                      child: Text('selectGender'.tr,
                                          style: theme.textTheme.titleSmall)),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 28.h, right: 38.h),
                                    child: CustomDropDown(
                                      onChanged: (SelectionPopupModel? value) {
                                        if (value != null) {
                                          controller.selectedGender.value =
                                              value;
                                        }
                                      },
                                      validator: (value) {
                                        // if (value == null) {
                                        //   return "required".tr;
                                        // }
                                        return null;
                                      },
                                      items: controller.genderList,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: controller
                                      .selectedRegistrationType.value.value ==
                                  "INSTITUTION",
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 31.h),
                                      child: Text(
                                          "selectTheTypeOfInstitution".tr,
                                          style: theme.textTheme.titleSmall)),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 28.h, right: 38.h),
                                    child: CustomDropDown(
                                      onChanged: (SelectionPopupModel? value) {
                                        if (value != null) {
                                          controller.selectedInstitutionType
                                              .value = value;
                                        }
                                      },
                                      validator: (value) {
                                        // if (value == null) {
                                        //   return "required".tr;
                                        // }
                                        return null;
                                      },
                                      items: controller.institutionTypeList,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 21.v),
                            Padding(
                                padding: EdgeInsets.only(left: 31.h),
                                child: Text("lbl_date_of_birth".tr,
                                    style: theme.textTheme.titleSmall)),
                            SizedBox(height: 9.v),
                            _buildDateOfBirth(context),
                            SizedBox(height: 21.v),
                            Padding(
                                padding: EdgeInsets.only(left: 31.h),
                                child: Text('identityType'.tr,
                                    style: theme.textTheme.titleSmall)),
                            Padding(
                              padding: EdgeInsets.only(left: 28.h, right: 38.h),
                              child: CustomDropDown(
                                value: controller.selectedIdentity.value,
                                validator: (value) {
                                  // if (value == null) {
                                  //   return "required".tr;
                                  // }
                                  return null;
                                },
                                onChanged: (SelectionPopupModel? value) {
                                  if (value != null) {
                                    controller.selectedIdentity.value = value;
                                    // controller.identityNumberRegex.value =
                                    //     value.validation.toString();
                                  }
                                },
                                items: controller.identitysDropdownList,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 31.h),
                                child: Text('identityNumber'.tr,
                                    style: theme.textTheme.titleSmall)),
                            Padding(
                              padding: EdgeInsets.only(left: 28.h, right: 38.h),
                              child: CustomTextFormField(
                                controller: controller.farmerIdController,
                                validator: (value) {
                                  // if (value.toString().isEmpty) {
                                  //   return "requiredIdCardNumber".tr;
                                  // } else if (!RegExp(
                                  //         controller.identityNumberRegex.value)
                                  //     .hasMatch(value.toString())) {
                                  //   return "requiredIdCardNumberValidation".tr;
                                  // } else if (controller
                                  //         .selectedIdentity.value.name
                                  //         .toString()
                                  //         .toUpperCase() ==
                                  //     "NIDA") {
                                  //   if (value.toString().substring(0, 8) !=
                                  //       controller.dateController.text
                                  //           .toString()
                                  //           .replaceAll(RegExp(r'-'), '')) {
                                  //     return "requiredIdCardNumberValidation".tr;
                                  //   }
                                  // }

                                  return null;
                                },
                              ),
                            ),
                            SizedBox(height: 21.v),
                            Padding(
                                padding: EdgeInsets.only(left: 31.h),
                                child: Text("lbl_phone_number".tr,
                                    style: theme.textTheme.titleSmall)),
                            SizedBox(height: 9.v),
                            _buildPhoneNumber(),
                            SizedBox(height: 23.v),
                            _buildOwnSmartPhone(),
                            SizedBox(height: 23.v),
                            Padding(
                                padding: EdgeInsets.only(left: 31.h),
                                child: Text('village'.tr,
                                    style: theme.textTheme.titleSmall)),
                            Padding(
                              padding: EdgeInsets.only(left: 28.h, right: 38.h),
                              child: CustomDropDown(
                                value: controller.selectedVillage.value,
                                validator: (value) {
                                  // if (value == null) {
                                  //   return "required".tr;
                                  // }
                                  return null;
                                },
                                onChanged: (SelectionPopupModel? value) {
                                  if (value != null) {
                                    controller.selectedVillage.value = value;
                                  }
                                },
                                items: controller.villagesDropdownList,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 28.h, right: 38.h),
                              child: MultiSelectDialogField<CommunitySeedBanks>(
                                initialValue:
                                    controller.selecetedCommunitySeedBanks,
                                searchable: true,
                                items: controller.dashboardResponse.value
                                            .communitySeedBanks !=
                                        null
                                    ? controller.dashboardResponse.value
                                        .communitySeedBanks!
                                        .map(
                                          (e) => MultiSelectItem<
                                                  CommunitySeedBanks>(
                                              e, e.name.toString()),
                                        )
                                        .toList()
                                    : [],
                                cancelText: Text('cancel'.tr.toUpperCase()),
                                confirmText: Text("save".tr.toUpperCase()),
                                title: Text("selectCommunitySeedBank".tr,
                                    style: theme.textTheme.titleSmall),
                                selectedColor: const Color(0xff2bad4b),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                buttonIcon: const Icon(
                                  Icons.add,
                                  color: Color(0xff2bad4b),
                                ),
                                buttonText: Text(
                                  'selectCommunitySeedBank'.tr,
                                  style: theme.textTheme.titleSmall,
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                  // softWrap: false,
                                ),
                                onConfirm: (results) {
                                  controller.selecetedCommunitySeedBanks.value =
                                      results;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 31.h),
                                child: Text('group'.tr,
                                    style: theme.textTheme.titleSmall)),
                            Padding(
                              padding: EdgeInsets.only(left: 28.h, right: 38.h),
                              child: CustomDropDown(
                                value: controller.selectedGroup.value,
                                validator: (value) {
                                  // if (value == null) {
                                  //   return "required".tr;
                                  // }
                                  return null;
                                },
                                onChanged: (SelectionPopupModel? value) {
                                  if (value != null) {
                                    controller.selectedGroup.value = value;
                                  }
                                },
                                items: controller.groupsDropdownList,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Visibility(
                                visible:
                                    controller.selectedGroup.value.id != null,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(left: 31.h),
                                        child: Text('membershipStatus'.tr,
                                            style: theme.textTheme.titleSmall)),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 28.h, right: 38.h),
                                      child: CustomDropDown(
                                        onChanged:
                                            (SelectionPopupModel? value) {
                                          if (value != null) {
                                            controller.selectedMembership
                                                .value = value;
                                          }
                                        },
                                        validator: (value) {
                                          // if (value == null) {
                                          //   return "required".tr;
                                          // }
                                          return null;
                                        },
                                        items: controller.groupMembershipList,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Step(
                isActive: controller.currentStep >= 1,
                state: controller.currentStep > 1
                    ? StepState.complete
                    : StepState.indexed,
                title: const Text(""),
                content: Form(
                  key: controller.step2FormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExpansionPanelList.radio(
                          elevation: 0,
                          children: controller.farmInfos.map((farm) {
                            TextEditingController farmSizeController =
                                TextEditingController();
                            Rx<SelectionPopupModel> farmOwnership =
                                SelectionPopupModel(title: "").obs;
                            Rx<Villages> village = Villages().obs;

                            farmOwnership.value = controller.ownershipList
                                .firstWhere(
                                    (element) =>
                                        element.value!.toLowerCase() ==
                                        farm.ownership.toString().toLowerCase(),
                                    orElse: () =>
                                        SelectionPopupModel(title: ""));
                            village.value =
                                (controller.dashboardResponse.value.villages ??
                                        [])
                                    .firstWhere(
                              (element) => element.id == farm.villageId,
                              orElse: () => Villages(),
                            );
                            farmSizeController.text = farm.farmSize ?? "";

                            return ExpansionPanelRadio(
                                value: farm,
                                canTapOnHeader: true,
                                backgroundColor: Color(0xffe7fff9),
                                headerBuilder: (c, h) => Container(
                                      alignment: Alignment.centerLeft,
                                      color: Colors.green,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${'farm'.tr} #${controller.farmInfos.indexOf(farm) + 1}",
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
                                        'farmSizeAcres'.tr,
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 14,
                                          color: Color(0xff2d3c49),
                                          fontWeight: FontWeight.w600,
                                          height: 1.5,
                                        ),
                                        textHeightBehavior: TextHeightBehavior(
                                            applyHeightToFirstAscent: false),
                                      ),
                                      CustomTextFormField(
                                        // readOnly: true,
                                        controller: farmSizeController,
                                        onChanged: (value) {
                                          farm.farmSize = value;
                                        },
                                        validator: (value) {
                                          // if (value.toString().isEmpty) {
                                          //   return "required".tr;
                                          // } else if ((farm.farmCoordinates ?? [])
                                          //         .length <
                                          //     3) {
                                          //   return "Chukua coordinate kwa usahihi";
                                          // }

                                          return null;
                                        },
                                        textInputType: TextInputType.number,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'whereTheFarmIslocated'.tr,
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 14,
                                          color: Color(0xff2d3c49),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textHeightBehavior: TextHeightBehavior(
                                            applyHeightToFirstAscent: false),
                                      ),
                                      CustomDropDown(
                                        //  value: village.value.id != null
                                        //     ? village.value
                                        //     : null,
                                        validator: (value) {
                                          // if (value == null) {
                                          //   return "required".tr;
                                          // }
                                          return null;
                                        },
                                        onChanged:
                                            (SelectionPopupModel? value) {
                                          if (value != null) {
                                            farm.villageId = value.id;
                                          }
                                        },
                                        items: controller.villagesDropdownList,
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      MultiSelectDialogField<Villages>(
                                        // chipDisplay:
                                        //     MultiSelectChipDisplay.none(),
                                        searchable: true,
                                        items: controller.dashboardResponse
                                                    .value.crops !=
                                                null
                                            ? controller
                                                .dashboardResponse.value.crops!
                                                .map(
                                                  (e) =>
                                                      MultiSelectItem<Villages>(
                                                          e, e.name.toString()),
                                                )
                                                .toList()
                                            : [],
                                        cancelText:
                                            Text('cancel'.tr.toUpperCase()),
                                        confirmText:
                                            Text("save".tr.toUpperCase()),
                                        title: Text("Chagua Mazao"),
                                        selectedColor: const Color(0xff2bad4b),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        buttonIcon: const Icon(
                                          Icons.add,
                                          color: Color(0xff2bad4b),
                                        ),
                                        buttonText: const Text(
                                          'Chagua Mazao',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 16,
                                            color: Color(0xff2d3c49),
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textHeightBehavior:
                                              TextHeightBehavior(
                                                  applyHeightToFirstAscent:
                                                      false),
                                          // softWrap: false,
                                        ),
                                        onConfirm: (results) {
                                          farm.cropIds = results
                                              .map((e) => e.id!)
                                              .toList();
                                        },
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        'typeOfOwnership'.tr,
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 14,
                                          color: Color(0xff2d3c49),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textHeightBehavior: TextHeightBehavior(
                                            applyHeightToFirstAscent: false),
                                      ),
                                      CustomDropDown(
                                        value: farmOwnership.value.value != null
                                            ? farmOwnership.value
                                            : null,
                                        onChanged:
                                            (SelectionPopupModel? value) {
                                          if (value != null) {
                                            controller.farmInfos
                                                .elementAt(controller.farmInfos
                                                    .indexOf(farm))
                                                .ownership = value.value;
                                          }
                                        },
                                        items: controller.ownershipList,
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Visibility(
                                          visible: (farm.farmCoordinates ?? [])
                                              .isNotEmpty,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              Text(
                                                'theCoordinatesYouTook'.tr,
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 12,
                                                  color: Color(0xffb0b0b0),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Table(
                                                columnWidths: const <int,
                                                    TableColumnWidth>{
                                                  0: FixedColumnWidth(64),
                                                  1: FlexColumnWidth(),
                                                  2: FixedColumnWidth(64)
                                                },
                                                defaultVerticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                children: <TableRow>[
                                                  TableRow(
                                                    children: <Widget>[
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        child: SizedBox(
                                                          width: 20.0,
                                                          height: 15.0,
                                                          child: Text(
                                                            'No.',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontSize: 12,
                                                              color: Color(
                                                                  0xff2bad4b),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        child: Text(
                                                          "Coordinate",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontSize: 12,
                                                            color: Color(
                                                                0xff2bad4b),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                        child: Text(
                                                          'action'.tr,
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontSize: 12,
                                                            color: Color(
                                                                0xff2bad4b),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Table(
                                                    columnWidths: const <int,
                                                        TableColumnWidth>{
                                                      0: FixedColumnWidth(64),
                                                      1: FlexColumnWidth(),
                                                      2: FixedColumnWidth(64)
                                                    },
                                                    defaultVerticalAlignment:
                                                        TableCellVerticalAlignment
                                                            .middle,
                                                    children:
                                                        (farm.farmCoordinates ??
                                                                [])
                                                            .map(
                                                                (coordinate) =>
                                                                    TableRow(
                                                                      children: <Widget>[
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              4.0),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                36.0,
                                                                            color:
                                                                                const Color(0xffe7fff9),
                                                                            child:
                                                                                Center(
                                                                              child: Text(
                                                                                "${(farm.farmCoordinates ?? []).indexOf(coordinate) + 1}",
                                                                                style: const TextStyle(
                                                                                  fontFamily: 'Montserrat',
                                                                                  fontSize: 11,
                                                                                  color: Color(0xff4a4a4a),
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                                textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              4.0),
                                                                          child:
                                                                              Container(
                                                                            color:
                                                                                const Color(0xffe7fff9),
                                                                            height:
                                                                                36.0,
                                                                            child:
                                                                                Center(
                                                                              child: Text(
                                                                                "(${coordinate.latitude},${coordinate.longitude})",
                                                                                style: const TextStyle(
                                                                                  fontFamily: 'Montserrat',
                                                                                  fontSize: 11,
                                                                                  color: Color(0xff4a4a4a),
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                                textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              4.0),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              farm.farmCoordinates!.remove(coordinate);
                                                                              List<FarmCoordinates> newCoordinate = farm.farmCoordinates ?? [];
                                                                              num surfaceArea = controller.calculateSurfaceArea(newCoordinate);
                                                                              farm.farmSize = surfaceArea > 0 ? surfaceArea.toString() : farm.farmSize;
                                                                              controller.farmInfos.refresh();
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: 36.0,
                                                                              decoration: BoxDecoration(
                                                                                color: const Color(0xffe7fff9),
                                                                                border: Border.all(width: 1.0, color: const Color(0xffaff5c0)),
                                                                              ),
                                                                              child: const SizedBox(
                                                                                width: 8.0,
                                                                                height: 18.0,
                                                                                child: Center(
                                                                                  child: Icon(
                                                                                    Icons.close,
                                                                                    color: Color(0xff2bad4b),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ))
                                                            .toList(),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          var currentCoordinate =
                                              await determinePosition();
                                          if (farm.farmCoordinates == null) {
                                            farm.farmCoordinates = [];
                                            farm.farmCoordinates!.add(
                                                FarmCoordinates(
                                                    latitude: currentCoordinate
                                                        .latitude,
                                                    longitude: currentCoordinate
                                                        .longitude));
                                            List<FarmCoordinates>
                                                newCoordinate =
                                                farm.farmCoordinates ?? [];
                                            num surfaceArea =
                                                controller.calculateSurfaceArea(
                                                    newCoordinate);

                                            farm.farmSize = surfaceArea > 0
                                                ? surfaceArea.toString()
                                                : farm.farmSize;
                                            controller.farmInfos.refresh();
                                          } else {
                                            farm.farmCoordinates!.add(
                                                FarmCoordinates(
                                                    latitude: currentCoordinate
                                                        .latitude,
                                                    longitude: currentCoordinate
                                                        .longitude));
                                            List<FarmCoordinates>
                                                newCoordinate =
                                                farm.farmCoordinates ?? [];
                                            num surfaceArea =
                                                controller.calculateSurfaceArea(
                                                    newCoordinate);

                                            farm.farmSize = surfaceArea > 0
                                                ? surfaceArea.toString()
                                                : farm.farmSize;
                                            controller.farmInfos.refresh();
                                          }
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              'takeCoordinates'.tr,
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 14,
                                                color: Color(0xff2d3c49),
                                                fontWeight: FontWeight.w600,
                                                height: 1.2857142857142858,
                                              ),
                                              textHeightBehavior:
                                                  TextHeightBehavior(
                                                      applyHeightToFirstAscent:
                                                          false),
                                              softWrap: false,
                                            ),
                                            const SizedBox(
                                              width: 16,
                                            ),
                                            Container(
                                                height: 25,
                                                width: 25,
                                                color: Colors.black,
                                                child: const Center(
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          controller.farmInfos.remove(farm);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text("deleteFarm".tr),
                                            const SizedBox(
                                              width: 16,
                                            ),
                                            Container(
                                              width: 30,
                                              height: 30,
                                              color: Colors.red,
                                              child: const Center(
                                                child: Icon(
                                                    Icons.delete_forever,
                                                    color: Colors.white),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                    ],
                                  ),
                                ));
                          }).toList()),
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.farmInfos.add(FarmInfo());
                        },
                        child: Row(
                          children: [
                            Text("addFarm".tr),
                            const SizedBox(
                              width: 16,
                            ),
                            Container(
                                height: 25,
                                width: 25,
                                color: Colors.black,
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
              Step(
                isActive: controller.currentStep >= 2,
                title: const Text(""),
                content: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible:
                            controller.selectedRegistrationType.value.value ==
                                "INSTITUTION",
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Jina Kamili la mtu wa mawasiliano',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14,
                                color: Color(0xff2d3c49),
                                fontWeight: FontWeight.w600,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                            TextFormField(
                              controller:
                                  controller.contactPersonNameController,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "required".tr;
                                }

                                return null;
                              },
                              cursorColor: const Color(0xff2bad4b),
                              style: const TextStyle(
                                  letterSpacing: 0.1, color: Color(0xff4a4a4a)),
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color(0xffe7fff9),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xff2bad4b)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xff2bad4b)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Text(
                              'Nambari ya simu ya mtu wa mawasiliano',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14,
                                color: Color(0xff2d3c49),
                                fontWeight: FontWeight.w600,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                            ),
                            TextFormField(
                              controller:
                                  controller.contactPersonPhoneController,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "required".tr;
                                }

                                return null;
                              },
                              cursorColor: const Color(0xff2bad4b),
                              style: const TextStyle(
                                  letterSpacing: 0.1, color: Color(0xff4a4a4a)),
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color(0xffe7fff9),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xff2bad4b)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xff2bad4b)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        (controller.selectedRegistrationType.value.value !=
                                "INSTITUTION")
                            ? "Picha ya mkulima"
                            : "Picha ya mtu wa mawasiliano",
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          color: Color(0xff2d3c49),
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                        ),
                        textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.takeImage();
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 79.8,
                              height: 46.4,
                              decoration: BoxDecoration(
                                color: const Color(0xff2bad4b),
                                borderRadius: BorderRadius.circular(7.0),
                                border: Border.all(
                                    width: 1.0, color: const Color(0xff3ede65)),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 32,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            const Text(
                              'Piga picha',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14,
                                color: Color(0xff2d3c49),
                                fontWeight: FontWeight.w600,
                                height: 1.5,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      if (controller.image.value != "")
                        Container(
                          width: 265,
                          height: 265,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: MemoryImage(base64Decode(controller
                                  .image.value
                                  .replaceAll(RegExp(r'\s+'), ''))),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.dialog(Scaffold(
                            body: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Center(
                                  child: Text("Device Not connected"),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                GestureDetector(
                                  // onTap: () => controller
                                  //     .validateSallingProductsQuantity(),
                                  child: Center(
                                    child: Container(
                                      width: 199.0,
                                      height: 67.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                            width: 1.0,
                                            color: const Color(0xff2bad4b)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.fingerprint,
                                              size: 40,
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                'Scan Fingerprint',
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 12,
                                                  color: Color(0xff2bad4b),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                softWrap: false,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            bottomNavigationBar: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    controller.currentStep.value != 0
                                        ? MainAxisAlignment.spaceBetween
                                        : MainAxisAlignment.end,
                                children: [
                                  if (controller.currentStep.value != 0)
                                    GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 41,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff138138),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Icon(
                                              Icons.arrow_back,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              'RUDI',
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 14,
                                                color: Color(0xffffffff),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  if (controller.regType != "edit" ||
                                      controller.edit.value)
                                    GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        width: 107,
                                        height: 41,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff138138),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: controller
                                                        .currentStep.value !=
                                                    2
                                                ? MainAxisAlignment.spaceAround
                                                : MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                controller.currentStep.value !=
                                                        2
                                                    ? 'next'.tr.toUpperCase()
                                                    : "save".tr.toUpperCase(),
                                                style: const TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 14,
                                                  color: Color(0xffffffff),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (controller
                                                      .currentStep.value !=
                                                  2)
                                                const Icon(
                                                  Icons.arrow_forward,
                                                  color: Colors.white,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ));
                        },
                        child: Column(
                          children: [
                            const Text(
                              'Fingerprint',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14,
                                color: Color(0xff2d3c49),
                                fontWeight: FontWeight.w500,
                                height: 0.8571428571428571,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              width: 74.4,
                              height: 90.5,
                              decoration: BoxDecoration(
                                color:
                                    (controller.fingerPrintData.value
                                                    .finger1 !=
                                                null &&
                                            controller.fingerPrintData.value
                                                    .finger2 !=
                                                null &&
                                            controller.fingerPrintData.value
                                                    .finger3 !=
                                                null)
                                        ? Colors.green
                                        : const Color(0xffffffff),
                                border: Border.all(
                                    width: 1.0, color: const Color(0xff707070)),
                              ),
                              child: Icon(
                                Icons.fingerprint,
                                size: 52,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
            onStepCancel: () {
              if (controller.currentStep.value != 0) {
                controller.currentStep -= 1;
              }
            },
            onStepContinue: () {
              if (controller.currentStep.value != 2) {
                if (controller.step1FormKey.currentState!.validate() &&
                    controller.currentStep.value == 0) {
                  controller.currentStep += 1;
                } else if (controller.currentStep.value == 1) {
                  if (controller.farmInfos.isEmpty) {
                    showErrorToast("Shamba linaitajika");
                  } else if (controller.step2FormKey.currentState!.validate()) {
                    controller.currentStep += 1;
                  }
                }
              } else {
                if (controller.image.value.isNotEmpty) {
                  controller.registerFarmer();
                } else {
                  showErrorToast("Picha inaitajika");
                }
              }
            },
            controlsBuilder: (context, details) {
              return Row(
                mainAxisAlignment: controller.currentStep.value != 0
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.end,
                children: [
                  if (controller.currentStep.value != 0)
                    GestureDetector(
                      onTap: details.onStepCancel,
                      child: Container(
                        width: 100,
                        height: 41,
                        decoration: BoxDecoration(
                          color: const Color(0xff138138),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            Text(
                              'RUDI',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14,
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (controller.regType != "edit" || controller.edit.value)
                    GestureDetector(
                      onTap: details.onStepContinue,
                      child: Container(
                        width: 107,
                        height: 41,
                        decoration: BoxDecoration(
                          color: const Color(0xff138138),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: controller.currentStep.value != 2
                                ? MainAxisAlignment.spaceAround
                                : MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.currentStep.value != 2
                                    ? 'next'.tr.toUpperCase()
                                    : "save".tr.toUpperCase(),
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  color: Color(0xffffffff),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              if (controller.currentStep.value != 2)
                                const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
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

  /// Section Widget
  Widget _buildFullName() {
    return Padding(
        padding: EdgeInsets.only(left: 28.h, right: 38.h),
        child: CustomTextFormField(
            controller: controller.farmerNameController,
            hintText: "lbl_full_name".tr,
            alignment: Alignment.center,
            validator: (value) {
              // if (!isText(value)) {
              //   return "err_msg_please_enter_valid_text".tr;
              // }
              return null;
            }));
  }

  /// Section Widget
  Widget _buildDateOfBirth(context) {
    return Padding(
        padding: EdgeInsets.only(left: 28.h, right: 38.h),
        child: CustomTextFormField(
            controller: controller.dateController,
            readOnly: true,
            hintText: "lbl_date_of_birth".tr,
            onTap: () async {
              var datePicked = await DatePicker.showSimpleDatePicker(context,
                  initialDate: DateTime(DateTime.now().year - 18,
                      DateTime.now().month, DateTime.now().day),
                  lastDate: DateTime(DateTime.now().year - 18,
                      DateTime.now().month, DateTime.now().day),
                  dateFormat: "dd-MMMM-yyyy",
                  locale: DateTimePickerLocale.en_us,
                  confirmText: "ok".tr,
                  cancelText: "cancel".tr,
                  titleText: 'date'.tr,
                  looping: false,
                  textColor: const Color(0xff2bad4b));
              if (datePicked != null) {
                controller.dateController.text =
                    datePicked.toString().substring(0, 10);
                // controller.getSalesData();
              }
            },
            alignment: Alignment.center));
  }

  /// Section Widget
  Widget _buildPhoneNumber() {
    return Padding(
        padding: EdgeInsets.only(left: 28.h, right: 38.h),
        child: CustomTextFormField(
            controller: controller.farmerPhoneController,
            hintText: "lbl_phone_number".tr,
            textInputType: TextInputType.phone,
            alignment: Alignment.center,
            validator: (value) {
              // if (!isValidPhone(value)) {
              //   return "err_msg_please_enter_valid_phone_number".tr;
              // }
              return null;
            }));
  }

  /// Section Widget
  Widget _buildOwnSmartPhone() {
    return Padding(
        padding: EdgeInsets.only(left: 28.h, right: 38.h),
        child: Obx(() => CustomCheckboxButton(
            text: "ownSmartPhone".tr,
            value: controller.ownSmartPhone.value,
            padding: EdgeInsets.symmetric(vertical: 2.v),
            textStyle: CustomTextStyles.titleSmallGray50001,
            onChange: (value) {
              controller.ownSmartPhone.value = value;
            })));
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
