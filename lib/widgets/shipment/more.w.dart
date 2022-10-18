import 'package:driver/controllers/shipments.controller.dart';
import 'package:driver/extra/date.function.dart';
import 'package:driver/statics/fonts.dart';

import 'package:flutter/material.dart';

class MoreDetailsRow extends StatelessWidget {
  const MoreDetailsRow({
    Key? key,
    required this.controller,
    required this.type,
  }) : super(key: key);
  final ShipmentController controller;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            greySmallText(
              'تاريخ الطلب',
            ),
            darkMediumText(
              humanTimeAr(
                controller.shipment!.created.toString(),
              ),
            ),
            // darkSmallText(controller.shipment!.created!.month.toString() +
            //     ' - ' +
            //     controller.shipment!.created!.day.toString()),
          ],
        ),
        Column(
          children: [
            greySmallText(
              'نوع الشحنة',
            ),
            Text(
              controller.shipment!.typeS.toString(),
            ),
          ],
        ),
      ],
    );
  }
}
