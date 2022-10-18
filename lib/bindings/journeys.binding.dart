import 'package:driver/controllers/Journeys.controller.dart';
import 'package:get/get.dart';

class JourneysBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JourneysController>(
      () => JourneysController(),
    );
  }
}
