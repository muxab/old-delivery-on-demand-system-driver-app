//bindings
// ignore_for_file: constant_identifier_names

import 'package:driver/bindings/home.binding.dart';
import 'package:driver/bindings/journeys-search.binding.dart';
import 'package:driver/bindings/journeys.binding.dart';
import 'package:driver/bindings/login.binding.dart';
import 'package:driver/bindings/main.binding.dart';
import 'package:driver/bindings/notification.binding.dart';
import 'package:driver/bindings/notifications.binding.dart';
import 'package:driver/bindings/offers.binding.dart';
import 'package:driver/bindings/prejourneys.binding.dart';
import 'package:driver/bindings/profile.binding.dart';
import 'package:driver/bindings/report.binding.dart';
import 'package:driver/bindings/reports.binding.dart';
import 'package:driver/bindings/root.binding.dart';
import 'package:driver/bindings/shipment.binding.dart';
import 'package:driver/bindings/single_journey.binding.dart';
//views
import 'package:driver/views/home.view.dart';
import 'package:driver/views/journeys-search.view.dart';
import 'package:driver/views/offers.view.dart';
import 'package:driver/views/prejourneys.view.dart';
import 'package:driver/views/single_journey.view.dart';
import 'package:driver/views/journeys.view.dart';
import 'package:driver/views/login.view.dart';
import 'package:driver/views/main.view.dart';
import 'package:driver/views/shipment.view.dart';
import 'package:driver/views/single_notification.view.dart';
import 'package:driver/views/notifications.view.dart';
import 'package:driver/views/profile.view.dart';
import 'package:driver/views/report.view.dart';
import 'package:driver/views/reports.view.dart';
import 'package:driver/views/root.view.dart';
import 'package:get/get.dart';

import '../../bindings/register.binding.dart';
import '../../views/register.view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ROOT;

  static final routes = [
    GetPage(
      name: _Paths.root,
      page: () => RootView(),
      binding: RootBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    //Update BVC

    GetPage(
      name: _Paths.JOURNEYS,
      page: () => const JourneysView(),
      binding: JourneysBinding(),
    ),

    GetPage(
      name: _Paths.PREVIOUSJOURNEYS,
      page: () => PreJourneysView(),
      binding: PreJourneysBinding(),
    ),
    GetPage(
      name: _Paths.JOURNEY,
      page: () => const JourneyView(),
      binding: JourneyBinding(),
    ),
    GetPage(
      name: _Paths.JOURNEYSSEARCH,
      page: () => JourneysSearchView(),
      binding: JourneysSearchBinding(),
    ),

    //

    GetPage(
      name: _Paths.SHIPMENT,
      page: () => const ShipmentView(),
      binding: ShipmentBinding(),
    ),

    GetPage(
      name: _Paths.OFFERS,
      page: () => const OffersView(),
      binding: OffersBinding(),
    ),

    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    // notifications page
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => NotificationsView(),
      binding: NotificationsBinding(),
    ),
    // single notification
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    //reports page

    GetPage(
      name: _Paths.REPORTS,
      page: () => ReportsView(),
      binding: ReportsBinding(),
    ),
    //single report
    GetPage(
      name: _Paths.REPORT,
      page: () => ReportView(),
      binding: ReportBinding(),
    ),
  ];
}
