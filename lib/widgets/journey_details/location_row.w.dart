import 'package:driver/controllers/single_journey.controller.dart';
import 'package:driver/statics/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationRow extends StatelessWidget {
  const LocationRow({
    Key? key,
    required this.controller,
    required this.type,
  }) : super(key: key);
  final JourneyController controller;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: Get.width / 4,
          child: darkBigText(type == 'origin'
              ? controller.journey!.origin!.city.toString().toUpperCase()
              : controller.journey!.destination!.city.toString().toUpperCase()),
        ),
        SizedBox(
          width: Get.width / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // darkMediumText(type == 'origin'
              //     ? controller.journey!.origin!.city.toString()
              //     : controller.journey!.destination!.city.toString()),
              darkBigText(
                type == 'origin'
                    ? 'من'.toString().toUpperCase()
                    : 'إلى'.toString().toUpperCase(),
              ),
              darkSmallText(type == 'origin'
                  ? controller.journey!.originAddress.toString()
                  : controller.journey!.destAddress.toString()),
            ],
          ),
        ),
        // SizedBox(
        //   width: Get.width / 8,
        //   child: Center(
        //     child: darkBigText(
        //       type == 'origin'
        //           ? 'من'.toString().toUpperCase()
        //           : 'إلى'.toString().toUpperCase(),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
