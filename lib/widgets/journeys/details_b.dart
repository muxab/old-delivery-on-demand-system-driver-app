import 'package:driver/controllers/journeys.controller.dart';
import 'package:driver/controllers/prejourneys.controller.dart';
import 'package:driver/extra/date.function.dart';
import 'package:flutter/material.dart';

class DetailsBlock extends StatelessWidget {
  const DetailsBlock({Key? key, required this.controller, required this.i})
      : super(key: key);

  final PreJourneysController controller;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        // color: Colors.red,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    humanTimeAr(
                      controller.journeys[i].created.toString(),
                    ),
                    // controller.journeys[i].trackNo.toString(),
                  ),
                  Text(
                    controller.journeys[i].status.toString(),

                    // controller.journeys[i].trackNo.toString(),
                  ),
                ],
              ),
            ),
            VerticalDivider(),
          ],
        ),
      ),
    );
  }
}
