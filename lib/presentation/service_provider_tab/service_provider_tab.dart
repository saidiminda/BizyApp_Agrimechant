import 'controller/service_provider_tab_controller.dart';
import 'models/service_provider_tab_model.dart';
import 'package:flutter/material.dart';
import 'package:saidi_s_application3/core/app_export.dart';
import 'package:saidi_s_application3/widgets/custom_drop_down.dart';
import 'package:saidi_s_application3/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class ServiceProviderTab extends StatelessWidget {
  ServiceProviderTab({Key? key})
      : super(
          key: key,
        );

  ServiceProviderTabController controller =
      Get.put(ServiceProviderTabController(ServiceProviderTabModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
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
                          "BASIC INFORMATION".tr.toUpperCase(),
                          style: CustomTextStyles.titleMediumGreen900Bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          top: 22.v,
                        ),
                        child: Text(
                          "Select the relevant crop ".tr,
                          style: CustomTextStyles.titleSmallBluegray400,
                        ),
                      ),
                      SizedBox(height: 9.v),
                      CustomDropDown(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: appTheme.blueGray10002,
                        ),
                        hintText: "Select the relevant crop".tr,
                        items: controller.iphone14PlusSixModelObj.value
                            .dropdownItemList.value,
                        onChanged: (value) {
                          controller.onSelected(value);
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
                          "BASIC INFORMATION (Details of Contact Person)"
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
                          "Name of Entity".tr,
                          style: CustomTextStyles.titleSmallBluegray400,
                        ),
                      ),
                      SizedBox(height: 9.v),
                      CustomTextFormField(
                        controller: controller.jinalaController,
                        hintText: "Name of Entity".tr,
                        hintStyle: theme.textTheme.titleSmall!,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          top: 22.v,
                        ),
                        child: Text(
                          "Name".tr,
                          style: CustomTextStyles.titleSmallBluegray400,
                        ),
                      ),
                      SizedBox(height: 9.v),
                      CustomTextFormField(
                        controller: controller.jinaController,
                        hintText: "Name".tr,
                        hintStyle: theme.textTheme.titleSmall!,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          top: 22.v,
                        ),
                        child: Text(
                          "Phone No.".tr,
                          style: CustomTextStyles.titleSmallBluegray400,
                        ),
                      ),
                      SizedBox(height: 9.v),
                      CustomTextFormField(
                        // controller: controller.jinaController,
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

                        hintText: "Phone No.".tr,
                        hintStyle: theme.textTheme.titleSmall!,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          top: 22.v,
                        ),
                        child: Text(
                          "E-mail Address".tr,
                          style: CustomTextStyles.titleSmallBluegray400,
                        ),
                      ),
                      SizedBox(height: 9.v),
                      CustomTextFormField(
                        controller: controller.baruapepeyaController,
                        hintText: "E-mail Address".tr,
                        hintStyle: theme.textTheme.titleSmall!,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          top: 22.v,
                        ),
                        child: Text(
                          "Tarehe ya kuzaliwa".tr,
                          style: CustomTextStyles.titleSmallBluegray400,
                        ),
                      ),
                      SizedBox(height: 9.v),
                      CustomTextFormField(
                        // controller: controller.nambariyatinController,
                        hintText: "Tarehe ya kuzaliwa".tr,
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
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          top: 22.v,
                        ),
                        child: Text(
                          "Select Level of Education".tr,
                          style: CustomTextStyles.titleSmallBluegray400,
                        ),
                      ),
                      SizedBox(height: 9.v),
                      CustomDropDown(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: appTheme.blueGray10002,
                        ),
                        hintText: "Select Level of Education".tr,
                        items: controller.iphone14PlusSixModelObj.value
                            .dropdownItemList.value,
                        onChanged: (value) {
                          controller.onSelected(value);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          top: 22.v,
                        ),
                        child: Text(
                          "Select Village".tr,
                          style: CustomTextStyles.titleSmallBluegray400,
                        ),
                      ),
                      SizedBox(height: 9.v),
                      CustomDropDown(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: appTheme.blueGray10002,
                        ),
                        hintText: "Select Village".tr,
                        items: controller.iphone14PlusSixModelObj.value
                            .dropdownItemList.value,
                        onChanged: (value) {
                          controller.onSelected(value);
                        },
                      ),
                      SizedBox(height: 20.v),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "SOCIOECONOMIC & GENERAL BUSINESS DETAILS"
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
                          "Select Type of Business Registration/Ownership".tr,
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
                            "Select Type of Business Registration/Ownership".tr,
                        items: controller.iphone14PlusSixModelObj.value
                            .dropdownItemList.value,
                        onChanged: (value) {
                          controller.onSelected(value);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          top: 22.v,
                        ),
                        child: Text(
                          "Select other Value chain activities does your entity engage in"
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
                            "Select other Value chain activities does your entity engage in"
                                .tr,
                        items: controller.iphone14PlusSixModelObj.value
                            .dropdownItemList.value,
                        onChanged: (value) {
                          controller.onSelected(value);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          top: 22.v,
                        ),
                        child: Text(
                          "Which of the other value chains do you operate in"
                              .tr,
                          style: CustomTextStyles.titleSmallBluegray400,
                        ),
                      ),
                      SizedBox(height: 9.v),
                      CustomTextFormField(
                        controller: controller.nambariyaController,
                        hintText:
                            "Which of the other value chains do you operate in"
                                .tr,
                        hintStyle: theme.textTheme.titleSmall!,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          top: 22.v,
                        ),
                        child: Text(
                          "Total annual sales over the past three (3) years".tr,
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
                                      'Year'.tr.toUpperCase(),
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
                                        'Annual Sales'.tr.toUpperCase(),
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
                              children: [2021, 2022, 2023].map((order) {
                                return TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        height: 36.0,
                                        color: const Color(0xffe7fff9),
                                        child: Center(
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
                                          cursorColor: const Color(0xff2bad4b),
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
                          "What is your annual cost of operations? Please provide information in the table below:"
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
                                      'Category of Cost'.tr.toUpperCase(),
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
                                        'Cost Amount (GHS)'.tr.toUpperCase(),
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
                                "Input cost including fertilizer",
                                "Labor cost",
                                "Other operational cost"
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
                                          validator: (value) {
                                            return;
                                          },
                                          cursorColor: const Color(0xff2bad4b),
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
                          "Number of employees".tr,
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
                                      'Type'.tr.toUpperCase(),
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
                                        'Male'.tr.toUpperCase(),
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
                                      'Female'.tr.toUpperCase(),
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
                              children: ["Permanent", "Casual/Temporary"]
                                  .map((order) {
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
                                          validator: (value) {
                                            return;
                                          },
                                          cursorColor: const Color(0xff2bad4b),
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
                                          cursorColor: const Color(0xff2bad4b),
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
                          "SHow does your entity promote and reach out to its markets? Please elaborate below:"
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
                            "SHow does your entity promote and reach out to its markets? Please elaborate below:"
                                .tr,
                        items: controller.iphone14PlusSixModelObj.value
                            .dropdownItemList.value,
                        onChanged: (value) {
                          controller.onSelected(value);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          top: 22.v,
                        ),
                        child: Text(
                          "Who are the main 3 buyers of your products? Please provide information in the table below:"
                              .tr,
                          style: CustomTextStyles.titleSmallBluegray400,
                        ),
                      ),
                      SizedBox(height: 9.v),
                      ExpansionPanelList.radio(
                          elevation: 0,
                          children: [1, 2, 3].map((farm) {
                            TextEditingController farmSizeController =
                                TextEditingController();
                            Rx<SelectionPopupModel> farmOwnership =
                                SelectionPopupModel(title: "").obs;

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
                                          "${'Buyer'.tr} #${farm}",
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
                                        'Name'.tr,
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
                                          // farm.farmSize = value;
                                        },
                                        validator: (value) {
                                          return null;
                                        },
                                        textInputType: TextInputType.number,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Region'.tr,
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
                                            // farm.villageId = value.id;
                                          }
                                        },
                                        items: controller
                                            .iphone14PlusSixModelObj
                                            .value
                                            .dropdownItemList
                                            .value,
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        'Measurement\n[Litres, MT or KG]'.tr,
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
                                            // controller.farmInfos
                                            //     .elementAt(controller.farmInfos
                                            //         .indexOf(farm))
                                            //     .ownership = value.value;
                                          }
                                        },
                                        items: controller
                                            .iphone14PlusSixModelObj
                                            .value
                                            .dropdownItemList
                                            .value,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Volumes Bought'.tr,
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
                                          // farm.farmSize = value;
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
                          "What difficulties do you face in accessing markets?What are the top 3 difficulties you face in accessing clients?"
                              .tr,
                          style: CustomTextStyles.titleSmallBluegray400,
                        ),
                      ),
                      SizedBox(height: 9.v),
                      CustomTextFormField(
                        controller: controller.nambariyaController,
                        hintText:
                            "What difficulties do you face in accessing markets?What are the top 3 difficulties you face in accessing clients?"
                                .tr,
                        hintStyle: theme.textTheme.titleSmall!,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          top: 22.v,
                        ),
                        child: Text(
                          "What are your sources of market information? Please select at least one"
                              .tr,
                          style: CustomTextStyles.titleSmallBluegray400,
                        ),
                      ),
                      SizedBox(height: 9.v),
                      CustomTextFormField(
                        controller: controller.nambariyaController,
                        hintText:
                            "What are your sources of market information? Please select at least one"
                                .tr,
                        hintStyle: theme.textTheme.titleSmall!,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          top: 22.v,
                        ),
                        child: Text(
                          "From your experience, who are your top 3 competitors"
                              .tr,
                          style: CustomTextStyles.titleSmallBluegray400,
                        ),
                      ),
                      SizedBox(height: 9.v),
                      CustomTextFormField(
                        controller: controller.nambariyatinController,
                        hintText: "Competitor".tr,
                        hintStyle: theme.textTheme.titleSmall!,
                      ),
                      CustomTextFormField(
                        controller: controller.nambariyatinController,
                        hintText: "Competitor".tr,
                        hintStyle: theme.textTheme.titleSmall!,
                      ),
                      CustomTextFormField(
                        controller: controller.nambariyatinController,
                        hintText: "Competitor".tr,
                        hintStyle: theme.textTheme.titleSmall!,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          top: 22.v,
                        ),
                        child: Text(
                          "How do you source clients? Please elaborate".tr,
                          style: CustomTextStyles.titleSmallBluegray400,
                        ),
                      ),
                      SizedBox(height: 9.v),
                      CustomTextFormField(
                        controller: controller.nambariyatinController,
                        hintText:
                            "How do you source clients? Please elaborate".tr,
                        hintStyle: theme.textTheme.titleSmall!,
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          top: 22.v,
                        ),
                        child: Text(
                          "Are you currently a member of any value chain related organization? "
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
                            "Are you currently a member of any value chain related organization? "
                                .tr,
                        items: controller.iphone14PlusSixModelObj.value
                            .dropdownItemList.value,
                        onChanged: (value) {
                          controller.onSelected(value);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          top: 22.v,
                        ),
                        child: Text(
                          "What type of finance have you used in the establishment of your Enterprise/Group? "
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
                                      'Type of finance'.tr.toUpperCase(),
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
                              children: [
                                "Owner's Equity",
                                "Bank",
                                "Family and Relations",
                                "Grants"
                              ].map((order) {
                                return TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        height: 36.0,
                                        color: const Color(0xffe7fff9),
                                        child: Center(
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
                                          cursorColor: const Color(0xff2bad4b),
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
                          "What are the major problems related to existing policies and regulations around the value chain in which you operate?"
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
                            "What are the major problems related to existing policies and regulations around the value chain in which you operate? "
                                .tr,
                        items: controller.iphone14PlusSixModelObj.value
                            .dropdownItemList.value,
                        onChanged: (value) {
                          controller.onSelected(value);
                        },
                      ),
                      SizedBox(height: 20.v),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "CORE BUSINES & OPERATIONAL DETAILS".tr.toUpperCase(),
                          style: CustomTextStyles.titleMediumGreen900Bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          top: 22.v,
                        ),
                        child: Text(
                          "Please specify the total production and/or aggregation capacity (volumes) of your entity per year over the past three (3) years."
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
                                      'Year'.tr.toUpperCase(),
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
                                        'Area Under Cultivation'
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
                                      'Measurement'.tr.toUpperCase(),
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
                                      'Volume Cultivated'.tr.toUpperCase(),
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
                              children: [2021, 2022, 2023].map((order) {
                                return TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        height: 36.0,
                                        color: const Color(0xffe7fff9),
                                        child: Center(
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
                                          cursorColor: const Color(0xff2bad4b),
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
                                          cursorColor: const Color(0xff2bad4b),
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
                                          cursorColor: const Color(0xff2bad4b),
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
                          "Please select any other crop your entity operates in and specify the total production and/or aggregation volume over the past 3 years."
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
                                        'Crops'.tr.toUpperCase(),
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
                                      'Production (MT)'.tr.toUpperCase(),
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
                                      'Aggregation (MT)'.tr.toUpperCase(),
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
                              children: [2021, 2022, 2023].map((order) {
                                return TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        height: 36.0,
                                        color: const Color(0xffe7fff9),
                                        child: Center(
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
                                          cursorColor: const Color(0xff2bad4b),
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
                                          cursorColor: const Color(0xff2bad4b),
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
                                          cursorColor: const Color(0xff2bad4b),
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
                          "What is the source of energy for the warehouse".tr,
                          style: CustomTextStyles.titleSmallBluegray400,
                        ),
                      ),
                      SizedBox(height: 9.v),
                      CustomDropDown(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: appTheme.blueGray10002,
                        ),
                        items: controller.iphone14PlusSixModelObj.value
                            .dropdownItemList1.value,
                        onChanged: (value) {
                          controller.onSelected1(value);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          top: 22.v,
                        ),
                        child: Text(
                          "What training will you need for your work as a producer and aggregator? "
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
                            "What training will you need for your work as a producer and aggregator?"
                                .tr,
                        items: controller.iphone14PlusSixModelObj.value
                            .dropdownItemList2.value,
                        onChanged: (value) {
                          controller.onSelected2(value);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 4.h,
                          top: 21.v,
                        ),
                        child: Text(
                          "How do you ensure that the right quality of inputs and/or raw materials are provided by your suppliers?"
                              .tr,
                          style: CustomTextStyles.titleSmallBluegray400,
                        ),
                      ),
                      SizedBox(height: 10.v),
                      SizedBox(
                        height: 49.v,
                        width: 385.h,
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgGroup11,
                              height: 49.v,
                              width: 385.h,
                              radius: BorderRadius.circular(
                                7.h,
                              ),
                              alignment: Alignment.center,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 23.h),
                                child: Text(
                                  "lbl_0".tr,
                                  style: CustomTextStyles.titleSmallGray40001,
                                ),
                              ),
                            ),
                          ],
                        ),
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
    );
  }
}
