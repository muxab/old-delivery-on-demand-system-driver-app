import 'package:driver/statics/apis.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OffersProvider extends GetConnect {
  final storage = GetStorage();

  Future<List<dynamic>> getAll() async {
    var token = await storage.read('token');

    final response = await get('$mainUrl/driver-main/myoffers',
        headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 404) {
      return ['empty'];
    } else {
      // print(response.body);
      return response.body;
    }
  }

  Future<dynamic> showOffer(String uuid) async {
    var token = await storage.read('token');

    final response = await get('$mainUrl/driver-main/myoffers/offer/$uuid',
        headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 404) {
      return ['empty'];
    } else {
      return response.body;
    }
  }

  Future<dynamic> cancelOffer(String uuid) async {
    var token = await storage.read('token');

    final response = await get(
        '$mainUrl/driver-main/myoffers/offer/$uuid/cancel',
        headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 404) {
      return ['empty'];
    } else {
      return response.body;
    }
  }
}
