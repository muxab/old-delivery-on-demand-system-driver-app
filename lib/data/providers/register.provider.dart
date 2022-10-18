import 'package:driver/statics/apis.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterProvider extends GetConnect {
  final storage = GetStorage();

  Future<dynamic> register(files, driverData) async {
    print(driverData['max_load']);
    final form = FormData(
      {
        'plate': MultipartFile(files[0], filename: files[0].path),
        'cer': MultipartFile(files[2], filename: files[2].path),
        'side': MultipartFile(files[1], filename: files[1].path),
        'driverlec': MultipartFile(files[3], filename: files[3].path),
        'name': driverData['name'],
        'email': driverData['email'],
        'lecNo': driverData['lecNo'],
        'password': driverData['password'],
        'phone': driverData['phone'],
        'type': driverData['type'],
        'liceinseNo': driverData['liceinseNo'],
        'plate_no': driverData['plate_no'],
        'max_load': driverData['max_load'],
      },
    );

    final response = await post(
      '$mainUrl/driver-vehicle/register',
      form,
    );
    print({
      'body': response.body,
      'code': response.statusCode,
    });
    var token = response.body['token'];
    if (token != null) {
      await storage.write('token', token);

      Get.toNamed('/main');
    } else {
      return response.body;
    }
  }

  Future<List<dynamic>> getTypes() async {
    final response = await get(
      '$mainUrl/driver-vehicle/get-types',
    );
    return response.body;
  }

  Future<dynamic> addType(String type) async {
    final response = await post(
      '$mainUrl/driver-vehicle/add-type',
      {'type': type},
    );
    return response.body;
  }
}
