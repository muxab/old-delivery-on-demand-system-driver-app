// ignore_for_file: prefer_const_constructors

import 'package:driver/controllers/shipments.controller.dart';
import 'package:driver/statics/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayButton extends StatelessWidget {
  const PayButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ShipmentController controller;
  @override
  Widget build(BuildContext context) {
    return controller.shipment!.payment.toString() == 'check'
        ? SizedBox()
        : InkWell(
            onTap: () {
              Get.defaultDialog(
                title: 'حدد قيمة العرض ',
                content: Column(
                  children: [
                    SizedBox(
                      width: 250,
                      height: 100,
                      child: Form(
                        key: controller.formKey,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          controller: controller.offerPrice,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'الرجاء كتابة قيمة العرض';
                            }
                          },
                          // onChanged: (v) {},
                        ),
                      ),
                    ),
                    darkSmallText('مثـلا :: 150000')
                  ],
                ),
                radius: 4,
                confirm: ElevatedButton(
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.sendOffer();
                      }
                    },
                    child: Text('تأكيد')),
              );
            },
            child: Container(
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.indigoAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: lightMediumText('قــدم عرضك'),
              ),
            ),
          );
  }
}


/// [Depricated]
/// 
//   newP(String pay) {
//     GestureDetector button;

//     switch (pay) {
//       case 'yes':
//         button = GestureDetector(
//           onTap: null,
//           child: lightMediumText('تم السداد'),
//         );
//         break;
//       case 'no':
//         button = GestureDetector(
//           onTap: () {
//             Get.toNamed('/payment/${controller.uuid}');
//             // Get.delete<ShipmentController>();
//           },
//           child: lightSmallText('قم بارفاق اشعار السداد '),
//         );
//         break;
//       case 'declined':
//         button = GestureDetector(
//           onTap: () {
//             Get.toNamed('/payment/${controller.uuid}');
//             // Get.delete<ShipmentController>();
//           },
//           child: lightMediumText('تم رفض الاشعار'),
//         );
//         break;
//       case 'check':
//         button = GestureDetector(
//           onTap: null,
//           child: lightMediumText('يتم التحقق'),
//         );
//         break;

//       default:
//         button = GestureDetector(
//           onTap: () {
//             Get.toNamed('/payment/${controller.uuid}');
//             // Get.delete<ShipmentController>();
//           },
//           child: lightMediumText('قم بارفاق اشعار السداد '),
//         );
//         break;
//     }
//     return button;
//   }
// }
  // paymentDialog() {
  //   return Get.defaultDialog(
  //     title: 'تحقـق',
  //     content: Container(
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //       ),
  //       width: Get.width - 100,
  //       height: Get.height / 2,
  //       child: SingleChildScrollView(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Text('Det1'),
  //                 Text('Det1'),
  //               ],
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Text('Det1'),
  //                 Text('Det1'),
  //               ],
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Text('Det1'),
  //                 Text('Det1'),
  //               ],
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Text('السعر هنا من الكونتروللر'),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //     radius: 5,
  //     confirm: ElevatedButton(
  //       onPressed: () {
  //         Get.back();
  //       },
  //       child: Text('مـوافق'),
  //     ),
  //     cancel: ElevatedButton(
  //       style: ElevatedButton.styleFrom(
  //         primary: Colors.red,
  //       ),
  //       onPressed: () {
  //         Get.back();
  //       },
  //       child: Text('إلـفاء'),
  //     ),
  //   );
  // }
