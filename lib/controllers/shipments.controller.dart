import 'package:driver/controllers/journeys.controller.dart';
import 'package:driver/data/models/shipment.model.dart';
import 'package:driver/data/providers/shipments.provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShipmentController extends GetxController {
  var uuid = Get.parameters['uuid'];
  var loading = true.obs;
  var sysError = false.obs;
  Shipment? shipment;

  TextEditingController offerPrice = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final count = 0.obs;
  @override
  void onInit() {
    loading(true);

    super.onInit();
    getDetails();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getDetails() {
    ShipmentsProvider().getShipment(uuid!).then(
      (value) {
        print(value);
        shipment = Shipment.fromJson(value);
        Future.delayed(const Duration(seconds: 1), () {
          loading(false);
        });
      },
    ).catchError((_) {
      sysError(true);
    });
  }

  sendOffer() {
    // print('sdsdsd');
    var offerValue = {
      'amount': offerPrice.text,
    };
    ShipmentsProvider().sendOffer(offerValue, uuid!).then((value) {
      if (value['response']['msg'] == 'duplicate') {
        Get.defaultDialog(
          radius: 1,
          confirm: ElevatedButton(
              onPressed: () {
                Get.offAllNamed('/main');
              },
              child: const Text('موافق')),
          title: 'عفــوا',
          content: const Text(
            'لا يمكنك تقديم عرض اخر لهذه الشحنة',
          ),
        );
      } else if (value['response']['msg'] == 'success') {
        Get.defaultDialog(
          radius: 1,
          confirm: ElevatedButton(
              onPressed: () {
                Get.offAllNamed('/main');
              },
              child: const Text('موافق')),
          title: 'تم الارســال',
          content: const Text(
            'سيتصل بك صاحب الشحنة',
          ),
        );
      }

      // Get.back();
    }).catchError((_) {
      sysError(true);
    });
  }
}
