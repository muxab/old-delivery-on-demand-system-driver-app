import 'package:driver/controllers/journeys.controller.dart';
import 'package:driver/statics/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowMoreBtn extends StatelessWidget {
  const ShowMoreBtn({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final JourneysController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.indigo,
            elevation: 4,
          ),
          onPressed: () {
            Get.toNamed(
                '/journey/${controller.currentJourney!.uuid.toString()}');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.arrow_back, color: Colors.white),
              lightMediumText('  عرض التفاصيل  '),
            ],
          ),
        ),
      ),
    );
  }
}
