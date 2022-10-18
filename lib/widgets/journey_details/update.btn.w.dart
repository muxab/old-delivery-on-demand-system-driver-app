// ignore_for_file: must_be_immutable
import 'package:driver/controllers/single_journey.controller.dart';
import 'package:driver/statics/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateStatusBtn extends StatelessWidget {
  UpdateStatusBtn({
    Key? key,
    required this.status,
    required this.controller,
  }) : super(key: key);

  JourneyController controller;
  final String status;
  @override
  Widget build(BuildContext context) {
    return btnStatus(status);
  }

  btnStatus(status) {
    String stText;
    String titleText = '';
    bool btnActive = true;

    switch (status) {
      case 'arrived':
        stText = 'شكـرا..';
        btnActive = false;
        break;
      case 'picking':
        stText = 'الرجاء تأكيد الانطلاق';
        titleText = 'تــأكيد الرفع والانطلاق؟';
        break;
      case 'onway':
        stText = 'الرجاء تأكيد الوصول';
        titleText = 'تــأكيد الوصــول؟';

        break;
      default:
        stText = 'تأكـيد رفع الحمولة';
        break;
    }
    return GestureDetector(
      child: RawMaterialButton(
        onPressed: btnActive
            ? () {
                Get.defaultDialog(
                  title: titleText,
                  content: null,
                  radius: 2,
                  confirm: ElevatedButton(
                    onPressed: () => status == 'picking'
                        ? controller.updateStatusonWay()
                        : controller.updateStatusArrived(),
                    child: const Text('تــأكيد'),
                  ),
                  // onConfirm: () => controller.updateStatus(),
                  cancel: ElevatedButton(
                    onPressed: () => Get.back(),
                    child: const Text('الغــاء'),
                  ),
                );
              }
            : null,
        child: lightMediumText(stText),
      ),
    );
  }
}
