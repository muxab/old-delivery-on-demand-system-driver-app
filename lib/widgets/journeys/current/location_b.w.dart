import 'package:driver/controllers/journeys.controller.dart';
import 'package:flutter/material.dart';

class LocationsBlock extends StatelessWidget {
  const LocationsBlock({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final JourneysController controller;

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
                controller.currentJourney!.origin!.city.toString(),
              ),
              Text('الانطلاق'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                controller.currentJourney!.destination!.city.toString(),
              ),
              Text('الاستلام'),
            ],
          ),
        ],
      ),
    );
  }
}
