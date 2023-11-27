import '../controller/iphone_14_plus_two_controller.dart';
import '../models/listsaidimindas3_item_model.dart';
import 'package:flutter/material.dart';
import 'package:saidi_s_application3/core/app_export.dart';
import 'package:saidi_s_application3/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class Listsaidimindas3ItemWidget extends StatelessWidget {
  Listsaidimindas3ItemWidget(
    this.listsaidimindas3ItemModelObj, {
    Key? key,
    this.onTapOnarisiti,
  }) : super(
          key: key,
        );

  Listsaidimindas3ItemModel listsaidimindas3ItemModelObj;

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
              "msg_saidi_minda_saidi".tr.toUpperCase(),
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
              "msg_maize_seeds_2".tr,
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
              "lbl_2".tr,
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
              "msg_zinduka_vijana_group".tr.toUpperCase(),
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
                        svgPath: ImageConstant.imgBill70940821,
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
