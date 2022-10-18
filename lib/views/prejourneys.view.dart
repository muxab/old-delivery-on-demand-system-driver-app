// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors
import 'package:driver/controllers/prejourneys.controller.dart';
import 'package:driver/statics/fonts.dart';
import 'package:driver/widgets/general/loading.w.dart';
import 'package:driver/widgets/journeys/offers.w.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/journeys/jlst.w.dart';

class PreJourneysView extends GetView<PreJourneysController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            automaticallyImplyLeading: true,
          ),
          body: controller.loading.isTrue
              ? const LoadingWidget()
              : controller.sysError()
                  ? Container(
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
                  : Container(
                      // height: Get.height,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 4,
                            child: controller.journeys.isEmpty
                                ? Container(
                                    child: const Center(
                                      child: Text('ليس لديك رحلات سابقة'),
                                    ),
                                  )
                                : SafeArea(
                                    child: JourneysListView(
                                      controller: controller,
                                    ),
                                  ),
                          )
                        ],
                      ),
                    )),
    );
  }
}
