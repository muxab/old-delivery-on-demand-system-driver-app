// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const ROOT = _Paths.root;

  static const HOME = _Paths.HOME;
  static const MAIN = _Paths.MAIN;
  static const LOGIN = _Paths.login;
  static const REGISTER = _Paths.register;
  static const PROFILE = _Paths.PROFILE;
  static const NOTIFICATIONS = _Paths.NOTIFICATIONS;
  static const NOTIFICATION = _Paths.NOTIFICATION;

  static const JOURNEYS = _Paths.JOURNEYS;
  static const PREVIOUSJOURNEYS = _Paths.PREVIOUSJOURNEYS;
  static const JOURNEYSSEARCH = _Paths.JOURNEYSSEARCH;
  static const JOURNEY = _Paths.JOURNEY;
  static const SHIPMENT = _Paths.SHIPMENT;

  static const REPORTS = _Paths.REPORTS;
  static const REPORT = _Paths.REPORT;

  static const OFFERS = _Paths.OFFERS;
}

abstract class _Paths {
  // begin of app .. token true -> go main .. token false -> go login
  static const root = '/root';
  static const login = '/login';
  static const register = '/register';
  static const MAIN = '/main';

  static const HOME = '/home';
  static const PROFILE = '/profile';
  static const NOTIFICATIONS = '/notifications';
  static const NOTIFICATION = '/notification/:notid';

  static const JOURNEYS = '/journeys';
  static const PREVIOUSJOURNEYS = '/prejourneys';
  static const JOURNEY = '/journey/:uuid';
  static const JOURNEYSSEARCH = '/journeyssearch';

  // single shipment
  static const SHIPMENT = '/shipment/:uuid';

  static const OFFERS = '/offers';

  static const REPORTS = '/reports';
  static const REPORT = '/report/:serial';
}
