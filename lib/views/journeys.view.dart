// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:driver/controllers/journeys.controller.dart';
import 'package:driver/statics/fonts.dart';
import 'package:driver/widgets/general/loading.w.dart';
import 'package:driver/widgets/journeys/offers.w.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JourneysView extends GetView<JourneysController> {
  const JourneysView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          body: controller.loading.isTrue
              ? const LoadingWidget()
              : controller.sysError()
                  ? SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('حــدث خطــأ ما '),
                              IconButton(
                                onPressed: () {
                                  controller.onInit();
                                },
                                icon: const Icon(Icons.refresh),
                              ),
                            ],
                          ),
                          const Center(
                            child: Text('أعــد المحاولة'),
                          ),
                        ],
                      ),
                    )
                  : SafeArea(
                      // height: Get.height,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  // controller.onInit();
                                  Get.toNamed('/offers');
                                },
                                icon: Icon(Icons.history),
                                label: Text('عروض النقل النشطة'),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  // controller.onInit();
                                  Get.toNamed('/prejourneys');
                                },
                                icon: Icon(Icons.history),
                                label: Text('رحلاتي الســـابقة'),
                              ),
                            ],
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () => controller.getJourneys(),
                                    icon: Icon(Icons.refresh)),
                                darkMediumText('شحنــات مناسبة مع شاحنتك'),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            // child: Text('Offers'),
                            child: controller.shipmentToOffer.isEmpty
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('لم نجد شحنات مناسبة معك'),
                                        Card(
                                          child: ListTile(
                                            contentPadding: EdgeInsets.all(20),
                                            onTap: () =>
                                                controller.getJourneys(),
                                            leading: Text('اضــغط للتحديث'),
                                            trailing: Icon(Icons.refresh),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : OffersListView(
                                    controller: controller,
                                  ),
                          ),
                        ],
                      ),
                    )),
    );
  }
}
