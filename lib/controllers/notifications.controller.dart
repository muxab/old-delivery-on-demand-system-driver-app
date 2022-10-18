import 'package:driver/data/models/notification.model.dart';
import 'package:driver/data/providers/notification.provider.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  final count = 0.obs;
  var unread = 0.obs;
  var notificationsCuont = 0.obs;
  var loading = false.obs;
  var notifications = List<Notification>.empty(growable: true).obs;
  var sysError = false.obs;

  @override
  void onInit() {
    super.onInit();
    getNotifications();
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

  getNotifications() {
    loading(true);
    NotificationsProvider().getAll().then(
      (
        val,
      ) {
        print(val);
        notifications.value = val.map((v) => Notification.fromJson(v)).toList();
        // print(notifications);
        loading(false);
      },
    ).catchError(
      (_) {
        print(_);
        sysError(true);
      },
    );
  }

  deleteNot(uuid) {
    NotificationsProvider().deleteNotification(uuid).then(
      (
        v,
      ) {
        notifications.removeWhere((element) => element.id == uuid);
        // print(notifications);
        loading(false);
      },
    ).catchError(
      (_) {
        sysError(true);
      },
    );
  }

  updateNot(uuid) {
    NotificationsProvider().updateNotification(uuid).then(
      (
        v,
      ) {
        notifications.removeWhere((element) => element.id == uuid);

        notifications.add(v);
        loading(false);
      },
    ).catchError(
      (_) {
        sysError(true);
        printError(info: _.toString());
      },
    );
  }
}
