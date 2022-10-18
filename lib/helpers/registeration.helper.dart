import 'package:driver/statics/apis.dart';
import 'package:get/get.dart';

class VehicleRegisterHelper extends GetConnect {
  String? name;
  String? phone;
  String? nid;
  String? email;

  VehicleRegisterHelper({
    this.name,
    this.phone,
    this.nid,
    this.email,
  });

  Future<bool> getAll() async {
    final response = await get('$mainUrl/auth/register');

    if (response.status.hasError) {
      return false;
    } else {
      return true;
    }
  }
}
