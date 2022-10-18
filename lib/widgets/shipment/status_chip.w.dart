import 'package:driver/statics/fonts.dart';
import 'package:flutter/material.dart';

class StatusChip extends StatelessWidget {
  StatusChip({
    Key? key,
    required this.status,
    required this.type,
  }) : super(key: key);
  final String status;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.indigo,
      label: type == 'w'
          ? lightSmallText('${status.toString()}  طن')
          : lightSmallText(
              status.toString(),
            ),
    );
  }
}
