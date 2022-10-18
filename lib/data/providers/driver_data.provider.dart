import 'package:driver/data/models/journey.model.dart';
import 'package:driver/data/models/vehicle.model.dart';
import 'package:driver/statics/apis.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DriverDataProvider extends GetConnect {
  // SharedPreferences prefs = await SharedPreferences.getInstance();

  final storage = GetStorage();

  Future<dynamic> driverData() async {
    var token = await storage.read('token');

    final response = await get('$mainUrl/driver-main',
        headers: {'Authorization': 'Bearer $token'});
    if (token == null) {
      // print('sorry');
      Get.toNamed('/login');
      return {'status_code': 000};
    }

    if (response.status.hasError) {
      if (response.statusCode == 401) {
        Get.offAndToNamed('/login');
        return {'status_code': 401};
      } else if (response.statusCode == 403) {
        Get.offAndToNamed('/login');
        return {'status_code': 403};
      }

      // if all cases not applied
    } else {
      // if response is authorized
      if (response.statusCode == 200) {
        return {'status_code': 200, 'body': response.body};
      }
    }
  }

  Future<dynamic> counter() async {
    var token = await storage.read('token');

    final response = await get('$mainUrl/notifications/main',
        headers: {'Authorization': 'Bearer $token'});

    return response.body;
  }

  Future<dynamic> updateVehicle(status) async {
    var token = await storage.read('token');

    final response = await post(
        '$mainUrl/driver-main/update-v-status', {'status': status},
        headers: {'Authorization': 'Bearer $token'});

    print(response.body);
    return response.body;
  }
}
