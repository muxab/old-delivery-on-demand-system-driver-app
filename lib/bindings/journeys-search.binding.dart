import 'package:driver/controllers/journeys-search.controller.dart';
import 'package:get/get.dart';

class JourneysSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JourneysSearchController>(
      () => JourneysSearchController(),
    );
  }
}
