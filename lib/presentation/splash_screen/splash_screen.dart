import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:saidi_s_application3/core/app_export.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appTheme.green900,
        body: Center(
          child: CustomImageView(
            imagePath: ImageConstant.imgGroup34,
            height: 52.v,
            width: 262.h,
          ),
        ));
  }
}
