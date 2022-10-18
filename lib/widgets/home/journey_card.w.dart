import 'package:driver/controllers/home.controller.dart';
import 'package:driver/controllers/main.controller.dart';
import 'package:driver/statics/fonts.dart';
import 'package:driver/widgets/home/more.w.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'details_b.w.dart';
import 'location_b.w.dart';

class JourneyCard extends StatelessWidget {
  const JourneyCard({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Get.height / 4,
      // width: Get.width,
      decoration: BoxDecoration(
        // color: Colors.yellow,
        borderRadius: BorderRadius.circular(
          3,
        ),
      ),
      child: Card(
        // elevation: 4,
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
                      child: darkMediumText('الرحلة الحالية'),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    height: 170,
                    width: Get.width,
                    child: Card(
                      elevation: 0,
                      child: controller.currentJourney == null
                          ? Center(
                              child: InkWell(
                                onTap: () {
                                  MainController().naivgate(0);
                                },
                                child: const Text(
                                    'انتقل لصفحــة الشحنــات للبحث عن شحنات  '),
                              ),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  // flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        controller.currentJourney!.trackNo
                                            .toString(),
                                      ),
                                      darkMediumText(
                                        'رقم الرحلة',
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DetailsBlock(
                                      controller: controller,
                                    ),
                                    const Text('|'),
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
