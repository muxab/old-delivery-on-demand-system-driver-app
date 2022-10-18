import 'dart:ffi';
import 'dart:io';

import 'package:driver/data/models/v-type.model.dart';
import 'package:driver/data/providers/register.provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  //
  GlobalKey<FormState> vehicleFKey = GlobalKey<FormState>();
  GlobalKey<FormState> vehicleSearchFKey = GlobalKey<FormState>();

  TextEditingController cerNo = TextEditingController();
  TextEditingController plateNo = TextEditingController();
  TextEditingController maxload = TextEditingController();

  var vTypes = List<Type>.empty(growable: true).obs;
  TextEditingController searchType = TextEditingController();
  var vehicleType = ''.obs;

//

  GlobalKey<FormState> nameKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController driverLecNo = TextEditingController();

  var currStepper = 0.obs;
  var confirmLoader = false.obs;

// image picker
  final _picker = ImagePicker();

  // image for each of above

  File? lecImg;
  var lecImgPath = ''.obs;
  File? plateImg;
  var plateImgPath = ''.obs;
  File? cerImg;
  var cerImgPath = ''.obs;
  File? sideImg;
  var sideImgPath = ''.obs;

  Future<void> pickLecImage() async {
    final pickedFile = await _picker.getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      lecImg = File(pickedFile.path);
      lecImgPath.value = pickedFile.path;
      //  imgPath.value = File(pickedFile.path);
      update();
    } else {
      printError(info: 'info');
    }
  }

  Future<void> pickCerImage() async {
    final pickedFile = await _picker.getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      cerImg = File(pickedFile.path);
      cerImgPath.value = pickedFile.path;
      //  imgPath.value = File(pickedFile.path);
      update();
    } else {
      printError(info: 'info');
    }
  }

  Future<void> pickPlateImage() async {
    final pickedFile = await _picker.getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      plateImg = File(pickedFile.path);
      plateImgPath.value = pickedFile.path;
      //  imgPath.value = File(pickedFile.path);
      update();
    } else {
      printError(info: 'info');
    }
  }

  Future<void> pickSideImage() async {
    final pickedFile = await _picker.getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      sideImg = File(pickedFile.path);
      sideImgPath.value = pickedFile.path;
      //  imgPath.value = File(pickedFile.path);
      update();
    } else {
      printError(info: 'info');
    }
  }

  @override
  void onInit() {
    super.onInit();
    getTypes();
  }

  @override
  void onClose() {}

  getTypes() {
    RegisterProvider().getTypes().then(
          (value) => vTypes.value = value.map((e) => Type.fromJson(e)).toList(),
        );
  }

  addType() {
    RegisterProvider().addType(searchType.text).then(
          (value) => vTypes.add(Type.fromJson(value)),
        );
  }

  void register() async {
    List<File> files = [plateImg!, sideImg!, cerImg!, lecImg!];

    var driverData = {
      'name': name.text,
      'email': email.text,
      'lecNo': driverLecNo.text,
      'phone': phone.text,
      'password': password.text,
      'type': searchType.text,
      'liceinseNo': cerNo.text,
      'plate_no': plateNo.text,
      'max_load': maxload.text
    };

    if (vehicleFKey.currentState!.validate() &&
        nameKey.currentState!.validate()) {
      confirmLoader(true);
      RegisterProvider().register(files, driverData).then(
            (value) => Future.delayed(
              const Duration(seconds: 2),
              () => confirmLoader(false),
            ),
          );
    } else {
      Get.snackbar(
        'عفــوا',
        'قم بتصحيح الاخطــاء',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 5),
      );
    }
  }
}
