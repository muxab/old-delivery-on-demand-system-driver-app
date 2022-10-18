import 'package:driver/data/models/offer.model.dart';
import 'package:driver/data/providers/offers.provider.dart';
import 'package:driver/views/offers.view.dart';
import 'package:get/get.dart';

class OffersController extends GetxController {
  var loading = false.obs;

  var sysError = false.obs;
  var offers = List<Offer>.empty(growable: true).obs;
  Offer? offer;

  @override
  void onInit() {
    super.onInit();
    getMyOffers();
  }

  getMyOffers() {
    loading(true);
    OffersProvider().getAll().then(
      (value) {
        if (value[0] == 'empty') {
          offers.clear();
        } else if (value.isNotEmpty) {
          offers.value = value.map((e) => Offer.fromJson(e)).toList();
          print(offers);
        }
        loading(false);
      },
    ).catchError((_) {
      loading(false);

      printError(info: _.toString());
      sysError(true);
    });
  }

  showOffer(uuid) {
    loading(true);
    OffersProvider().showOffer(uuid).then((value) {
      offer = Offer.fromJson(value);
    }).catchError((_) {
      offer = null;
    });
    loading(false);
  }

  cancelOffer(uuid) {
    // loading(true);
    // OffersProvider().cancelOffer(uuid).then((value) {
    //   offer = Offer.fromJson(value);
    // }).catchError((_) {
    //   offer == null;
    // });
    // loading(false);
    print('cancelling');
  }
}
