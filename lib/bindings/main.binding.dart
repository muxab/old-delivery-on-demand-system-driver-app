import 'package:driver/controllers/home.controller.dart';
import 'package:driver/controllers/journeys.controller.dart';
import 'package:driver/controllers/main.controller.dart';
import 'package:driver/controllers/profile.controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<JourneysController>(
      () => JourneysController(),
    );
  }
}
