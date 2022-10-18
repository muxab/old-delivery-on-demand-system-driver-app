import 'package:driver/data/models/journey.model.dart';
import 'package:driver/data/models/shipment.model.dart';
import 'package:driver/data/providers/shipments.provider.dart';
import 'package:get/get.dart';

class JourneysController extends GetxController {
  var loading = true.obs;
  // var journeys = List<dynamic>.empty(growable: true).obs;
  var shipmentToOffer = List<dynamic>.empty(growable: true).obs;
  Journey? currentJourney;

  var sysError = false.obs;

  @override
  void onInit() {
    super.onInit();
    getJourneys();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void getJourneys() {
    ShipmentsProvider().getShipmentsToOffer().then((value) {
      loading(true);

      if (value.isNotEmpty) {
        shipmentToOffer.value = value.map((v) => Shipment.fromJson(v)).toList();
      } else {
        shipmentToOffer.clear();
      }
    }).catchError((_) {
      loading(false);

      printError(
        info: _.toString(),
      );
    });

    Future.delayed(const Duration(seconds: 2), () {
      loading(false);
    });
  }
}
