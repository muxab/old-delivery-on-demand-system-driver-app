import 'package:driver/controllers/journeys.controller.dart';
import 'package:driver/statics/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'details_b.w.dart';
import 'location_b.w.dart';
import 'more.w.dart';

class JourneysJCard extends StatelessWidget {
  const JourneysJCard({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final JourneysController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 4,
      width: Get.width,
      decoration: BoxDecoration(
        // color: Colors.yellow,
        borderRadius: BorderRadius.circular(
          3,
        ),
      ),
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: darkBigText('الرحلة الحالية'),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    height: 150,
                    child: Card(
                      elevation: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            // flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  controller.currentJourney!.trackNo.toString(),
                                ),
                                darkMediumText(
                                  'رقم الرحلة',
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DetailsBlock(
                                controller: controller,
                              ),
                              Text('|'),
                              LocationsBlock(
                                controller: controller,
                              ),
                            ],
                          ),
                          ShowMoreBtn(
                            controller: controller,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
