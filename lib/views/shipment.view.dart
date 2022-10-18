// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:driver/controllers/shipments.controller.dart';
import 'package:driver/widgets/general/loading.w.dart';
import 'package:driver/widgets/shipment/shipment_details.w.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShipmentView extends GetView<ShipmentController> {
  const ShipmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.indigo,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          toolbarHeight: 56,
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        body: controller.sysError()
            ? Column(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'حــدث خطــأ .. يرجى اعادة المحاولة',
                        ),
                        IconButton(
                          onPressed: () => controller.onInit(),
                          icon: const Icon(Icons.refresh),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : controller.loading.isTrue
                ? const LoadingWidget()
                : ShipmentDetails(
                    controller: controller,
                  ),
      ),
    );
  }
}
