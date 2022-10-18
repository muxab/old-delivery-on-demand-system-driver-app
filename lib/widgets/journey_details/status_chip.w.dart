import 'package:driver/statics/fonts.dart';
import 'package:flutter/material.dart';

class StatusChip extends StatelessWidget {
  StatusChip({
    Key? key,
    required this.status,
    required this.selected,
  }) : super(key: key);
  final String status;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: selected ? Colors.indigo : Colors.white,
      avatar: selected
          ? Icon(
              Icons.check_circle,
              color: Colors.white,
            )
          : null,
      label: selected ? lightSmallText(status) : darkSmallText(status),
    );
  }
}
