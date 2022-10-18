import 'package:driver/data/models/journey.model.dart';
import 'package:driver/data/providers/journey.provider.dart';
import 'package:get/get.dart';

class PreJourneysController extends GetxController {
  var loading = true.obs;
  var journeys = List<Journey>.empty(growable: true).obs;

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
    loading(true);
    JourneyProvider().getAll().then(
      (v) {
        if (v.isEmpty) {
          journeys.clear();
        } else if (v[0] == 'error') {
          sysError(true);
        } else {
          journeys.value = v.map((e) => Journey.fromJson(e)).toList();
        }
      },
    );

    Future.delayed(const Duration(seconds: 2), () {
      loading(false);
    });
  }
}
