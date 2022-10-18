import 'package:get/get.dart';

enum Status { ready, out, picking, trip }

hey(String? vStatus, RxBool isReady) {
  switch (vStatus) {
    case 'picking':
      isReady(false);
      Status.picking;
      break;
    case 'out':
      Status.out;
      isReady(false);
      break;
    case 'trip':
      Status.trip;
      isReady(false);
      break;
    default:
      isReady(true);
      Status.ready;
  }
  return {'isReady': isReady, 'status': Status};
}
