import 'package:get/get.dart';

class JourneysSearchController extends GetxController {
  var loading = true.obs;
  var journeys = List<dynamic>.empty(growable: true).obs;

  var sysError = false.obs;

  @override
  void onInit() {
    super.onInit();
    searchJourneys();
  }

  @override
  void onClose() {}

  void searchJourneys() {
    // loading(true);
    // JourneyProvider().searchCompatiableJourneys().then(
    //   (v) {
    //     print('searching JOurneys BAbe');
    //     print(v);
    //     if (v.isEmpty) {
    //       journeys.clear();
    //     } else if (v[0] == 'error') {
    //       sysError(true);
    //     } else {
    //       var dataJourneys = v.map((e) => Journey.fromJson(e)).toList();
    //       journeys(dataJourneys);
    //       print(
    //         'Empty Journeys',
    //       );
    //     }
    //     Future.delayed(Duration(seconds: 2), () {
    //       loading(false);
    //     });
    //   },
    // ).catchError((_) {
    //   print(_);
    //   loading(false);
    // });
  }
}
