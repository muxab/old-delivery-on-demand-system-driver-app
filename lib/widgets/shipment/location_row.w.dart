import 'package:driver/controllers/shipments.controller.dart';
import 'package:driver/statics/fonts.dart';
import 'package:flutter/material.dart';

class LocationRow extends StatelessWidget {
  const LocationRow({
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
        Container(
          // width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              darkMediumText(type == 'origin'
                  ? controller.shipment!.origin!.city.toString()
                  : controller.shipment!.destination!.city.toString()),
              darkSmallText(type == 'origin'
                  ? controller.shipment!.originAddress.toString()
                  : controller.shipment!.destAddress.toString()),
            ],
          ),
        ),
        Container(
          // width: Get.width / 8,
          child: Center(
            child: darkBigText(
              type == 'origin'
                  ? 'من'.toString().toUpperCase()
                  : 'إلى'.toString().toUpperCase(),
            ),
          ),
        ),
      ],
    );
  }
}
