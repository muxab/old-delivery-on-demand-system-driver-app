import 'package:get/get.dart';

class PaymentsController extends GetxController {
  //TODO: Implement ReportController
  var loading = true.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 3), () {
      loading(false);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  void nav(String route) {
    Get.toNamed('/$route');
  }

  void goBack() {
    Get.back();
  }
}
