import 'package:driver/controllers/register.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'img-selections.w.dart';

class PersonalData extends StatelessWidget {
  const PersonalData({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - (Get.height / 4),
      // color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('بيانات شخصية'),
          Form(
            key: controller.nameKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  enableInteractiveSelection: false,
                  controller: controller.name,
                  validator: (v) {
                    if (v!.length < 8) {
                      return 'يرحى ادخال الاسم الثنائي';
                    }
                  },
                  textDirection: TextDirection.rtl,
                  decoration: const InputDecoration(
                      hintTextDirection: TextDirection.rtl, hintText: 'الاسم'),
                ),
                //
                TextFormField(
                  controller: controller.driverLecNo,
                  validator: (v) {
                    if (v!.length < 5) {
                      return 'يرحى ادخال رقم رخصة صالح';
                    }
                  },
                  textDirection: TextDirection.rtl,
                  decoration: const InputDecoration(
                      hintTextDirection: TextDirection.rtl,
                      hintText: 'رقم الرخصة'),
                ),
                //
                TextFormField(
                  controller: controller.phone,
                  validator: (v) {
                    if (!v!.isPhoneNumber) {
                      return 'يرجى ادخال رقم هاتف صحيح : 09123456789';
                    }
                  },
                  textDirection: TextDirection.rtl,
                  decoration: const InputDecoration(
                      hintTextDirection: TextDirection.rtl,
                      hintText: 'رقم الهاتف'),
                ),
                //
                TextFormField(
                  controller: controller.email,
                  textDirection: TextDirection.rtl,
                  decoration: const InputDecoration(
                      hintTextDirection: TextDirection.rtl,
                      hintText: 'الايميل'),
                ),
                //
                TextFormField(
                  controller: controller.password,
                  validator: (v) {
                    if (v!.length < 5) {
                      return 'كلمة السر لابد ان تكون خمسة خانات على الاقل ';
                    }
                  },
                  textDirection: TextDirection.rtl,
                  decoration: const InputDecoration(
                      hintTextDirection: TextDirection.rtl,
                      hintText: 'كلمة السر'),
                ),
                //
                TextFormField(
                  controller: controller.confirmPassword,
                  validator: (v) {
                    if (v != controller.password.text) {
                      return 'كلمة السر والتاكيد لا يتطابقان';
                    }
                  },
                  textDirection: TextDirection.rtl,
                  decoration: const InputDecoration(
                      hintTextDirection: TextDirection.rtl,
                      hintText: 'تاكيد كلمة السر'),
                ) //
              ],
            ),
          ),
          Obx(
            () => ImageSelection(
                pickImg: controller.pickLecImage,
                imgPath: controller.lecImgPath(),
                intialMsg: 'اختر صورة الرخصة ',
                finalMsg: 'تم اختيار صورة رخصة .. اضغط للتغيير'),
          ),
        ],
      ),
    );
  }
}
