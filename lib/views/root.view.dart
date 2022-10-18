import 'package:driver/controllers/root.controller.dart';
import 'package:driver/statics/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootView extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => SafeArea(
        child: controller.loading.value
            ? Center(
                // child: CircularProgressIndicator(
                //   value: 10,
                //   color: Colors.red,
                // ),
                child: darkBigText('مرحبـــا ... '),
              )
            : Column(
                children: [],
              ),
      ),
    ));
  }
}
