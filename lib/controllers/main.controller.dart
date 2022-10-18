import 'package:driver/data/models/journey.model.dart';
import 'package:driver/data/models/user.model.dart';
import 'package:driver/data/providers/auth.provider.dart';
import 'package:driver/data/providers/driver_data.provider.dart';
import 'package:driver/data/providers/main.socket.dart';
import 'package:get/get.dart';

import '../data/models/vehicle.model.dart';

class MainController extends GetxController {
  var pageIndex = 1.obs;
  var loading = true.obs;
  Journey? currentJourney;
  User? user;
  Vehicle? myVehicle;

  var notificationCOunter = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getUser();

    // connectSocket();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  naivgate(index) {
    pageIndex.value = index;
  }

  getUser() {
    loading(true);
    AuthenticationProvider().validateUser().then(
      (value) {
        user = value;
      },
    );

    DriverDataProvider().driverData().then((value) {
      if (value['body']['vehicle'] != null) {
        myVehicle = Vehicle.fromJson(
          value['body']['vehicle'],
        );
        Future.delayed(const Duration(seconds: 2), () {
          connectSocket();
          if (value['body']['journey'] != null) {
            currentJourney = Journey.fromJson(value['body']['journey']);
          }
        });
      }
    });

    loading(false);
  }

  getCurrentJourney() {
    loading(true);
    DriverDataProvider().driverData().then(
      (value) {
        currentJourney = Journey.fromJson(
          value['body']['journey'],
        );
        loading(false);
      },
    );
  }

  connectSocket() {
    Sockets().intiConnection(myVehicle!.type!.toString());
  }
}
