import 'package:driver/controllers/journeys.controller.dart';
import 'package:driver/extra/date.function.dart';
import 'package:driver/widgets/home/statustxt.w.dart';
import 'package:flutter/material.dart';

class DetailsBlock extends StatelessWidget {
  const DetailsBlock({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final JourneysController controller;

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
                      controller.currentJourney!.created.toString(),
                    ),
                  ),
                  StatusText(
                    statusVar: controller.currentJourney!.status.toString(),
                  ),
                ],
              ),
            ),
            // VerticalDivider(),
          ],
        ),
      ),
    );
  }
}
