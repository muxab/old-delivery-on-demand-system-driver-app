import 'package:driver/controllers/single_journey.controller.dart';
import 'package:driver/extra/date.function.dart';
import 'package:driver/statics/fonts.dart';
import 'package:flutter/material.dart';

class MoreDetailsRow extends StatelessWidget {
  const MoreDetailsRow({
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
        Column(
          children: [
            greySmallText(
              'تاريخ الطلب',
            ),
            darkMediumText(
              humanTimeAr(
                controller.journey!.created.toString(),
              ),
            ),
          ],
        ),
        Column(
          children: [
            greySmallText(
              'رقم التتبع',
            ),
            darkMediumText(
              controller.journey!.trackNo.toString(),
            ),
          ],
        ),
      ],
    );
  }
}
