// ignore_for_file: prefer_const_constructors

import 'package:driver/controllers/shipments.controller.dart';
import 'package:driver/statics/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'location_row.w.dart';
import 'more.w.dart';
import 'payment_btn.w.dart';
import 'payment_status.w.dart';
import 'status_chip.w.dart';

class ShipmentDetails extends StatelessWidget {
  const ShipmentDetails({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ShipmentController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
      child: Column(
        children: [
          darkMediumText('تفـاصيل الرحلة'),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              // vertical: 10,
            ),
            child: Chip(
              elevation: 5,
              backgroundColor: Colors.white,
              // shadowColor: Colors.black,

              label: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StatusChip(
                      status: controller.shipment!.weight.toString(),
                      type: 'w',
                    ),
                    darkSmallText('الوزن'),
                    StatusChip(
                      status: controller.shipment!.type!.typeAr.toString(),
                      type: 't',
                    ),
                    darkSmallText('النوع'),
                    // Text('Later')
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: Container(
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
                    SizedBox(
                      // height: 30,
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    LocationRow(controller: controller, type: 'destination'),
                    SizedBox(
                      // height: 30,
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),

                    /// This [Notifications]
                    MoreDetailsRow(
                      controller: controller,
                      type: 'none',
                    ),

                    PayStatus(controller: controller),

                    /// This [Offer Button]
                    Center(
                      child: PayButton(
                        controller: controller,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
