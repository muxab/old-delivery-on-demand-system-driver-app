import 'package:driver/data/providers/user.provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var counter = 0.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  // User? user;

  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    // AuthenticationProvider().validateAuth().then((value) => print(value));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !value.isEmail) {
      return 'الرجاء ادخال ايميل صالح';
    }
  }

  bool isEmail(String? input) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (input == null || input.isEmpty || !regex.hasMatch(input)) {
      return true;
    } else {
      return false;
    }
  }

  validatePassword(String? value) {
    if (value == null || value == '') {
      return 'الرجاء ادخال كلمة سر صالحة';
    }
  }

  void login() {
    Map creds = {'email': email.text, 'password': password.text};
    print(creds);

    UserProvider().login(creds);
  }
}
