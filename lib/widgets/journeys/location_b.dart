import 'package:driver/controllers/journeys.controller.dart';
import 'package:driver/controllers/prejourneys.controller.dart';
import 'package:flutter/material.dart';

class LocationsBlock extends StatelessWidget {
  const LocationsBlock({Key? key, required this.controller, required this.i})
      : super(key: key);

  final PreJourneysController controller;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                controller.journeys[i].origin!.city.toString(),
              ),
              Text('الانطلاق'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                controller.journeys[i].destination!.city.toString(),
              ),
              Text('الاستلام'),
            ],
          ),
        ],
      ),
    );
  }
}
