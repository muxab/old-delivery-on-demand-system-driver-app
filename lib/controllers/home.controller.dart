import 'package:driver/controllers/shit.dart';
import 'package:driver/data/models/journey.model.dart';
import 'package:driver/data/models/user.model.dart';
import 'package:driver/data/models/vehicle.model.dart';
import 'package:driver/data/providers/auth.provider.dart';
import 'package:driver/data/providers/driver_data.provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var pageIndex = 0.obs;
  var el = false.obs;
  Journey? currentJourney;
  Vehicle? myVehicle;
  User? user;
  var isReady = false.obs;
  Rx<Status> status = Status.ready.obs;
  var statusTxt = 'ready'.obs;

  var loading = true.obs;
  var sysError = false.obs;

  var notificationConuter = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loading(true);
    getUser();
    getDriverData();
  }

  @override
  void onReady() {
    // super.onReady();
  }

  @override
  void onClose() {}

  getUser() {
    loading(true);
    AuthenticationProvider().validateUser().then(
      (value) {
        user = value;
        // loading(false);
        // print(user!.name);
      },
    );
    DriverDataProvider()
        .counter()
        .then((v) => notificationConuter.value = v['notifications']);
  }

  getDriverData() {
    DriverDataProvider().driverData().then((value) {
      if (value['body']['vehicle'] != null) {
        myVehicle = Vehicle.fromJson(
          value['body']['vehicle'],
        );
        switch (myVehicle!.status) {
          case 'picking':
            isReady(false);
            status(Status.picking);
            statusTxt('picking');
            break;
          case 'out':
            isReady(false);
            status(Status.out);
            statusTxt('out');

            break;
          case 'trip':
            isReady(false);
            status(Status.trip);
            statusTxt('trip');
            break;
          default:
            isReady(true);
            status(Status.ready);
            statusTxt('ready');
        }
      } else {
        myVehicle == null;
      }

      if (value['body']['journey'] != null) {
        currentJourney = Journey.fromJson(
          value['body']['journey'],
        );
      } else {
        currentJourney == null;
      }

      Future.delayed(const Duration(seconds: 1), () {
        loading(false);
      });
    }).catchError((_) {
      sysError(true);
    });
  }

  vehicleReady(bool vStatus) {
    if (currentJourney!.status != null) {
      isReady(vStatus);
      loading(true);
      DriverDataProvider().updateVehicle(vStatus).then((v) {
        myVehicle = Vehicle.fromJson(v);
        // myVehicle!.status = v.status;
        Future.delayed(const Duration(seconds: 1), () {
          loading(false);
        });
      }).catchError((_) {
        loading(false);
      });
    } else {
      isReady(true);
    }
  }
}
