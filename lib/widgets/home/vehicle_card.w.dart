import 'package:driver/controllers/home.controller.dart';
import 'package:driver/statics/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MiddleCard extends StatelessWidget {
  const MiddleCard({
    Key? key,
    required this.controller,
  }) : super(
          key: key,
        );
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF0d0f4d),
      elevation: 8,
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Row(
          children: [
            controller.currentJourney != null
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        lightMediumText(
                          "وجهتي القادمة",
                        ),
                        lightMediumText(
                          controller.currentJourney!.destination!.city
                              .toString(),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: VerticalDivider(
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  lightMediumText(
                    "خدمات العملاء",
                  ),
                  Tooltip(
                    message: 'أتصــل بنا',
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      onPressed: () {
                        Get.defaultDialog();
                      },
                      icon: const Icon(Icons.phone),
                      label: lightMediumText(
                        'اتصــل',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
