import 'package:driver/controllers/shipments.controller.dart';
import 'package:get/get.dart';

class ShipmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShipmentController>(
      () => ShipmentController(),
    );
  }
}
