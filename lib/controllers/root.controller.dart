import 'package:driver/data/providers/auth.provider.dart';
import 'package:driver/data/providers/user.provider.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  var loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    print('validt');
    validateToken();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Function? validateToken() {
    loading(true);
    Future.delayed(Duration(seconds: 3), () {
      AuthenticationProvider().validateAuth();

      loading(false);
    });
  }
}
