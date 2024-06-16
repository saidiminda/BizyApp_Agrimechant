import 'controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:saidi_s_application3/core/app_export.dart';
import 'package:saidi_s_application3/widgets/custom_elevated_button.dart';
import 'package:saidi_s_application3/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Obx(
      () => SafeArea(
          child: Scaffold(
              // resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 178.v),
                  Padding(
                      padding: EdgeInsets.only(
                          left: 68.h, right: 68.h, bottom: 186.v),
                      child: Column(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgLayer1,
                            height: 48.v,
                            width: 239.h),
                        SizedBox(height: 86.v),
                        Obx(
                          () => Visibility(
                              visible: controller.showLoading.value,
                              child: Column(
                                children: [
                                  Obx(() {
                                    return Container(
                                      width: 100,
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: LinearProgressIndicator(
                                        backgroundColor:
                                            const Color(0xffe7fff9),
                                        color: const Color(0xff2bad4b),
                                        value: controller.barLength.value,
                                        semanticsLabel: 'wait'.tr,
                                      ),
                                    );
                                  }),
                                  const SizedBox(height: 10),
                                  Obx(
                                    () => Text(
                                      controller.waitStatus.value,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        CustomTextFormField(
                          autofocus: false,
                          controller: controller.inputnameoneController,
                          hintText: "enterUsername".tr,
                          prefix: Container(
                              margin:
                                  EdgeInsets.fromLTRB(15.h, 16.v, 27.h, 17.v),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgUser)),
                          prefixConstraints: BoxConstraints(maxHeight: 49.v),
                          contentPadding: EdgeInsets.only(
                              top: 15.v, right: 30.h, bottom: 15.v),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter user name";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 22.v),
                        CustomTextFormField(
                            autofocus: false,
                            controller: controller.inputsecretoneController,
                            hintText: "enterNewPassword".tr,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                            prefix: Container(
                                margin:
                                    EdgeInsets.fromLTRB(17.h, 17.v, 29.h, 17.v),
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgLock)),
                            prefixConstraints: BoxConstraints(maxHeight: 49.v),
                            suffix: IconButton(
                              icon: controller.hidePassword.value
                                  ? const Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: Color(0xff2bad4b),
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: Color(0xff2bad4b),
                                    ),
                              onPressed: () {
                                controller.hidePassword.value =
                                    !controller.hidePassword.value;
                              },
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter password";
                              }
                              return null;
                            },
                            obscureText: controller.hidePassword.value,
                            contentPadding: EdgeInsets.only(
                                top: 15.v, right: 30.h, bottom: 15.v)),
                        SizedBox(height: 33.v),
                        CustomElevatedButton(
                            height: 43.v,
                            text: "ingia".tr.toUpperCase(),
                            buttonStyle: CustomButtonStyles.outlinePrimaryTL7,
                            buttonTextStyle:
                                CustomTextStyles.titleMediumOnPrimaryContainer,
                            onTap: () {
                              navigateToHomePage();
                            })
                      ]))
                ]))),
      ))),
    );
  }

  navigateToHomePage() {
    if (_formKey.currentState!.validate()) {
      controller.authenticateUser(controller.inputnameoneController.text,
          controller.inputsecretoneController.text);
    }
  }
}
