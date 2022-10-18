import 'package:driver/controllers/shipments.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShipmentsView extends GetView<ShipmentController> {
  const ShipmentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.indigo),
          onPressed: () {
            // controller.back();
          },
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.indigo,
        ),
        width: 120,
        height: 50,
        child: RawMaterialButton(
          child: Center(
            child: Text('إضـافة رحلة'),
          ),
          onPressed: () {
            Get.toNamed("/newshipment");
            // controller.getShipment();
          },
        ),
      ),
      body: Obx(
        () => SafeArea(
            child: controller.loading.value
                ? Center(child: CircularProgressIndicator())
                : Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
