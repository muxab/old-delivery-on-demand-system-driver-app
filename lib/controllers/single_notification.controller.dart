import 'package:driver/data/models/notification.model.dart';
import 'package:driver/data/providers/notification.provider.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  //TODO: Implement ProfileController
  var uuid = Get.parameters['uuid'];
  var loading = true.obs;
  Notification? notification;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getNotification();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void goBack() {
    Get.back();
  }

  getNotification() {
    NotificationsProvider()
        .getSingleNotification(uuid!)
        .then((value) => notification = value);
    loading(false);
  }
}
