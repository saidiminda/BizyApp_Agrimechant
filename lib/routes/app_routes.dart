import 'package:saidi_s_application3/presentation/splash_screen/splash_screen.dart';
import 'package:saidi_s_application3/presentation/splash_screen/binding/splash_binding.dart';
import 'package:saidi_s_application3/presentation/login_screen/login_screen.dart';
import 'package:saidi_s_application3/presentation/login_screen/binding/login_binding.dart';
import 'package:saidi_s_application3/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:saidi_s_application3/presentation/dashboard_screen/binding/dashboard_binding.dart';
import 'package:saidi_s_application3/presentation/input_screen/input_screen.dart';
import 'package:saidi_s_application3/presentation/input_screen/binding/input_binding.dart';
import 'package:saidi_s_application3/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:saidi_s_application3/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginScreen = '/login_screen';

  static const String dashboardScreen = '/dashboard_screen';

  static const String inputScreen = '/input_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: dashboardScreen,
      page: () => DashboardScreen(),
      bindings: [
        DashboardBinding(),
      ],
    ),
    GetPage(
      name: inputScreen,
      page: () => InputScreen(),
      bindings: [
        InputBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    )
  ];
}
