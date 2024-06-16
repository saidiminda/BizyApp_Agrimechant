import 'package:saidi_s_application3/presentation/aggregators_management_screen/aggregators_management_screen.dart';
import 'package:saidi_s_application3/presentation/aggregators_management_screen/binding/aggregators_management_binding.dart';
import 'package:saidi_s_application3/presentation/aggregators_registration_screen/aggregators_registration_screen.dart';
import 'package:saidi_s_application3/presentation/aggregators_registration_screen/binding/aggregators_registration_binding.dart';
import 'package:saidi_s_application3/presentation/equipment_provider_management_screen/binding/equipment_provider_management_binding.dart';
import 'package:saidi_s_application3/presentation/equipment_provider_management_screen/equipment_provider_management_screen.dart';
import 'package:saidi_s_application3/presentation/equipment_provider_registration_screen/binding/equipment_provider_registration_binding.dart';
import 'package:saidi_s_application3/presentation/equipment_provider_registration_screen/equipment_provider_registration_screen.dart';
import 'package:saidi_s_application3/presentation/input_supplier_management_screen/binding/input_supplier_management_binding.dart';
import 'package:saidi_s_application3/presentation/input_supplier_management_screen/input_supplier_management_screen.dart';
import 'package:saidi_s_application3/presentation/input_supplier_registration_screen/binding/input_supplier_registration_binding.dart';
import 'package:saidi_s_application3/presentation/input_supplier_registration_screen/input_supplier_registration_screen.dart';
import 'package:saidi_s_application3/presentation/logistics_management_screen/binding/logistics_management_binding.dart';
import 'package:saidi_s_application3/presentation/logistics_management_screen/logistics_management_screen.dart';
import 'package:saidi_s_application3/presentation/logistics_registration_screen/binding/logistics_registration_binding.dart';
import 'package:saidi_s_application3/presentation/logistics_registration_screen/logistics_registration_screen.dart';
import 'package:saidi_s_application3/presentation/producers_management_screen/binding/producers_management_binding.dart';
import 'package:saidi_s_application3/presentation/producers_management_screen/producers_management_screen.dart';
import 'package:saidi_s_application3/presentation/producers_registration_screen/binding/producers_registration_binding.dart';
import 'package:saidi_s_application3/presentation/producers_registration_screen/producers_registration_screen.dart';
import 'package:saidi_s_application3/presentation/questionnaire_dashboard_screen/binding/questionnaire_dashboard_binding.dart';
import 'package:saidi_s_application3/presentation/questionnaire_dashboard_screen/questionnaire_dashboard_screen.dart';
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
import 'package:saidi_s_application3/presentation/warehouse_management_screen/binding/warehouse_management_binding.dart';
import 'package:saidi_s_application3/presentation/warehouse_management_screen/warehouse_management_screen.dart';
import 'package:saidi_s_application3/presentation/warehouse_registration_screen/binding/warehouse_registration_binding.dart';
import 'package:saidi_s_application3/presentation/warehouse_registration_screen/warehouse_registration_screen.dart';

import '../presentation/change_language/binding/change_language.controller.binding.dart';
import '../presentation/change_language/change_language.screen.dart';
import '../presentation/change_password/binding/change_password.controller.binding.dart';
import '../presentation/change_password/change_password.screen.dart';
import '../presentation/farmer_management_screen/binding/farmer_management_binding.dart';
import '../presentation/farmer_management_screen/farmer_management_screen.dart';
import '../presentation/farmer_registration_screen/binding/farmer_registration_binding.dart';
import '../presentation/farmer_registration_screen/farmer_registration_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginScreen = '/login_screen';

  static const String dashboardScreen = '/dashboard_screen';

   static const String questionnaireDashboardScreen = '/questionnaire_dashboard_screen';

   static const String changeLanguageScreen = '/change_language_screen';

   static const String changePasswordScreen = '/change_password_screen';

  static const String inputScreen = '/input_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static const String farmerManagementScreen = '/farmer_management_screen';

  static const String farmerRegistrationScreen = '/farmer_registration_screen';

  static const String aggregatorsManagementScreen =
      '/aggregators_management_screen';

  static const String aggregatorsRegistrationScreen =
      '/aggregators_registration_screen';

  static const String equipmentProviderrManagementScreen =
      '/equipment_provider_management_screen';

  static const String equipmentProviderRegistrationScreen =
      '/equipment_provider_registration_screen';

  static const String inputSupplierManagementScreen =
      '/input_supplier_management_screen';

  static const String inputSupplierRegistrationScreen =
      '/input_supplier_registration_screen';

  static const String logisticsManagementScreen =
      '/logistics_management_screen';

  static const String logisticsRegistrationScreen =
      '/logistics_registration_screen';

  static const String producersManagementScreen =
      '/producers_management_screen';

  static const String producersRegistrationScreen =
      '/producers_registration_screen';

  static const String warehouseManagementScreen =
      '/warehouse_management_screen';

  static const String warehouseRegistrationScreen =
      '/warehouse_registration_screen';

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
      name: changePasswordScreen,
      page: () => ChangePasswordScreen(),
      bindings: [
        ChangePasswordControllerBinding(),
      ],
    ),
    GetPage(
      name: changeLanguageScreen,
      page: () => ChangeLanguageScreen(),
      bindings: [
        ChangeLanguageControllerBinding(),
      ],
    ),
     GetPage(
      name: questionnaireDashboardScreen,
      page: () => QuestionnaireDashboardScreen(),
      bindings: [
        QuestionnaireDashboardBinding(),
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
    ),
    GetPage(
      name: farmerManagementScreen,
      page: () => FarmerManagementScreen(),
      bindings: [
        FarmerManagementBinding(),
      ],
    ),
    GetPage(
      name: farmerRegistrationScreen,
      page: () => FarmerRegistrationScreen(),
      bindings: [
        FarmerRegistrationBinding(),
      ],
    ),
    GetPage(
      name: aggregatorsManagementScreen,
      page: () => AggregatorsManagementScreen(),
      bindings: [
        AggregatorsManagementBinding(),
      ],
    ),
    GetPage(
      name: aggregatorsRegistrationScreen,
      page: () => AggregatorsRegistrationScreen(),
      bindings: [
        AggregatorsRegistrationBinding(),
      ],
    ),
    GetPage(
      name: equipmentProviderrManagementScreen,
      page: () => EquipmentProviderManagementScreen(),
      bindings: [
        EquipmentProviderManagementBinding(),
      ],
    ),
    GetPage(
      name: equipmentProviderRegistrationScreen,
      page: () => EquipmentProviderRegistrationScreen(),
      bindings: [
        EquipmentProviderRegistrationBinding(),
      ],
    ),
    GetPage(
      name: inputSupplierManagementScreen,
      page: () => InputSupplierManagementScreen(),
      bindings: [
        InputSupplierManagementBinding(),
      ],
    ),
    GetPage(
      name: inputSupplierRegistrationScreen,
      page: () => InputSupplierRegistrationScreen(),
      bindings: [
        InputSupplierRegistrationBinding(),
      ],
    ),
    GetPage(
      name: logisticsRegistrationScreen,
      page: () => LogisticsRegistrationScreen(),
      bindings: [
        LogisticsRegistrationBinding(),
      ],
    ),
    GetPage(
      name: logisticsManagementScreen,
      page: () => LogisticsManagementScreen(),
      bindings: [
        LogisticsManagementBinding(),
      ],
    ),
    GetPage(
      name: producersManagementScreen,
      page: () => ProducersManagementScreen(),
      bindings: [
        ProducersManagementBinding(),
      ],
    ),
    GetPage(
      name: producersRegistrationScreen,
      page: () => ProducersRegistrationScreen(),
      bindings: [
        ProducersRegistrationBinding(),
      ],
    ),
    GetPage(
      name: warehouseManagementScreen,
      page: () => WarehouseManagementScreen(),
      bindings: [
        WarehouseManagementBinding(),
      ],
    ),
    GetPage(
      name: warehouseRegistrationScreen,
      page: () => WarehouseRegistrationScreen(),
      bindings: [
        WarehouseRegistrationBinding(),
      ],
    )
  ];
}
