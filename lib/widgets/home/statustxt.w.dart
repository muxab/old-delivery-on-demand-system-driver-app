import 'package:flutter/material.dart';

class StatusText extends StatelessWidget {
  StatusText({
    Key? key,
    // required this.status,
    required this.statusVar,
  }) : super(key: key);
  String statusVar;
  late String status;
  late Color colorVar;

  @override
  Widget build(BuildContext context) {
    switch (statusVar) {
      case 'picking':
        status = 'رفع حمولة';
        colorVar = Colors.red;
        break;
      case 'ready':
        status = 'جاهز';
        colorVar = Colors.white;
        break;
      case 'onway':
        status = 'في رحلة';
        colorVar = Colors.green;

        break;
      default:
        status = 'خارج الخدمة';
        colorVar = Colors.yellow;

        break;
    }
    return Chip(
      backgroundColor: colorVar,
      label: Text(
        status.toString(),
      ),
    );
  }
}

class VStatusText extends StatelessWidget {
  VStatusText({
    Key? key,
    // required this.status,
    required this.statusVar,
  }) : super(key: key);
  String statusVar;
  late String status;
  late Color colorVar;

  @override
  Widget build(BuildContext context) {
    switch (statusVar) {
      case 'picking':
        status = 'رفع حمولة';
        colorVar = Colors.red;
        break;
      case 'ready':
        status = 'جاهز';
        colorVar = Colors.white;
        break;
      case 'trip':
        status = 'في رحلة';
        colorVar = Colors.green;

        break;
      default:
        status = 'خارج الخدمة';
        colorVar = Colors.yellow;

        break;
    }
    return Chip(
      backgroundColor: colorVar,
      label: Text(
        status.toString(),
      ),
    );
  }
}
