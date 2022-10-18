import 'package:driver/controllers/vehicle.controller.dart';
import 'package:driver/statics/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehicleDetails extends StatelessWidget {
  const VehicleDetails({Key? key, required this.controller}) : super(key: key);
  final VehicleController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            controller.ready()
                ? Switch(
                    activeColor: Colors.indigo,
                    value: controller.ready(),
                    onChanged: (v) {
                      controller.ready(v);
                    },
                  )
                : Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
            darkMediumText(controller.ready.isTrue ? 'جاهز ' : 'غير جاهز'),
            darkMediumText(
              'حالة المركبة',
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          darkMediumText(
            controller.myVehicle!.liceinseNo.toString(),
          ),
          darkMediumText(
            'رقم اللوحة',
          ),
        ])
      ],
    );
  }
}
