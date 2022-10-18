import 'package:driver/data/models/user.model.dart';
import 'package:driver/statics/apis.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationProvider extends GetConnect {
  final storage = GetStorage();

  Future<dynamic> validateAuth() async {
    //read TOken from db
    var token = await storage.read('token');
// send response
    final response = await get(
      '$mainUrl/auth/validate/driver',
      headers: {'Authorization': 'Bearer $token'},
    );
    // print('token is $token');

    if (token == null) {
      // return {'status_code': 000};
      Get.toNamed('/login');
    }

    // if token is not null keep going //
    else {
      if (response.status.hasError) {
        // check errors
        if (response.statusCode == 401) {
          Get.offAndToNamed('/login');
          // return {'status_code': 401};
        } else if (response.statusCode == 403) {
          Get.offAndToNamed('/login');
          print('403 Error');

          // return {'status_code': 403};
        } else if (response.statusCode == 500) {
          print('500 Error');

          Get.offAndToNamed('/login');
          Get.snackbar('SOrry', 'Server Error');
          // return {'status_code': 403};
        }

        print(response.statusCode);
        // if all cases not applied
      }
      // if no errors
      else {
        // if response is authorized
        if (response.statusCode == 200) {
          // return {'status_code': 200};
          if (response.body['user'] == null) {
            Get.offAndToNamed('/login');
            Get.snackbar('Sorry', 'Server Error  \' No User');
          } else {
            var user = response.body['user'];
            // print('user is $user');
            storage.write('user', user);
            Get.offAllNamed('/main');
          }
        }
      }
    }
  }

  Future<dynamic> validateUser() async {
    var token = await storage.read('token');

    final response = await get(
      '$mainUrl/auth/validate/driver',
      headers: {'Authorization': 'Bearer $token'},
    );

    var user = response.body['user'];
    storage.write('user', user);

    if (response.statusCode == 200) {
      if (response.body['user'] == null) {
        Get.snackbar('Sorry', 'Server Error  \' No User');
        Get.offAndToNamed('/login');
      } else {
        storage.write('user', user);
        return User.fromJson(user);
      }
    } else {
      Get.snackbar('err', response.statusCode.toString());
    }
  }
}
