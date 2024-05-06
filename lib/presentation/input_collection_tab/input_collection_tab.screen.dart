import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../core/utils/functions/global.dart';
import 'controllers/input_collection_tab.controller.dart';
import 'models/member_orders_request_model.dart';
import 'models/stock_and_qr_v1_response_model.dart';

// ignore: must_be_immutable
class InputCollectionTabScreen extends StatelessWidget {
  InputCollectionTabScreen({Key? key}) : super(key: key);
  InputCollectionTabController controller =
      Get.put(InputCollectionTabController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffffffff),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 16, left: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Obx(
              //   () => Text(
              //     '${controller.user.value.fullName}',
              //     style: const TextStyle(
              //       fontFamily: 'Montserrat',
              //       fontSize: 12,
              //       color: Color(0xff2bad4b),
              //       fontWeight: FontWeight.w700,
              //     ),
              //   ),
              // ),
              // Center(
              //   child: Text(
              //     'makeSureTheInformationYouFillOutIsTrue'.tr,
              //     style: const TextStyle(
              //       fontFamily: 'Montserrat',
              //       fontSize: 12,
              //       color: Colors.red,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 8,
              // ),
              // Obx(
              //   () => Center(
              //     child: Text(
              //       '${'version'.tr} ${controller.applicationVersion.value}',
              //       style: const TextStyle(
              //         fontFamily: 'Montserrat',
              //         fontSize: 12,
              //         color: Colors.green,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //   ),
              // ),

              const SizedBox(
                height: 16,
              ),
              Text(
                'farmerIdentificationNumber'.tr.toUpperCase(),
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  color: Color(0xff2bad4b),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Form(
                key: controller.formKey,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.farmerNumberController,
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (value) {
                    if (controller.formKey.currentState!.validate()) {
                      controller
                          .getFarmer(controller.farmerNumberController.text);
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
                        if (controller.formKey.currentState!.validate()) {
                          controller.getFarmer(
                              controller.farmerNumberController.text);
                        }
                      },
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xff2bad4b)),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xff2bad4b)),
                    ),
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                    visible: !controller.startScanningQr.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'village'.tr.toUpperCase(),
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            color: Color(0xff2bad4b),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextFormField(
                          controller: controller.farmerVillageController,
                          enabled: false,
                          cursorColor: const Color(0xff2bad4b),
                          style: const TextStyle(
                              letterSpacing: 0.1, color: Color(0xff4a4a4a)),
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xffe7fff9),
                              border: InputBorder.none),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'mobilePhone'.tr.toUpperCase(),
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            color: Color(0xff2bad4b),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextFormField(
                          controller: controller.farmPhoneController,
                          enabled: false,
                          cursorColor: const Color(0xff2bad4b),
                          style: const TextStyle(
                              letterSpacing: 0.1, color: Color(0xff4a4a4a)),
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xffe7fff9),
                              border: InputBorder.none),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'farmSize'.tr.toUpperCase(),
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            color: Color(0xff2bad4b),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextFormField(
                          controller: controller.farmSizeController,
                          enabled: false,
                          cursorColor: const Color(0xff2bad4b),
                          style: const TextStyle(
                              letterSpacing: 0.1, color: Color(0xff4a4a4a)),
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xffe7fff9),
                              border: InputBorder.none),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'farmerName'.tr.toUpperCase(),
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            color: Color(0xff2bad4b),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextFormField(
                          controller: controller.farmerNameController,
                          enabled: false,
                          cursorColor: const Color(0xff2bad4b),
                          style: const TextStyle(
                              letterSpacing: 0.1, color: Color(0xff4a4a4a)),
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xffe7fff9),
                              border: InputBorder.none),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(
                () => Visibility(
                  visible: controller.showSellingArea.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                          visible: controller.importers.length > 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'selectImporter'.tr.toUpperCase(),
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  color: Color(0xff2bad4b),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Obx(
                                () => DropdownButtonFormField<Importers>(
                                  value: controller.selectedImporter.value
                                              .importerId !=
                                          null
                                      ? controller.selectedImporter.value
                                      : null,
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Color(0xff2bad4b),
                                  ),
                                  isExpanded: true,
                                  elevation: 16,
                                  style: const TextStyle(
                                      letterSpacing: 0.1,
                                      color: Color(0xff4a4a4a)),
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
                                  onChanged: (Importers? value) {
                                    controller.selectedImporter.value = value!;
                                    controller.warehouses.value =
                                        value.warehouses!;
                                    controller.currentStocks.value = [];
                                    if (controller.warehouses.length == 1) {
                                      controller.selectedWarehouse.value =
                                          controller.warehouses.first;
                                      controller.currentStocks.value =
                                          controller
                                              .warehouses.first.currentStock!;
                                    }
                                    controller
                                        .setMultipleSelectionRequirementsList();
                                  },
                                  items: controller.importers
                                      .map<DropdownMenuItem<Importers>>(
                                          (Importers value) {
                                    return DropdownMenuItem<Importers>(
                                      value: value,
                                      child: Text(value.name!),
                                    );
                                  }).toList(),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          )),
                      Obx(
                        () => Visibility(
                            visible: controller.warehouses.length > 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'selectWarehouse'.tr.toUpperCase(),
                                  style: const TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12,
                                    color: Color(0xff2bad4b),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Obx(
                                  () => DropdownButtonFormField<Warehouses>(
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Color(0xff2bad4b),
                                    ),
                                    isExpanded: true,
                                    elevation: 16,
                                    style: const TextStyle(
                                        letterSpacing: 0.1,
                                        color: Color(0xff4a4a4a)),
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
                                    onChanged: (Warehouses? value) {
                                      controller.selectedWarehouse.value =
                                          value!;
                                      controller.currentStocks.value =
                                          value.currentStock!;
                                      controller
                                          .setMultipleSelectionRequirementsList();
                                    },
                                    items: controller.warehouses
                                        .map<DropdownMenuItem<Warehouses>>(
                                            (Warehouses value) {
                                      return DropdownMenuItem<Warehouses>(
                                        value: value,
                                        child: Text(value.name!),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            )),
                      ),
                      Text(
                        'selectProduct'.tr,
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                          color: Color(0xff2bad4b),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      MultiSelectDialogField<Order>(
                        chipDisplay: MultiSelectChipDisplay.none(),
                        searchable: true,
                        items: controller.items,
                        cancelText: Text('cancel'.tr.toUpperCase()),
                        confirmText: Text("save".tr.toUpperCase()),
                        title: Text("selectProduct".tr),
                        selectedColor: const Color(0xff2bad4b),
                        decoration: const BoxDecoration(
                          color: Color(0xffe7fff9),
                        ),
                        buttonIcon: const Icon(
                          Icons.add,
                          color: Color(0xff2bad4b),
                        ),
                        buttonText: Text(
                          "product".tr,
                          style: const TextStyle(
                              letterSpacing: 0.1, color: Color(0xff4a4a4a)),
                        ),
                        onConfirm: (results) {
                          controller.selectedRequirementsList.value = results;
                        },
                      ),
                      Visibility(
                          visible:
                              controller.selectedRequirementsList.isNotEmpty,
                          child: Column(
                            children: [
                              Table(
                                columnWidths: const <int, TableColumnWidth>{
                                  0: FlexColumnWidth(),
                                  1: FlexColumnWidth(),
                                  2: FixedColumnWidth(64),
                                  3: FixedColumnWidth(64)
                                },
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                children: <TableRow>[
                                  TableRow(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          'product'.tr.toUpperCase(),
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
                                            'priceEach'.tr.toUpperCase(),
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
                                        child: SizedBox(
                                          width: 34.0,
                                          height: 15.0,
                                          child: Text(
                                            'stock'.tr.toUpperCase(),
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
                                          'subsidyQuantity'.tr.toUpperCase(),
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
                              Obx(
                                () => Form(
                                  key: controller.sellingFormKey,
                                  child: Table(
                                    columnWidths: const <int, TableColumnWidth>{
                                      0: FlexColumnWidth(),
                                      1: FlexColumnWidth(),
                                      2: FixedColumnWidth(64),
                                      3: FixedColumnWidth(64)
                                    },
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    children: controller
                                        .selectedRequirementsList
                                        .map((order) {
                                      TextEditingController quantityController =
                                          TextEditingController();
                                      if ((order.onSaleItemCount ?? 0) > 0) {
                                        quantityController.text =
                                            order.onSaleItemCount.toString();
                                      }
                                      // else {
                                      //   quantityController.text = "0";
                                      // }

                                      return TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              height: 36.0,
                                              color: const Color(0xffe7fff9),
                                              child: Center(
                                                child: Text(
                                                  order.itemName.toString(),
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
                                            child: Container(
                                              color: const Color(0xffe7fff9),
                                              height: 36.0,
                                              child: Center(
                                                child: Text(
                                                  controller.numberFormat
                                                      .format(order.price),
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
                                            child: Container(
                                              color: const Color(0xffe7fff9),
                                              height: 36.0,
                                              child: Center(
                                                child: Text(
                                                  order.quantity.toString(),
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
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: (value) {
                                                  if (value
                                                      .toString()
                                                      .isEmpty) {
                                                    return "required".tr;
                                                  } else if (num.parse(
                                                          value.toString()) <=
                                                      0) {
                                                    return "enterTheQuantityCorrectly"
                                                        .tr;
                                                  }
                                                  // else if (order.quantity! <
                                                  //     num.parse(
                                                  //         value.toString())) {
                                                  //   return "quantityExceedStock"
                                                  //           .tr +
                                                  //       order.quantity
                                                  //           .toString();
                                                  // }

                                                  return null;
                                                },
                                                onChanged: (value) {
                                                  if (value.isNotEmpty) {
                                                    controller
                                                        .calculateFarmerSubsidy(
                                                            controller
                                                                .selectedRequirementsList
                                                                .indexOf(order),
                                                            num.parse(value));
                                                  } else {
                                                    controller
                                                        .calculateFarmerSubsidy(
                                                            controller
                                                                .selectedRequirementsList
                                                                .indexOf(order),
                                                            0);
                                                  }
                                                },
                                                cursorColor:
                                                    const Color(0xff2bad4b),
                                                style: const TextStyle(
                                                    letterSpacing: 0.1,
                                                    color: Color(0xff4a4a4a)),
                                                decoration:
                                                    const InputDecoration(
                                                  filled: true,
                                                  fillColor: Color(0xffe7fff9),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        color:
                                                            Color(0xff2bad4b)),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        color:
                                                            Color(0xff2bad4b)),
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
                              ),
                              Table(
                                columnWidths: const <int, TableColumnWidth>{
                                  0: FlexColumnWidth(),
                                  1: FlexColumnWidth(),
                                },
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                children: <TableRow>[
                                  TableRow(
                                    decoration: const BoxDecoration(
                                      color: Color(0xffe7fff9),
                                    ),
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          'total'.tr,
                                          style: const TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: Color(0xff4a4a4a),
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textHeightBehavior:
                                              const TextHeightBehavior(
                                                  applyHeightToFirstAscent:
                                                      false),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: SizedBox(
                                          width: 20.0,
                                          height: 15.0,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                controller.numberFormat.format(
                                                    controller
                                                        .newOnSaleTotalPrice
                                                        .value),
                                                style: const TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 14,
                                                  color: Color(0xff4a4a4a),
                                                  fontWeight: FontWeight.w500,
                                                  height: 4.428571428571429,
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
                                    ],
                                  ),
                                  TableRow(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          'subsidy'.tr,
                                          style: const TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: Color(0xff4a4a4a),
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textHeightBehavior:
                                              const TextHeightBehavior(
                                                  applyHeightToFirstAscent:
                                                      false),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: SizedBox(
                                          width: 121.0,
                                          height: 18.0,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                controller.numberFormat.format(
                                                    controller
                                                        .newOnSaleSubsidyAmount
                                                        .value),
                                                style: const TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 14,
                                                  color: Color(0xff4a4a4a),
                                                  fontWeight: FontWeight.w500,
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
                                    ],
                                  ),
                                  TableRow(
                                    decoration: const BoxDecoration(
                                      color: Color(0xff2bad4b),
                                    ),
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          'cash'.tr,
                                          style: const TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: Color(0xffffffff),
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textHeightBehavior:
                                              const TextHeightBehavior(
                                                  applyHeightToFirstAscent:
                                                      false),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              controller.numberFormat.format(
                                                  controller.setOnSaleCashAmount
                                                      .value),
                                              style: const TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 14,
                                                color: Color(0xffffffff),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textHeightBehavior:
                                                  const TextHeightBehavior(
                                                      applyHeightToFirstAscent:
                                                          false),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )),
                      // Obx(
                      //   () => Visibility(
                      //       visible: controller.startScanningQr.value,
                      //       child: Column(
                      //         children: [
                      //           const SizedBox(
                      //             height: 16,
                      //           ),
                      //           GestureDetector(
                      //             onTap: () => controller
                      //                 .validateSallingProductsQuantity(),
                      //             child: Center(
                      //               child: Container(
                      //                 width: 199.0,
                      //                 height: 67.0,
                      //                 decoration: BoxDecoration(
                      //                   borderRadius:
                      //                       BorderRadius.circular(12.0),
                      //                   border: Border.all(
                      //                       width: 1.0,
                      //                       color: const Color(0xff2bad4b)),
                      //                 ),
                      //                 child: Row(
                      //                   children: [
                      //                     Container(
                      //                       width: 40,
                      //                       height: 40,
                      //                       decoration: const BoxDecoration(
                      //                         image: DecorationImage(
                      //                           image: AssetImage(
                      //                               'assets/images/qrcode_logo.png'),
                      //                           fit: BoxFit.fitHeight,
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     const SizedBox(
                      //                       width: 86.0,
                      //                       height: 15.0,
                      //                       child: Stack(
                      //                         children: <Widget>[
                      //                           SizedBox.expand(
                      //                               child: Text(
                      //                             'Scan QR Code',
                      //                             style: TextStyle(
                      //                               fontFamily: 'Montserrat',
                      //                               fontSize: 12,
                      //                               color: Color(0xff2bad4b),
                      //                               fontWeight: FontWeight.w500,
                      //                             ),
                      //                           )),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       )),
                      // ),
                      // Obx(
                      //   () => Visibility(
                      //       visible: controller.qrCodesList.isNotEmpty,
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           const SizedBox(
                      //             height: 16,
                      //           ),
                      //           Text(
                      //             'productsYouScanned'.tr,
                      //             style: const TextStyle(
                      //               fontFamily: 'Montserrat',
                      //               fontSize: 12,
                      //               color: Color(0xffb0b0b0),
                      //               fontWeight: FontWeight.w500,
                      //             ),
                      //           ),
                      //           Table(
                      //             columnWidths: const <int, TableColumnWidth>{
                      //               0: FixedColumnWidth(64),
                      //               1: FlexColumnWidth(),
                      //               2: FixedColumnWidth(64)
                      //             },
                      //             defaultVerticalAlignment:
                      //                 TableCellVerticalAlignment.middle,
                      //             children: <TableRow>[
                      //               TableRow(
                      //                 children: <Widget>[
                      //                   const Padding(
                      //                     padding: EdgeInsets.all(4.0),
                      //                     child: SizedBox(
                      //                       width: 20.0,
                      //                       height: 15.0,
                      //                       child: Text(
                      //                         'No.',
                      //                         style: TextStyle(
                      //                           fontFamily: 'Montserrat',
                      //                           fontSize: 12,
                      //                           color: Color(0xff2bad4b),
                      //                           fontWeight: FontWeight.w500,
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   Padding(
                      //                     padding: const EdgeInsets.all(4.0),
                      //                     child: Text(
                      //                       'product'.tr,
                      //                       style: const TextStyle(
                      //                         fontFamily: 'Montserrat',
                      //                         fontSize: 12,
                      //                         color: Color(0xff2bad4b),
                      //                         fontWeight: FontWeight.w500,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   Padding(
                      //                     padding: const EdgeInsets.all(4.0),
                      //                     child: Text(
                      //                       'action'.tr,
                      //                       style: const TextStyle(
                      //                         fontFamily: 'Montserrat',
                      //                         fontSize: 12,
                      //                         color: Color(0xff2bad4b),
                      //                         fontWeight: FontWeight.w500,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ],
                      //           ),
                      //           for (Order selectedOrder
                      //               in controller.selectedRequirementsList)
                      //             Column(
                      //               children: [
                      //                 if ((selectedOrder.qrcodeDetails ?? [])
                      //                     .isNotEmpty)
                      //                   Container(
                      //                     padding: const EdgeInsets.all(8),
                      //                     color: const Color(0xffb2fffc),
                      //                     child: Row(
                      //                       children: [
                      //                         Expanded(
                      //                           child: Text(
                      //                             "${selectedOrder.itemName}",
                      //                             style: const TextStyle(
                      //                               fontFamily: 'Montserrat',
                      //                               fontSize: 10,
                      //                               color: Color(0xff353535),
                      //                               fontWeight: FontWeight.w700,
                      //                             ),
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 Table(
                      //                   columnWidths: const <int,
                      //                       TableColumnWidth>{
                      //                     0: FixedColumnWidth(64),
                      //                     1: FlexColumnWidth(),
                      //                     2: FixedColumnWidth(64)
                      //                   },
                      //                   defaultVerticalAlignment:
                      //                       TableCellVerticalAlignment.middle,
                      //                   children: (selectedOrder
                      //                               .qrcodeDetails ??
                      //                           [])
                      //                       .map((qrCode) => TableRow(
                      //                             children: <Widget>[
                      //                               Padding(
                      //                                 padding:
                      //                                     const EdgeInsets.all(
                      //                                         4.0),
                      //                                 child: Container(
                      //                                   height: 36.0,
                      //                                   color: const Color(
                      //                                       0xffe7fff9),
                      //                                   child: Center(
                      //                                     child: Text(
                      //                                       "${(selectedOrder.qrcodeDetails ?? []).indexOf(qrCode) + 1}",
                      //                                       style:
                      //                                           const TextStyle(
                      //                                         fontFamily:
                      //                                             'Montserrat',
                      //                                         fontSize: 11,
                      //                                         color: Color(
                      //                                             0xff4a4a4a),
                      //                                         fontWeight:
                      //                                             FontWeight
                      //                                                 .w500,
                      //                                       ),
                      //                                       textHeightBehavior:
                      //                                           const TextHeightBehavior(
                      //                                               applyHeightToFirstAscent:
                      //                                                   false),
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                               Padding(
                      //                                 padding:
                      //                                     const EdgeInsets.all(
                      //                                         4.0),
                      //                                 child: Container(
                      //                                   color: const Color(
                      //                                       0xffe7fff9),
                      //                                   height: 36.0,
                      //                                   child: Center(
                      //                                     child: Text(
                      //                                       qrCode,
                      //                                       style:
                      //                                           const TextStyle(
                      //                                         fontFamily:
                      //                                             'Montserrat',
                      //                                         fontSize: 11,
                      //                                         color: Color(
                      //                                             0xff4a4a4a),
                      //                                         fontWeight:
                      //                                             FontWeight
                      //                                                 .w500,
                      //                                       ),
                      //                                       textHeightBehavior:
                      //                                           const TextHeightBehavior(
                      //                                               applyHeightToFirstAscent:
                      //                                                   false),
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                               Padding(
                      //                                 padding:
                      //                                     const EdgeInsets.all(
                      //                                         4.0),
                      //                                 child: GestureDetector(
                      //                                   onTap: () {
                      //                                     controller
                      //                                         .deleteQrcode(
                      //                                             qrCode);
                      //                                   },
                      //                                   child: Container(
                      //                                     height: 36.0,
                      //                                     decoration:
                      //                                         BoxDecoration(
                      //                                       color: const Color(
                      //                                           0xffe7fff9),
                      //                                       border: Border.all(
                      //                                           width: 1.0,
                      //                                           color: const Color(
                      //                                               0xffaff5c0)),
                      //                                     ),
                      //                                     child: const SizedBox(
                      //                                       width: 8.0,
                      //                                       height: 18.0,
                      //                                       child: Center(
                      //                                         child: Icon(
                      //                                           Icons.close,
                      //                                           color: Color(
                      //                                               0xff2bad4b),
                      //                                         ),
                      //                                       ),
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ],
                      //                           ))
                      //                       .toList(),
                      //                 ),
                      //               ],
                      //             ),
                      //         ],
                      //       )),
                      // ),
                      const SizedBox(
                        height: 16,
                      ),
                      Obx(
                        () => Visibility(
                          visible:
                              controller.selectedRequirementsList.isNotEmpty,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                if (controller.sellingFormKey.currentState!
                                    .validate()) {
                                  controller.startMakeSellingProduct();
                                } else {
                                  showErrorToast("failed".tr);
                                }
                              },
                              child: Container(
                                width: 130,
                                height: 39,
                                color: const Color(0xff2bad4b),
                                child: Center(
                                  child: Text(
                                    'sellProducts'.tr,
                                    style: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      color: Color(0xffffffff),
                                    ),
                                    textHeightBehavior:
                                        const TextHeightBehavior(
                                            applyHeightToFirstAscent: false),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
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
            ],
          ),
        ),
      ),
      // bottomNavigationBar: SizedBox(
      //   height: 80,
      //   child: BottomNavBar(),
      // ),
    );
  }
}
