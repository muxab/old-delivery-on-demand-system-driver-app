import 'package:driver/widgets/register/selector.w.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/register.controller.dart';
import 'img-selections.w.dart';

class VehicleData extends StatelessWidget {
  const VehicleData({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: Get.height - (Get.height / 4),
        // color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('بيانات المركبة'),
            SingleChildScrollView(
              child: Form(
                key: controller.vehicleFKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.plateNo,
                      validator: (v) {
                        if (v!.length < 7) {
                          return 'ادخل رقم رخصة صالح';
                        }
                      },
                      textDirection: TextDirection.rtl,
                      decoration: const InputDecoration(
                        hintTextDirection: TextDirection.rtl,
                        hintText: 'رقم رخصة المركبة',
                      ),
                    ),
                    TextFormField(
                      controller: controller.cerNo,
                      validator: (v) {
                        if (v!.length < 5) {
                          return 'ادخل رقم لوحة المركبة الحقيقي';
                        }
                      },
                      textDirection: TextDirection.rtl,
                      decoration: const InputDecoration(
                        hintTextDirection: TextDirection.rtl,
                        hintText: 'رقم اللوحة',
                      ),
                    ),
                    TextFormField(
                      controller: controller.maxload,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'يرحى ادخال حمولة المركبة';
                        }
                      },
                      textDirection: TextDirection.rtl,
                      decoration: const InputDecoration(
                        hintTextDirection: TextDirection.rtl,
                        hintText: 'حمولة المركبة القصوى',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            VehicleTypePickWidget(controller: controller),
            const Spacer(),
            const Text(
              'اختر الصور',
            ),
            Column(
              children: [
                // VehCertImg Part
                ImageSelection(
                    pickImg: controller.pickCerImage,
                    imgPath: controller.cerImgPath(),
                    intialMsg: 'اختر صورة رخصة المركبة',
                    finalMsg: 'تم اختيار صورة رخصة المركبة .. '),

                // PlateImg Part
                ImageSelection(
                    pickImg: controller.pickPlateImage,
                    imgPath: controller.plateImgPath(),
                    intialMsg: 'اختر صورة امامية .. تشمل اللوحة',
                    finalMsg: 'تم اختيار صورة .. '),

                // SIdeImg Part

                ImageSelection(
                  intialMsg: 'اختــر صورة جانبية للمركبة',
                  finalMsg: 'تم اختيار صورة جانبية .. ',
                  pickImg: controller.pickSideImage,
                  imgPath: controller.sideImgPath(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
