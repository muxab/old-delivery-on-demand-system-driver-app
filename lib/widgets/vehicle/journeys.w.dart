import 'package:driver/controllers/vehicle.controller.dart';
import 'package:driver/statics/fonts.dart';
import 'package:flutter/material.dart';

class OnWayJourney extends StatelessWidget {
  const OnWayJourney({Key? key, required this.controller}) : super(key: key);
  final VehicleController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            darkMediumText(
              controller.currentJourney!.origin!.city.toString(),
            ),
            darkMediumText('من'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            darkMediumText(
              controller.currentJourney!.destination!.city.toString(),
            ),
            darkMediumText('إلى'),
          ],
        ),
      ],
    );
  }
}

class OnWaitJourney extends StatelessWidget {
  const OnWaitJourney({Key? key, required this.controller}) : super(key: key);
  final VehicleController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        jounreyPickAlert(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            darkMediumText(
              controller.currentJourney!.origin!.city.toString(),
            ),
            darkMediumText('من'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            darkMediumText(
              controller.currentJourney!.destination!.city.toString(),
            ),
            darkMediumText('إلى'),
          ],
        ),
      ],
    );
  }

  Padding jounreyPickAlert() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.report,
            color: Colors.red,
          ),
          darkMediumText('يرجى التأكد من رفع الحمولة قبل الانطلاق'),
          Icon(
            Icons.report,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
