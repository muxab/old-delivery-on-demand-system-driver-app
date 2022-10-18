import 'package:driver/controllers/shipments.controller.dart';
import 'package:driver/statics/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayStatus extends StatelessWidget {
  const PayStatus({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ShipmentController controller;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 80,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.green,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  lightSmallText('يرجى الانتباه قبل تقديم العرض للعميل '),
                  lightSmallText(
                    'سيتواصل العميل معك مباشرة اذا قبل عرضك  ',
                  ),
                ],
              ),
              Icon(
                Icons.info_sharp,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// [Status] checking widgets -->
paymentStatus(String pay) {
  Container status;

  switch (pay) {
    case 'yes':
      status = Container(
          height: 50,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.green,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                lightMediumText('تم السداد'),
                Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ],
            ),
          ));
      break;

    case 'declined':
      status = Container(
        height: 100,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.red,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                lightMediumText('تم رفض الاشعار'),
                lightSmallText('يرجى الاتصال بخدمات المشتركين'),
                lightSmallText('+249111111111111'),
              ],
            ),
            Icon(
              Icons.error_outline,
              color: Colors.white,
            ),
          ],
        ),
      );
      break;
    case 'check':
      status = Container(
          height: 100,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.green,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    lightMediumText('يتم التحقق'),
                    lightSmallText(
                        'وستتوجه احدى مركباتنا اليك مباشرة بعد التحقق'),
                  ],
                ),
                Icon(
                  Icons.timer,
                  color: Colors.white,
                ),
              ],
            ),
          ));
      break;

    default:
      status = Container(
          height: 100,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.redAccent,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    lightMediumText('بانتظار اشعار السداد'),
                    lightSmallText(
                        'قم بارفاق اشعار السداد البنكي .. فوري او بنكك'),
                  ],
                ),
                Icon(
                  Icons.report,
                  color: Colors.white,
                ),
              ],
            ),
          ));
      break;
  }
  return status;
}
