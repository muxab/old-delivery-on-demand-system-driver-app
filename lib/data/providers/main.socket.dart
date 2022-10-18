import 'package:driver/statics/apis.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';

class Sockets {
  Socket socket = io(
    '$mainUrl/shipment',
    OptionBuilder()
        .setTransports(['websocket']) // for Flutter or Dart VM
        .disableAutoConnect()
        .build(),
  );
  Future intiConnection(type) async {
    // print('Trying Connection From Class');

    socket.connect();
    // socket.onConnect((data) => print('connected :: $data'));
    socket.onConnectError((data) => print('connection error => :: $data'));

    socket.onError((_) => print('eeror is ' + _));

    testConnection(type);
  }

  Future testConnection(type) async {
    socket.on('newShipment-$type', (data) {
      Get.snackbar('from Socket', data.toString());
      return data;
    });
  }
}
