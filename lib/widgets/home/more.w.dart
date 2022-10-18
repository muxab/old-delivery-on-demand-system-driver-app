import 'package:driver/controllers/home.controller.dart';
import 'package:driver/statics/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowMoreBtn extends StatelessWidget {
  const ShowMoreBtn({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      // flex: 1,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 1),
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
              const Icon(Icons.arrow_back, color: Colors.white),
              lightMediumText('  عرض التفاصيل  '),
            ],
          ),
        ),
      ),
    );
  }
}
