import 'package:driver/controllers/single_journey.controller.dart';
import 'package:get/get.dart';

class JourneyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JourneyController>(
      () => JourneyController(),
    );
  }
}
