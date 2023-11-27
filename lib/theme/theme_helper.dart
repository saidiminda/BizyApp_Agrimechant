// import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.gray20001,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.green90001,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.blueGray100,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        displaySmall: TextStyle(
          color: appTheme.gray800,
          fontSize: 36.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 12.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: 11.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
        labelSmall: TextStyle(
          color: appTheme.gray600,
          fontSize: 9.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 16.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: appTheme.gray50002,
          fontSize: 15.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0X3FC3C3C3),
    primaryContainer: Color(0XFFE50303),
    secondary: Color(0XFFE50303),
    secondaryContainer: Color(0XFFB3B3B3),
    tertiary: Color(0XFFE50303),
    tertiaryContainer: Color(0XFFB3B3B3),

    // Background colors
    background: Color(0XFFE50303),

    // Surface colors
    surface: Color(0XFFE50303),
    surfaceTint: Color(0XFFE50303),
    surfaceVariant: Color(0XFFB3B3B3),

    // Error colors
    error: Color(0XFFE50303),
    errorContainer: Color(0XFFB3B3B3),
    onError: Color(0XFFFFFFFF),
    onErrorContainer: Color(0XFFE50303),

    // On colors(text colors)
    onBackground: Color(0XFFFFFFFF),
    onInverseSurface: Color(0XFFFFFFFF),
    onPrimary: Color(0XFFE50303),
    onPrimaryContainer: Color(0XFFFFFFFF),
    onSecondary: Color(0XFFFFFFFF),
    onSecondaryContainer: Color(0XFFE50303),
    onTertiary: Color(0XFFFFFFFF),
    onTertiaryContainer: Color(0XFFE50303),

    // Other colors
    outline: Color(0XFFE50303),
    outlineVariant: Color(0XFFE50303),
    scrim: Color(0XFFE50303),
    shadow: Color(0XFFE50303),

    // Inverse colors
    inversePrimary: Color(0XFFE50303),
    inverseSurface: Color(0XFFE50303),

    // Pending colors
    onSurface: Color(0XFFFFFFFF),
    onSurfaceVariant: Color(0XFFE50303),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => Color(0XFF000000);

  // Blue
  Color get blue600 => Color(0XFF1191DA);

  // BlueGray
  Color get blueGray100 => Color(0XFFD9D9D9);
  Color get blueGray10001 => Color(0XFFD6D6D6);
  Color get blueGray10002 => Color(0XFFD1D1D1);
  Color get blueGray400 => Color(0XFF8D8D8D);
  Color get blueGray40001 => Color(0XFF898989);
  Color get blueGray40002 => Color(0XFF888888);
  Color get blueGray500 => Color(0XFF4986A0);

  // Gray
  Color get gray200 => Color(0XFFE9E9E9);
  Color get gray20001 => Color(0XFFEFEFEF);
  Color get gray300 => Color(0XFFDCDCDC);
  Color get gray400 => Color(0XFFB0B0B0);
  Color get gray40001 => Color(0XFFB5B5B5);
  Color get gray40002 => Color(0XFFAFAFAF);
  Color get gray500 => Color(0XFF969696);
  Color get gray50001 => Color(0XFF9E9E9E);
  Color get gray50002 => Color(0XFF9F9F9F);
  Color get gray600 => Color(0XFF717171);
  Color get gray60001 => Color(0XFF828282);
  Color get gray800 => Color(0XFF494949);

  // Green
  Color get green800 => Color(0XFF158C33);
  Color get green900 => Color(0XFF055902);
  Color get green90001 => Color(0XFF008001);
  Color get indicatorColor => Colors.green[700]!;

  // LightBlue
  Color get lightBlue400 => Color(0XFF1CB0F6);

  // Lime
  Color get lime700 => Color(0XFFA8BD38);

  // Teal
  Color get teal100 => Color(0XFF9BE6DD);
  Color get teal300 => Color(0XFF49A096);
  Color get teal800 => Color(0XFF037248);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();