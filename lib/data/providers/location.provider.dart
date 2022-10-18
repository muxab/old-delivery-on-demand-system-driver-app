import 'package:driver/data/models/location.model.dart';
import 'package:driver/statics/apis.dart';
import 'package:get/get.dart';

class LocationProvider extends GetConnect {
  Future<List<dynamic>> getAll() async {
    final response = await get('$mainUrl/main');

    if (response.status.hasError) {
      print(response.statusText);
      throw Exception('Error :: ');
    } else {
      List<dynamic> data = response.body['locations'];

      return data.map((e) => Location.fromJson(e)).toList();
    }
  }
}
