import 'package:driver/data/models/shipment.model.dart';
import 'package:driver/statics/apis.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ShipmentsProvider extends GetConnect {
  final storage = GetStorage();

  Future<dynamic> getShipment(String uuid) async {
    var token = await storage.read('token');

    final response = await get(
      '$mainUrl/driver-main/showshipment/$uuid',
      headers: {'Authorization': 'Bearer $token'},
    );
    return response.body;
  }

  Future<List<dynamic>> getShipmentsToOffer() async {
    var token = await storage.read('token');

    final response = await get(
      '$mainUrl/driver-main/shipments',
      headers: {'Authorization': 'Bearer $token'},
    );

    // if (response.body['journey'] == null) {
    //   return null;
    // } else {
    return response.body;
    // }
  }

  Future<dynamic> sendOffer(offerValue, uuid) async {
    var token = await storage.read('token');

    final response = await post(
      '$mainUrl/driver-main/offer/$uuid',
      offerValue,
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.hasError) {
      switch (response.statusCode) {
        case 401:
          Get.snackbar('عفوا', 'الرجاء تسجيل الدخول مرة اخرى');
          storage.remove('token');
          Get.toNamed('/login');
          break;
        case 403:
          Get.snackbar('عفوا', 'حــدث خطأ ما');
          storage.remove('token');
          Get.toNamed('/login');
          break;
        default:
          print(response.statusCode);
          return response.statusCode;
      }
    } else {
      return response.body;
    }
  }
}
