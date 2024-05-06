// // import 'dart:io';

// import 'package:flutter/services.dart';
// // import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:saidi_s_application3/core/app_export.dart';
// import 'package:saidi_s_application3/presentation/input_collection_tab/models/member_orders_request_model.dart';

// import '../../widgets/custom_elevated_button.dart';

// //Show recipt dealog
// void showReciptDealog(MemberOrdersRequest order) {
//   Get.dialog(
//     Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Center(
//         child: Container(
//           width: 354.h,
//           padding: EdgeInsets.symmetric(vertical: 38.v),
//           decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
//             borderRadius: BorderRadiusStyle.roundedBorder10,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   "lbl_mtewele_agrovet".tr.toUpperCase(),
//                   style: CustomTextStyles.titleMediumBold,
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.center,
//                 child: Container(
//                   width: 313.h,
//                   margin: EdgeInsets.only(
//                     left: 21.h,
//                     top: 12.v,
//                     right: 20.h,
//                   ),
//                   child: RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: "lbl_mobile".tr,
//                           style: CustomTextStyles.labelLargeBold,
//                         ),
//                         TextSpan(
//                           text: "lbl_0712365478".tr,
//                           style: theme.textTheme.labelLarge,
//                         ),
//                         TextSpan(
//                           text: "lbl_tin".tr,
//                           style: CustomTextStyles.labelLargeBold,
//                         ),
//                         TextSpan(
//                           text: "lbl_1653_5566".tr,
//                           style: theme.textTheme.labelLarge,
//                         ),
//                         TextSpan(
//                           text: "lbl_p_o_box".tr,
//                           style: CustomTextStyles.labelLargeBold,
//                         ),
//                         TextSpan(
//                           text: "lbl_1235_njombe".tr,
//                           style: theme.textTheme.labelLarge,
//                         ),
//                         TextSpan(
//                           text: "lbl_vrn".tr,
//                           style: CustomTextStyles.labelLargeBold,
//                         ),
//                         TextSpan(
//                           text: "lbl_registered".tr,
//                           style: theme.textTheme.labelLarge,
//                         ),
//                         TextSpan(
//                           text: "lbl_serial_number".tr,
//                           style: CustomTextStyles.labelLargeBold,
//                         ),
//                         TextSpan(
//                           text: "lbl_10tz103279".tr,
//                           style: theme.textTheme.labelLarge,
//                         ),
//                         TextSpan(
//                           text: "lbl_uin".tr,
//                           style: CustomTextStyles.labelLargeBold,
//                         ),
//                         TextSpan(
//                           text: "msg_09vfdwebapi_101".tr,
//                           style: theme.textTheme.labelLarge,
//                         ),
//                         TextSpan(
//                           text: "msg_tax_office_tax".tr,
//                           style: CustomTextStyles.labelLargeBold,
//                         ),
//                       ],
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 12.v),
//               Divider(
//                 color: appTheme.gray300,
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 23.h,
//                   top: 5.v,
//                 ),
//                 child: Text(
//                   "lbl_jina_la_mteja".tr,
//                   style: CustomTextStyles.titleSmallBlack900,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 24.h,
//                   top: 1.v,
//                 ),
//                 child: Text(
//                   order.farmer != null
//                       ? order.farmer!.name!.toUpperCase()
//                       : order.phoneNumber.toString(),
//                   style: theme.textTheme.labelLarge,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 23.h,
//                   top: 21.v,
//                 ),
//                 child: Text(
//                   "msg_aina_ya_pembejeo".tr,
//                   style: CustomTextStyles.titleSmallBlack900,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 24.h,
//                   top: 2.v,
//                 ),
//                 child: Text(
//                   order.updatedFarmerOrganizations!
//                       .map((e) => e.itemName)
//                       .toList()
//                       .toString(),
//                   style: theme.textTheme.labelLarge,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 24.h),
//                 child: Text(
//                   "msg_kiasi_katika_mfuko".tr,
//                   style: CustomTextStyles.titleSmallBlack900,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 24.h,
//                   top: 3.v,
//                 ),
//                 child: Text(
//                   order.updatedFarmerOrganizations!
//                       .map((e) => e.deliveredCount)
//                       .toList()
//                       .toString(),
//                   style: theme.textTheme.labelLarge,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 23.h,
//                   top: 32.v,
//                 ),
//                 child: Text(
//                   "lbl_gharama_jumla".tr,
//                   style: CustomTextStyles.titleSmallBlack900,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 23.h,
//                   top: 1.v,
//                 ),
//                 child: Text(
//                   "lbl_tsh_140_000".tr,
//                   style: theme.textTheme.labelLarge,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 22.h,
//                   top: 14.v,
//                   right: 62.h,
//                 ),
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(top: 1.v),
//                       child: Text(
//                         "lbl_vat_18".tr,
//                         style: CustomTextStyles.titleSmallBlack900,
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 51.h),
//                       child: Text(
//                         "msg_jumla_ikiwa_na_vat".tr,
//                         style: CustomTextStyles.titleSmallBlack900,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 23.h,
//                   top: 1.v,
//                 ),
//                 child: Row(
//                   children: [
//                     Text(
//                       "lbl_tsh_25_200".tr,
//                       style: theme.textTheme.labelLarge,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 44.h),
//                       child: Text(
//                         "lbl_tsh_165_200".tr,
//                         style: theme.textTheme.labelLarge,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 13.v),
//               Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   "msg_kumbukumbu_namba".tr,
//                   style: CustomTextStyles.labelLargeBold_1,
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   "lbl_1239994".tr.toUpperCase(),
//                   style: theme.textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 9.v),
//               CustomImageView(
//                 svgPath: ImageConstant.imgGroup4,
//                 height: 124.adaptSize,
//                 width: 124.adaptSize,
//                 alignment: Alignment.center,
//               ),
//               SizedBox(height: 9.v),
//               Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   "lbl_scan_to_pay".tr.toUpperCase(),
//                   style: theme.textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5.v),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }

// //Show recipt one dealog
// void showReciptOneDealog(MemberOrdersRequest order) {
//   Get.dialog(
//     Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Center(
//         child: Container(
//           width: 354.h,
//           height: 354.v,
//           decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
//             borderRadius: BorderRadiusStyle.roundedBorder10,
//           ),
//           padding: EdgeInsets.symmetric(vertical: 18.v),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(left: 24.h),
//                 child: Text(
//                   order.farmer != null
//                       ? order.farmer!.name!.toUpperCase()
//                       : order.phoneNumber.toString(),
//                   style: theme.textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 7.v),
//               Divider(),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 23.h,
//                   top: 15.v,
//                 ),
//                 child: Text(
//                   "msg_aina_ya_pembejeo".tr,
//                   style: CustomTextStyles.labelLargeBold_1,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 24.h,
//                   top: 2.v,
//                 ),
//                 child: Text(
//                   order.updatedFarmerOrganizations!
//                       .map((e) => e.itemName)
//                       .toList()
//                       .toString(),
//                   style: theme.textTheme.labelLarge,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 24.h,
//                   top: 12.v,
//                 ),
//                 child: Text(
//                   "msg_kiasi_katika_mfuko".tr,
//                   style: CustomTextStyles.labelLargeBold_1,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 24.h,
//                   top: 1.v,
//                 ),
//                 child: Text(
//                   order.updatedFarmerOrganizations!
//                       .map((e) => e.deliveredCount)
//                       .toList()
//                       .toString(),
//                   style: theme.textTheme.labelLarge,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 24.h,
//                   top: 13.v,
//                 ),
//                 child: Text(
//                   "lbl_gharama_jumla".tr,
//                   style: CustomTextStyles.labelLargeBold_1,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 24.h,
//                   top: 1.v,
//                 ),
//                 child: Text(
//                   "lbl_tsh_140_000".tr,
//                   style: theme.textTheme.labelLarge,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 24.h,
//                   top: 11.v,
//                 ),
//                 child: Text(
//                   "lbl_kikundi".tr,
//                   style: CustomTextStyles.labelLargeBold_1,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 24.h,
//                   top: 2.v,
//                 ),
//                 child: Text(
//                   order.farmer != null
//                       ? order.farmer!.farmerOrganisation!.toUpperCase()
//                       : order.memberId.toString(),
//                   style: theme.textTheme.labelLarge,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 24.h,
//                   top: 13.v,
//                 ),
//                 child: Text(
//                   "msg_reference_namba".tr,
//                   style: CustomTextStyles.labelLargeBold_1,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 24.h,
//                   top: 1.v,
//                   bottom: 5.v,
//                 ),
//                 child: Text(
//                   "lbl_1239994".tr.toUpperCase(),
//                   style: theme.textTheme.labelLarge,
//                 ),
//               ),
//               SizedBox(
//                 height: 24,
//               ),
//               CustomElevatedButton(
//                 width: 131.h,
//                 text: "lbl_pakua".tr,
//                 margin: EdgeInsets.only(
//                   left: 111.h,
//                   right: 111.h,
//                   bottom: 32.v,
//                 ),
//                 rightIcon: Container(
//                   margin: EdgeInsets.only(left: 16.h),
//                   child: CustomImageView(
//                     svgPath: ImageConstant.imgArrowdown,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }

// //Function for Showing a Dialog
// void showCastomDialog(String midtext, Color color) {
//   Get.defaultDialog(
//       barrierDismissible: false,
//       onCancel: () {},
//       textCancel: "OK",
//       middleTextStyle: TextStyle(color: color),
//       title: "",
//       middleText: midtext);
// }

// void loadingDialog() {
//   Get.dialog(
//     Center(
//       child: Container(
//         width: 200.1,
//         height: 140.1,
//         decoration: BoxDecoration(
//           color: const Color(0xffffffff),
//           borderRadius: BorderRadius.circular(45.0),
//           boxShadow: const [
//             BoxShadow(
//               color: Color(0x28c1c1c1),
//               offset: Offset(0, 1),
//               blurRadius: 10,
//             ),
//           ],
//         ),
//         child: const SizedBox(
//           height: 75,
//           width: 75,
//           child: Center(
//             child: CircularProgressIndicator.adaptive(
//               strokeWidth: 3,
//             ),
//           ),
//         ),
//       ),
//     ),
//     barrierDismissible: false,
//   );
// }

// void showOtpDialog(onSubmit, farmerNumber) {
//   Get.dialog(
//       Center(
//         child: Container(
//           width: 300,
//           // margin: const EdgeInsets.all(8.0),
//           height: 250,
//           decoration: BoxDecoration(
//             color: const Color(0xffffffff),
//             borderRadius: BorderRadius.circular(17.0),
//             boxShadow: const [
//               BoxShadow(
//                 color: Color(0x28c1c1c1),
//                 offset: Offset(0, 1),
//                 blurRadius: 10,
//               ),
//             ],
//           ),
//           child: Scaffold(
//             backgroundColor: Colors.transparent,
//             resizeToAvoidBottomInset: false,
//             body: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Center(
//                 child: Column(
//                   children: [
//                     Text(
//                       '${"enterTheNumberSentToThePhoneNumberThatEnds".tr}$farmerNumber',
//                       style: const TextStyle(
//                         fontFamily: 'Montserrat',
//                         fontSize: 16,
//                         color: Color(0xff2d3c49),
//                         fontWeight: FontWeight.w500,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(
//                       height: 16,
//                     ),
//                     OtpTextField(
//                       numberOfFields: 4,
//                       inputFormatters: [
//                         LengthLimitingTextInputFormatter(1),
//                         FilteringTextInputFormatter.digitsOnly
//                       ],
//                       borderColor: const Color(0xff2bad4b),
//                       focusedBorderColor: const Color(0xff2bad4b),
//                       //set to true to show as box or false to show as dash
//                       showFieldAsBox: true,
//                       //runs when a code is typed in
//                       onCodeChanged: (String code) {
//                         //handle validation or checks here
//                       },
//                       //runs when every textfield is filled
//                       onSubmit: onSubmit, // end onSubmit
//                     ),
//                     const SizedBox(
//                       height: 16,
//                     ),
//                     const SizedBox(
//                       width: 201.0,
//                       height: 38.0,
//                       child: Text.rich(
//                         TextSpan(
//                           style: TextStyle(
//                             fontFamily: 'Montserrat',
//                             fontSize: 16,
//                             color: Color(0xff2d3c49),
//                           ),
//                           children: [
//                             TextSpan(
//                               text: 'Haujapokea nambari? \n',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             TextSpan(
//                               text: 'Tuma tena',
//                               style: TextStyle(
//                                 color: Color(0xff239ccf),
//                                 fontWeight: FontWeight.w600,
//                                 decoration: TextDecoration.underline,
//                               ),
//                             ),
//                           ],
//                         ),
//                         textHeightBehavior:
//                             TextHeightBehavior(applyHeightToFirstAscent: false),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 8,
//                     ),
//                     Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () => Get.back(),
//                           child: Container(
//                             width: 91.0,
//                             height: 33.0,
//                             color: Colors.red,
//                             child: Center(
//                               child: Text(
//                                 'cancel'.tr,
//                                 style: const TextStyle(
//                                   fontFamily: 'Montserrat',
//                                   fontSize: 13,
//                                   color: Color(0xffffffff),
//                                   height: 3,
//                                 ),
//                                 textHeightBehavior: const TextHeightBehavior(
//                                     applyHeightToFirstAscent: false),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       barrierDismissible: false);
// }

// void showSucsesfullDealog() {
//   Get.dialog(
//     Center(
//       child: Container(
//         width: 200.1,
//         height: 140.1,
//         decoration: BoxDecoration(
//           color: const Color(0xffffffff),
//           borderRadius: BorderRadius.circular(45.0),
//           boxShadow: const [
//             BoxShadow(
//               color: Color(0x28c1c1c1),
//               offset: Offset(0, 1),
//               blurRadius: 10,
//             ),
//           ],
//         ),
//         child: Center(
//           child: Column(
//             children: [
//               Container(
//                 width: 20,
//                 height: 20,
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage('assets/images/qrcode_logo.png'),
//                     fit: BoxFit.fitHeight,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               const Text("Umeuza kikamilifu")
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }

//   //  void showScanQrPage() {
//   //   int countQr = 0;
//   //   int atempt = 0;
//   //   Get.dialog(Scaffold(
//   //     backgroundColor: const Color(0xff2bad4b).withOpacity(0.5),
//   //     body: Center(
//   //       child: MobileScanner(
//   //         controller: MobileScannerController(
//   //           detectionSpeed: DetectionSpeed.noDuplicates,
//   //           // torchEnabled: true,
//   //         ),
//   //         onDetect: (capture) async {
//   //           atempt++;
//   //           if (countQr == 0 && atempt == 1) {
//   //             countQr++;
//   //             Get.back();
//   //             final List<Barcode> barcodes = capture.barcodes;
//   //             String qrcodeResult = barcodes.first.rawValue.toString();
//   //             if (qrCodesList.isNotEmpty) {
//   //               for (String qr in qrCodesList) {
//   //                 if (qr == qrcodeResult) {
//   //                   showErrorToast("sorryQrcodeAlreadyExist".tr);
//   //                   return;
//   //                 }
//   //               }
//   //             }
//   //             if (selectedRequirementsList.isNotEmpty) {
//   //               for (Order order in selectedRequirementsList) {
//   //                 if (order.qrcodeDetails != null) {
//   //                   for (String qr in order.qrcodeDetails!) {
//   //                     if (qr == qrcodeResult) {
//   //                       showErrorToast("sorryQrcodeAlreadyExist".tr);
//   //                       return;
//   //                     }
//   //                   }
//   //                 }
//   //               }
//   //             }
//   //             List<String> usedQrcode = await getUsedQRCodes();
//   //             if (usedQrcode.isNotEmpty) {
//   //               for (String item in usedQrcode) {
//   //                 if (qrcodeResult == item) {
//   //                   showErrorToast("sorryQrcodeAlreadyUsed".tr);
//   //                   return;
//   //                 }
//   //               }
//   //             }
//   //             List<String> localUsedQrcode = await getUsedLocalQRCodes();
//   //             if (localUsedQrcode.isNotEmpty) {
//   //               for (String item in localUsedQrcode) {
//   //                 if (qrcodeResult == item) {
//   //                   showErrorToast("sorryQrcodeAlreadyUsed".tr);
//   //                   return;
//   //                 }
//   //               }
//   //             }

//   //             loadingDialog();
//   //             bool internetTest = await checkInternetConnection();
//   //             String token = await getAccessToken();
//   //             if (internetTest) {
//   //               VerfyQrCodeRequest requestOtpRequest = VerfyQrCodeRequest(
//   //                   userableId: user.value.userableId, qrCode: qrcodeResult);

//   //               final response = await VerfyQrCodeRequestProvider()
//   //                   .postVerfyQrCodeRequest(requestOtpRequest, token);
//   //               if (response.statusCode == 200) {
//   //                 Get.back();
//   //                 int missMatchCount = 0;
//   //                 for (int i = 0; i < selectedRequirementsList.length; i++) {
//   //                   String itemId = selectedRequirementsList
//   //                       .elementAt(i)
//   //                       .item!
//   //                       .toString()
//   //                       .padLeft(3, "0");
//   //                   String importer = selectedImporter.value.importerId
//   //                       .toString()
//   //                       .padLeft(4, "0");
//   //                   String agrodealerId =
//   //                       user.value.userType.toString() == "agrodealer"
//   //                           ? user.value.userableId.toString().padLeft(5, "0")
//   //                           : user.value.parentAgrodealerId
//   //                               .toString()
//   //                               .padLeft(5, "0");
//   //                   RegExp qrcodeRegex = RegExp(
//   //                       '^[0-9]{2}$importer$agrodealerId$itemId[0-9]{6}');
//   //                   if (qrcodeRegex.hasMatch(qrcodeResult)) {
//   //                     if (selectedRequirementsList.elementAt(i).qrcodeDetails ==
//   //                         null) {
//   //                       selectedRequirementsList.elementAt(i).qrcodeDetails =
//   //                           [];
//   //                       selectedRequirementsList
//   //                           .elementAt(i)
//   //                           .qrcodeDetails!
//   //                           .add(qrcodeResult);
//   //                       qrCodesList.add(qrcodeResult);
//   //                       showNoErrorToast("sucessfulSaved".tr);
//   //                     } else if (selectedRequirementsList
//   //                             .elementAt(i)
//   //                             .qrcodeDetails!
//   //                             .length <
//   //                         selectedRequirementsList
//   //                             .elementAt(i)
//   //                             .onSaleItemCount!) {
//   //                       selectedRequirementsList
//   //                           .elementAt(i)
//   //                           .qrcodeDetails!
//   //                           .add(qrcodeResult);
//   //                       qrCodesList.add(qrcodeResult);
//   //                       showNoErrorToast("sucessfulSaved".tr);
//   //                     } else {
//   //                       showNoErrorToast("qrcodeNameIsTakenSuccessfully".tr +
//   //                           selectedRequirementsList
//   //                               .elementAt(i)
//   //                               .itemName
//   //                               .toString());
//   //                     }
//   //                     return;
//   //                   } else {
//   //                     missMatchCount++;
//   //                     if (missMatchCount == selectedRequirementsList.length) {
//   //                       showErrorToast("incorrect".tr);
//   //                       return;
//   //                     }
//   //                   }
//   //                 }
//   //               } else if (response.statusCode == 401) {
//   //                 Get.back();
//   //                 logOut();
//   //               } else {
//   //                 Get.back();
//   //                 ResponseHandler().responseHandlerOnSinglePage(response);
//   //               }
//   //             } else {
//   //               showErrorToast("failed".tr);
//   //             }
//   //           }
//   //         },
//   //       ),
//   //     ),
//   //   ));
//   // }
