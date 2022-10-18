import 'package:driver/statics/apis.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserProvider extends GetConnect {
  // SharedPreferences prefs = await SharedPreferences.getInstance();

  final storage = GetStorage();

  Future<dynamic> validateOnInit() async {
    var token = await storage.read('token');

    final response = await get(
      '$mainUrl/auth/validate',
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.status.hasError) {
      // if not authorized because of token expiry
      if (response.statusCode == 401) {
        Get.toNamed('/login');
      } else if (response.statusCode == 403) {
        Get.snackbar('You Cant Use this App', 'thanks');
      }
      print(response.statusText);
      print(response.statusCode);
    } else {
      Get.toNamed('/main');
    }
  }

///////
  ///
  ///
//Login Function
  Future<dynamic> login(Map data) async {
    final response = await post('$mainUrl/auth/login', data);

    print(response.body);

    if (response.statusCode == 403) {
      Get.snackbar('عفواا', 'هذا التطبيق للســائقين فقط ..');
      print(response.statusText);
    } else if (response.body['status'] == 401) {
      Get.snackbar('عفواا', 'بيانات الدخول خاطئة ..');
    } else {
      var token = response.body['token'];
      await storage.write('token', token);

      // Get.offAllNamed('/main');
      Get.offAndToNamed('/main');
      //save it any local db//done In GetSotrage
    }
  }
}
