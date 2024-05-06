import 'package:saidi_s_application3/presentation/input_collection_tab/models/member_orders_request_model.dart';

import '../controller/iphone_14_plus_two_controller.dart';
import 'package:flutter/material.dart';
import 'package:saidi_s_application3/core/app_export.dart';
import 'package:saidi_s_application3/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class Listsaidimindas3ItemWidget extends StatelessWidget {
  Listsaidimindas3ItemWidget(
    this.memberOrder, {
    Key? key,
    this.onTapOnarisiti,
  }) : super(
          key: key,
        );
  MemberOrdersRequest memberOrder;

  var controller = Get.find<Iphone14PlusTwoController>();

  VoidCallback? onTapOnarisiti;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.v),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.h),
            child: Text(
              memberOrder.farmer != null
                  ? memberOrder.farmer!.name!.toUpperCase()
                  : memberOrder.phoneNumber.toString(),
              style: theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(height: 7.v),
          Divider(),
          Padding(
            padding: EdgeInsets.only(
              left: 23.h,
              top: 9.v,
            ),
            child: Text(
              "msg_aina_ya_pembejeo".tr,
              style: CustomTextStyles.labelLargeBold_1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 24.h,
              top: 2.v,
            ),
            child: Text(
              memberOrder.updatedFarmerOrganizations!
                  .map((e) => e.itemName)
                  .toList()
                  .toString(),
              style: theme.textTheme.labelLarge,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 24.h,
              top: 11.v,
            ),
            child: Text(
              "msg_kiasi_katika_mfuko".tr,
              style: CustomTextStyles.labelLargeBold_1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 24.h,
              top: 1.v,
            ),
            child: Text(
              memberOrder.updatedFarmerOrganizations!
                  .map((e) => e.deliveredCount)
                  .toList()
                  .toString(),
              style: theme.textTheme.labelLarge,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 24.h,
              top: 11.v,
            ),
            child: Text(
              "lbl_kikundi".tr,
              style: CustomTextStyles.labelLargeBold_1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 24.h,
              top: 2.v,
            ),
            child: Text(
              memberOrder.farmer != null
                  ? memberOrder.farmer!.farmerOrganisation!.toUpperCase()
                  : memberOrder.memberId.toString(),
              style: theme.textTheme.labelLarge,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                left: 24.h,
                top: 29.v,
                right: 21.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomElevatedButton(
                    width: 80.h,
                    text: "lbl_imelipiwa".tr,
                    buttonStyle: CustomButtonStyles.fillTeal,
                    buttonTextStyle: CustomTextStyles.labelLargeTeal300,
                  ),
                  CustomElevatedButton(
                    width: 103.h,
                    text: "lbl_ona_risiti".tr,
                    rightIcon: Container(
                      margin: EdgeInsets.only(left: 10.h),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgBill70940821,
                      ),
                    ),
                    onTap: () {
                      onTapOnarisiti?.call();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
