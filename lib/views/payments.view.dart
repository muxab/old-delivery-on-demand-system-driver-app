import 'package:driver/controllers/payemnts.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentsView extends GetView<PaymentsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.indigo,
            ),
            onPressed: () {
              controller.goBack();
            },
          ),
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
        ),
        body: SafeArea(
          child: controller.loading.isTrue
              ? CircularProgressIndicator()
              : Center(
                  child: Text('All Payments View'),
                ),
        ),
      ),
    );
  }
}
