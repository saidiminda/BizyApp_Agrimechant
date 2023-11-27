import 'package:flutter/material.dart';
import 'package:saidi_s_application3/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue600,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray20001,
      );
  static BoxDecoration get fillGreen => BoxDecoration(
        color: appTheme.green900,
      );
  static BoxDecoration get fillGreen90001 => BoxDecoration(
        color: appTheme.green90001,
      );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static BoxDecoration get fillOnSecondary => BoxDecoration(
        color: theme.colorScheme.onSecondary,
      );

  // Outline decorations
  static BoxDecoration get outlineBlueGray => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
        border: Border.all(
          color: appTheme.blueGray10001,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );
  static BorderRadius get roundedBorder3 => BorderRadius.circular(
        3.h,
      );
  static BorderRadius get roundedBorder7 => BorderRadius.circular(
        7.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
