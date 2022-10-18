import 'package:driver/controllers/home.controller.dart';
import 'package:driver/statics/colors.dart';
import 'package:driver/statics/fonts.dart';
import 'package:driver/widgets/general/loading.w.dart';
import 'package:driver/widgets/home/statustxt.w.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverCard extends StatelessWidget {
  const DriverCard({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.loading()
          ? const LoadingWidget()
          : Container(
              height: Get.height / 2,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Divider(
                      height: 0.2,
                      thickness: 0.4,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: lightMediumText('مرحبــا'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          lightMediumText(controller.user!.name),
                          const SizedBox(
                            height: 10,
                          ),
                          controller.user!.isCompany!
                              ? lightMediumText(controller.user!.companyName)
                              : lightMediumText('مستقــل'),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          lightMediumText('الســائق'),
                          const SizedBox(
                            height: 10,
                          ),
                          lightMediumText('الشركة'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  controller.myVehicle != null
                      ? Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          // height: 80,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: CustomTheme.silver,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    darkBigText(
                                      'المركبة',
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    darkMediumText(
                                      controller.myVehicle!.liceinseNo
                                          .toString(),
                                    ),
                                    darkMediumText('رقم اللوحة'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    darkMediumText(
                                      controller.myVehicle!.typeTxt.toString(),
                                    ),
                                    darkMediumText('النوع'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CupertinoSwitch(
                                      value: controller.isReady(),
                                      onChanged: (v) {
                                        controller.vehicleReady(v);
                                      },
                                    ),
                                    VStatusText(
                                      statusVar: controller.myVehicle!.status
                                          .toString(),
                                    ),
                                    darkMediumText('حالة المركبة')
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            const Text('ليس لديك مركبة مسجلة باسمك'),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('اضــفط لاضافة تفاصيل المركبة'),
                            ),
                          ],
                        )
                ],
              ),
            ),
    );
  }
}
