import 'package:driver/data/providers/account.provider.dart';
import 'package:driver/widgets/account/error.w.dart';
import 'package:driver/widgets/account/success.w.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final storage = GetStorage();

  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController mainPassword = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void goBack() {
    Get.back();
  }

  changePhone() {
    var data = {'newPhone': phone.text, 'password': mainPassword.text};

    AccountProvider().changPhone(data).then((value) {
      if (value['stauts'] == 401) {
        errorWidget();
      } else {
        successWidget();
      }
    });
  }

  changeEmail() {
    var data = {'newEmail': email.text, 'password': mainPassword.text};

    AccountProvider().changEmail(data).then((value) {
      if (value['stauts'] == 401) {
        errorWidget();
      } else {
        successWidget();
      }
    });
  }

  changePassword() {
    var data = {'newPassword': newpassword.text, 'password': mainPassword.text};

    AccountProvider().changPassword(data).then((value) {
      if (value['stauts'] == 401) {
        errorWidget();
      } else {
        successWidget();
      }
    });
  }

  void logout() {
    // Get The Token ..
    // Send to api

    //unsigned from api

    Get.deleteAll();

    Get.toNamed('/login');

    // delete the token
    storage.remove('token');

    // leave to root
  }
}
