import 'package:driver/controllers/single_journey.controller.dart';
import 'package:driver/statics/fonts.dart';
import 'package:driver/widgets/general/loading.w.dart';
import 'package:driver/widgets/journey_details/location_row.w.dart';
import 'package:driver/widgets/journey_details/more.w.dart';
import 'package:driver/widgets/journey_details/status_chip.w.dart';
import 'package:driver/widgets/journey_details/update.btn.w.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JourneyView extends GetView<JourneyController> {
  const JourneyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.indigo),
            onPressed: () {
              Get.back();
            },
          ),
          toolbarHeight: 56,
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              tooltip: 'تفاصيل الرحلة',
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    color: Colors.white,
                  ),
                );
              },
              icon: const Icon(
                CupertinoIcons.question,
                color: Colors.indigo,
              ),
            )
          ],
        ),
        body: controller.sysError()
            ? Center(
                child: Column(
                  children: [
                    const Text(
                      'An Error Happend',
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.refresh),
                    ),
                  ],
                ),
              )
            : controller.loading.isTrue
                ? const LoadingWidget()
                : JourneyDetails(
                    controller: controller,
                  ),
      ),
    );
  }
}

class JourneyDetails extends StatelessWidget {
  const JourneyDetails({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final JourneyController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
      child: Column(
        children: [
          darkMediumText('تفـاصيل الرحلة'),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            child: Chip(
              elevation: 5,
              backgroundColor: Colors.white,
              // shadowColor: Colors.black,

              label: SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatusChip(
                        status: 'رفع حمولة',
                        selected: controller.journey!.status == 'picking'
                            ? true
                            : false),
                    StatusChip(
                        status: 'في الطريق',
                        selected: controller.journey!.status == 'onway'
                            ? true
                            : false),
                    StatusChip(
                        status: 'تم التسليم',
                        selected: controller.journey!.status == 'arrived'
                            ? true
                            : false),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 500,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              // border: Border.all(color: Colors.black),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  LocationRow(controller: controller, type: 'origin'),
                  const SizedBox(
                    height: 30,
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  LocationRow(controller: controller, type: 'destination'),
                  const SizedBox(
                    height: 30,
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  MoreDetailsRow(
                    controller: controller,
                    type: 'none',
                  ),
                  Center(
                    child: Container(
                      height: 80,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: UpdateStatusBtn(
                        status: controller.journey!.status!,
                        controller: controller,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
