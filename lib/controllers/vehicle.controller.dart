import 'package:driver/data/models/journey.model.dart';
import 'package:driver/data/models/vehicle.model.dart';
import 'package:driver/data/providers/driver_data.provider.dart';
import 'package:get/get.dart';

class VehicleController extends GetxController {
  var loading = true.obs;
  Vehicle? myVehicle;
  Journey? currentJourney;

  var ready = true.obs;

  @override
  void onInit() {
    super.onInit();
    getDriverData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getDriverData() {
    loading(true);
    DriverDataProvider().driverData().then(
      (value) {
        myVehicle = Vehicle.fromJson(
          value['body']['vehicle'],
        );

        currentJourney = Journey.fromJson(
          value['body']['journey'],
        );
        currentJourney!.status == 'picking' ? ready(false) : ready(true);
        loading(false);
      },
    );
  }
}
