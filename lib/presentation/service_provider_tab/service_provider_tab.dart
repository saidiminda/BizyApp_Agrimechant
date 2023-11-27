import 'controller/service_provider_tab_controller.dart';
import 'models/service_provider_tab_model.dart';
import 'package:flutter/material.dart';
import 'package:saidi_s_application3/core/app_export.dart';
import 'package:saidi_s_application3/widgets/custom_drop_down.dart';
import 'package:saidi_s_application3/widgets/custom_text_form_field.dart';

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
        resizeToAvoidBottomInset: false,
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
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "msg_taarifa_za_biashara".tr.toUpperCase(),
                          style: CustomTextStyles.titleMediumGreen900Bold,
                        ),
                      ),
                      SizedBox(height: 33.v),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 33.h,
                          vertical: 12.v,
                        ),
                        decoration:
                            AppDecoration.fillOnPrimaryContainer.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder7,
                        ),
                        child: Row(
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgShield84433431,
                              height: 40.adaptSize,
                              width: 40.adaptSize,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 16.h,
                                top: 9.v,
                                bottom: 10.v,
                              ),
                              child: Text(
                                "lbl_kampuni".tr.toUpperCase(),
                                style: CustomTextStyles.titleMediumGray500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 17.v),
                      CustomTextFormField(
                        controller: controller.jinaController,
                        hintText: "lbl_jina".tr,
                        hintStyle: theme.textTheme.titleSmall!,
                      ),
                      SizedBox(height: 18.v),
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

                        hintText: "msg_namba_ya_simu_ya".tr,
                        hintStyle: theme.textTheme.titleSmall!,
                      ),
                      SizedBox(height: 18.v),
                      CustomTextFormField(
                        controller: controller.baruapepeyaController,
                        hintText: "msg_barua_pepe_ya_ofisi".tr,
                        hintStyle: theme.textTheme.titleSmall!,
                      ),
                      SizedBox(height: 18.v),
                      CustomTextFormField(
                        controller: controller.jinalaController,
                        hintText: "msg_jina_la_biashara".tr,
                        hintStyle: theme.textTheme.titleSmall!,
                      ),
                      SizedBox(height: 18.v),
                      CustomTextFormField(
                        controller: controller.nambariyaController,
                        hintText: "msg_nambari_ya_leseni".tr,
                        hintStyle: theme.textTheme.titleSmall!,
                      ),
                      SizedBox(height: 18.v),
                      CustomTextFormField(
                        controller: controller.nambariyatinController,
                        hintText: "lbl_nambari_ya_tin".tr,
                        hintStyle: theme.textTheme.titleSmall!,
                      ),
                      SizedBox(height: 18.v),
                      CustomTextFormField(
                        // controller: controller.nambariyatinController,
                        hintText: "msg_tarehe_ya_usajili".tr,
                        hintStyle: theme.textTheme.titleSmall!,
                        suffix: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.h,
                            vertical: 10.v,
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgCalendar,
                            height: 26.v,
                            width: 22.h,
                          ),
                        ),
                      ),
                      SizedBox(height: 18.v),
                      CustomDropDown(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: appTheme.blueGray10002,
                        ),
                        hintText: "msg_chagua_anuani_ya".tr,
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
                          "msg_eneo_la_ushawishi".tr,
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
                      SizedBox(height: 20.v),
                      CustomDropDown(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: appTheme.blueGray10002,
                        ),
                        hintText: "msg_chagua_aina_ya_biashara".tr,
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
                          "msg_vijiiji_vinavyohudumiwa".tr,
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
                              svgPath: ImageConstant.imgGroup11,
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
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          top: 22.v,
                        ),
                        child: Text(
                          "msg_watu_wanaohudumiwa".tr,
                          style: CustomTextStyles.titleSmallBluegray400,
                        ),
                      ),
                      SizedBox(height: 11.v),
                      SizedBox(
                        height: 49.v,
                        width: 385.h,
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgGroup11,
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
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "msg_taarifa_za_binafsi".tr.toUpperCase(),
                          style: CustomTextStyles.titleMediumGreen900Bold,
                        ),
                      ),
                      SizedBox(height: 16.v),
                      CustomTextFormField(
                        controller: controller.majinakamiliController,
                        hintText: "lbl_majina_kamili".tr,
                        hintStyle: theme.textTheme.titleSmall!,
                      ),
                      SizedBox(height: 22.v),
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

                        hintText: "lbl_namba_ya_simu".tr,
                        hintStyle: theme.textTheme.titleSmall!,
                      ),
                      SizedBox(height: 22.v),
                      CustomTextFormField(
                        controller: controller.anwaniController,
                        hintText: "lbl_anwani".tr,
                        hintStyle: theme.textTheme.titleSmall!,
                        textInputAction: TextInputAction.done,
                      ),
                      SizedBox(height: 22.v),
                      CustomDropDown(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: appTheme.blueGray10002,
                        ),
                        hintText: "lbl_chaua_jinsia".tr,
                        items: controller.iphone14PlusSixModelObj.value
                            .dropdownItemList3.value,
                        onChanged: (value) {
                          controller.onSelected3(value);
                        },
                      ),
                      SizedBox(height: 22.v),
                      Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 0,
                        color: theme.colorScheme.onPrimaryContainer,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: appTheme.blueGray10001,
                            width: 1.h,
                          ),
                          borderRadius: BorderRadiusStyle.roundedBorder7,
                        ),
                        child: Container(
                          height: 49.v,
                          width: 385.h,
                          decoration: AppDecoration.outlineBlueGray.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder7,
                          ),
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  height: 48.v,
                                  width: 53.h,
                                  decoration: BoxDecoration(
                                    color: appTheme.blueGray10001,
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(7.h),
                                    ),
                                  ),
                                ),
                              ),
                              CustomImageView(
                                svgPath: ImageConstant.imgGroup31,
                                height: 18.adaptSize,
                                width: 18.adaptSize,
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.only(right: 16.h),
                              ),
                            ],
                          ),
                        ),
                      ),
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
