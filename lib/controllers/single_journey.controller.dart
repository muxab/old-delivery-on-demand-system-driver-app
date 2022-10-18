import 'package:driver/data/models/journey.model.dart';
import 'package:driver/data/providers/journey.provider.dart';
import 'package:get/get.dart';

class JourneyController extends GetxController {
  var uuid = Get.parameters['uuid'];

  var loading = true.obs;
  Journey? journey;
  final count = 0.obs;

//On Error or no Connection ;
  var sysError = false.obs;

  @override
  void onInit() {
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
    loading(true);
    JourneyProvider().getJourney(uuid!).then((value) {
      value == 404 ? sysError(true) : journey = value;

      loading(false);
    }).catchError((_) {
      sysError(true);
    });
  }

  //if status is moving => update jrny is in way now
  // else if arrived => update its arrived ..etc
  updateStatusonWay() {
    String? status;
    journey!.status == 'picking' ? status = 'w' : 'd';

    JourneyProvider().updateJrneyOnway(uuid, status!).then((value) {
      journey = value;
    });

    Get.back();
  }

  updateStatusArrived() {
    String? status;
    journey!.status == 'picking' ? status = 'w' : status = 'd';

    print('تأكيد الوصول ');
    // print(uuid.toString() + '' + status.toString());

    JourneyProvider().updateJrneyArrived(uuid, status).then((value) {
      journey = value;
    });

    Get.back();

    Get.deleteAll();
    Get.toNamed('/main');
  }
}
