import '../../input_collection_tab/models/member_orders_request_model.dart';
import '../controller/input_controller.dart';
import 'package:flutter/material.dart';
import 'package:saidi_s_application3/core/app_export.dart';
import 'package:saidi_s_application3/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class ListsaidimindasItemWidget extends StatelessWidget {
  ListsaidimindasItemWidget(
    this.memberOrder, {
    Key? key,
    this.onTapAnkara,
  }) : super(
          key: key,
        );

  MemberOrdersRequest memberOrder;

  var controller = Get.find<InputController>();

  VoidCallback? onTapAnkara;

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
                right: 24.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 90.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 11.h,
                      vertical: 5.v,
                    ),
                    decoration: AppDecoration.fillOnPrimary.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder3,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgTrash,
                          height: 20.adaptSize,
                          width: 20.adaptSize,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 7.h,
                            top: 2.v,
                            bottom: 2.v,
                          ),
                          child: Text(
                            "lbl_delete".tr,
                            style:
                                CustomTextStyles.labelLargeOnPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 75.h,
                    margin: EdgeInsets.only(left: 11.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 11.h,
                      vertical: 5.v,
                    ),
                    decoration: AppDecoration.fillBlue.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder3,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgEdit,
                          height: 20.adaptSize,
                          width: 20.adaptSize,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 7.h,
                            top: 2.v,
                            bottom: 2.v,
                          ),
                          child: Text(
                            "lbl_edit".tr,
                            style:
                                CustomTextStyles.labelLargeOnPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  CustomElevatedButton(
                    width: 90.h,
                    text: "lbl_ankara".tr,
                    rightIcon: Container(
                      margin: EdgeInsets.only(left: 10.h),
                      child: CustomImageView(
                        svgPath: ImageConstant.imgFile10919941,
                      ),
                    ),
                    onTap: () {
                      onTapAnkara?.call();
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
