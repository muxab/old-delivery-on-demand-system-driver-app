import 'package:driver/data/models/journey.model.dart';
import 'package:driver/data/models/notification.model.dart';
import 'package:driver/statics/apis.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NotificationsProvider extends GetConnect {
  final storage = GetStorage();

  Future<List<dynamic>> getAll() async {
    var token = await storage.read('token');

    final response = await get('$mainUrl/notifications',
        headers: {'Authorization': 'Bearer $token'});

    return response.body;
  }

  Future<dynamic> getSingleNotification(String uuid) async {
    var token = await storage.read('token');

    final response = await get('$mainUrl/notifications/$uuid',
        headers: {'Authorization': 'Bearer $token'});
    final notification = response.body['notification'];
    return Notification.fromJson(notification);
  }

  Future<dynamic> deleteNotification(uuid) async {
    var token = await storage.read('token');

    final response = await delete('$mainUrl/notifications/delete/$uuid',
        headers: {'Authorization': 'Bearer $token'});

    return response.body;
  }

  Future<dynamic> updateNotification(uuid) async {
    var token = await storage.read('token');

    final response = await get('$mainUrl/notifications/read/$uuid',
        headers: {'Authorization': 'Bearer $token'});
    print(response.body);
    return Notification.fromJson(response.body);
  }
}
