import 'package:driver/controllers/vehicle.controller.dart';
import 'package:driver/statics/fonts.dart';
import 'package:driver/widgets/general/loading.w.dart';
import 'package:driver/widgets/vehicle/journeys.w.dart';
import 'package:driver/widgets/vehicle/vehicle_card.w.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehicleView extends GetView<VehicleController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: controller.loading.isTrue
              ? LoadingWidget()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExpansionTile(
                            title: Title(
                              child: Text('sdsds'),
                              color: Colors.red,
                            ),
                            subtitle: Text('More'),
                            children: [
                              Row(
                                children: [
                                  Text('Ve Det.1'),
                                  Text('Ve Det.2'),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          child: darkMediumText('الرحلة الحالية'),
                        ),
                      ),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black),
                        ),
                        child: controller.myVehicle!.status != 'picking'
                            ? OnWayJourney(controller: controller)
                            : OnWaitJourney(controller: controller),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
