import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../widgets/topNavBar.dart';
import 'controllers/change_password.controller.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: TopNavBar(
        title: "changePassword".tr.toUpperCase(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "changePassword".tr,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    color: Color(0xff2bad4b),
                    fontWeight: FontWeight.w500,
                  ),
                  softWrap: false,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'enterCurrentPassword'.tr,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    color: Color(0xff4a4a4a),
                    fontWeight: FontWeight.w600,
                  ),
                  softWrap: false,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Obx(
                    () => TextFormField(
                      controller: controller.passwordController,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "currentPasswordIsRequired".tr;
                        }

                        return null;
                      },
                      cursorColor: const Color(0xff2bad4b),
                      style: const TextStyle(
                          letterSpacing: 0.1, color: Color(0xff4a4a4a)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffe7fff9),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff2bad4b)),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff2bad4b)),
                        ),
                        hintText: "currentPassword".tr,
                        hintStyle: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          color: Color(0xffb0b0b0),
                        ),
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Color(0xff2bad4b),
                        ),
                        suffixIcon: IconButton(
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
                      ),
                      obscureText: controller.hidePassword.value,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'enterNewPassword'.tr,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    color: Color(0xff4a4a4a),
                    fontWeight: FontWeight.w600,
                  ),
                  softWrap: false,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Obx(
                    () => TextFormField(
                      controller: controller.newPasswordController,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "newPasswordIsRequired".tr;
                        } else if (!controller.passwordFormat
                            .hasMatch(value.toString())) {
                          return "enterStrongPasswordMsg".tr;
                        } else if (value.toString() ==
                            controller.passwordController.text) {
                          return "enterNewPassword".tr;
                        }

                        return null;
                      },
                      cursorColor: const Color(0xff2bad4b),
                      style: const TextStyle(
                          letterSpacing: 0.1, color: Color(0xff4a4a4a)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffe7fff9),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff2bad4b)),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff2bad4b)),
                        ),
                        hintText: 'newPassword'.tr,
                        hintStyle: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          color: Color(0xffb0b0b0),
                        ),
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Color(0xff2bad4b),
                        ),
                        suffixIcon: IconButton(
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
                      ),
                      obscureText: controller.hidePassword.value,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'confirmPassword'.tr,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    color: Color(0xff4a4a4a),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Obx(
                    () => TextFormField(
                      controller: controller.confirmPasswordController,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "confirmPasswordIsRequired".tr;
                        } else if (value.toString() !=
                            controller.newPasswordController.text) {
                          return "passwordDoesNotMatch".tr;
                        }

                        return null;
                      },
                      cursorColor: const Color(0xff2bad4b),
                      style: const TextStyle(
                          letterSpacing: 0.1, color: Color(0xff4a4a4a)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffe7fff9),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff2bad4b)),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff2bad4b)),
                        ),
                        hintText: 'confirmPassword'.tr,
                        hintStyle: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          color: Color(0xffb0b0b0),
                          // height: 3.888888888888889,
                        ),
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Color(0xff2bad4b),
                        ),
                        suffixIcon: IconButton(
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
                      ),
                      obscureText: controller.hidePassword.value,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.changePassword();
                    }
                  },
                  child: Container(
                    height: 50,
                    color: const Color(0xff2bad4b),
                    child: SizedBox.expand(
                      child: Center(
                        child: Text(
                          'save'.tr,
                          style: const TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 18,
                            color: Color(0xffffffff),
                          ),
                          textHeightBehavior: const TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
