import 'package:get/get.dart';

import '../controllers/prejourneys.controller.dart';

class PreJourneysBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreJourneysController>(
      () => PreJourneysController(),
    );
  }
}
