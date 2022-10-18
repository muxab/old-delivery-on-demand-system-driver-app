import 'package:driver/data/models/journey.model.dart';
import 'package:driver/statics/apis.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class JourneyProvider extends GetConnect {
  final storage = GetStorage();

  Future<List<dynamic>> getAll() async {
    var token = await storage.read('token');

    try {
      final response = await get(
        '$mainUrl/driver-main/journeys',
        headers: {'Authorization': 'Bearer $token'},
      );

      final journeys = response.body['journeys'];
      if (journeys == null) {
        return [];
      } else {
        return journeys;
      }
    } catch (e) {
      return [
        'error',
        {'error_string': e.toString()},
      ];
    }

    // return journeys.map((item) => Journey.fromJson(item)).toList();
  }

  Future<dynamic> getJourney(String uuid) async {
    var token = await storage.read('token');

    try {
      final response = await get(
        '$mainUrl/driver-journey/journey/$uuid',
        headers: {'Authorization': 'Bearer $token'},
      );
      final journey = response.body['journey'];

      if (response.statusCode == 404) {
        return 404;
      } else {
        return Journey.fromJson(journey);
      }
    } catch (e) {
      return {'error_string': e.toString()};
    }
  }

  Future<dynamic> updateJrneyArrived(uuid, status) async {
    var token = await storage.read('token');

    try {
      final response = await put(
        '$mainUrl/driver-journey/journey/$uuid/del',
        {},
        headers: {'Authorization': 'Bearer $token'},
      );

      final journey = response.body;
      if (response.statusCode == 404) {
        return 404;
      } else {
        return Journey.fromJson(journey);
      }
    } catch (e) {
      return {'error_string': e.toString()};
    }

    // return journeys.map((item) => Journey.fromJson(item)).toList();
  }

  Future<dynamic> updateJrneyOnway(uuid, status) async {
    var token = await storage.read('token');

    try {
      final response = await put(
        '$mainUrl/driver-journey/journey/$uuid/way',
        {},
        headers: {'Authorization': 'Bearer $token'},
      );

      final journey = response.body;
      if (response.statusCode == 404) {
        return 404;
      } else {
        return Journey.fromJson(journey);
      }
    } catch (e) {
      return {'error_string': e.toString()};
    }

    // return journeys.map((item) => Journey.fromJson(item)).toList();
  }

  Future<dynamic> getClientAndShipmentDetails(uuid) async {
    var token = await storage.read('token');

    final response = await put(
      '$mainUrl/driver-journey/cl-sh-details/$uuid',
      {},
      headers: {'Authorization': 'Bearer $token'},
    );

    return response.body;
  }
}
