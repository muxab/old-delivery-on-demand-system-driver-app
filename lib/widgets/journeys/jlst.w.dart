import 'package:driver/controllers/prejourneys.controller.dart';
import 'package:driver/extra/date.function.dart';
import 'package:driver/widgets/journeys/details_b.dart';
import 'package:driver/widgets/journeys/location_b.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'location_b.dart';
import 'more.w.dart';

class JourneysList extends StatelessWidget {
  const JourneysList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PreJourneysController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.journeys.length,
      itemBuilder: (con, i) => Card(
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          height: 190,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      controller.journeys[i].trackNo.toString(),
                    ),
                    const Text(
                      'رقم الرحلة',
                    ),
                  ],
                ),
              ),
              JourneyCard(
                controller: controller,
                i: i,
              ),
              ShowMoreBtn(
                controller: controller,
                i: i,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JourneyCard extends StatelessWidget {
  const JourneyCard({
    Key? key,
    required this.controller,
    required this.i,
  }) : super(key: key);

  final PreJourneysController controller;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DetailsBlock(controller: controller, i: i),
        const Text('|'),
        LocationsBlock(controller: controller, i: i),
      ],
    );
  }
}

class JourneysListView extends StatelessWidget {
  const JourneysListView({Key? key, required this.controller})
      : super(key: key);
  final PreJourneysController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: controller.journeys
              .map(
                (journey) => Card(
                  child: RawMaterialButton(
                    // height: 69,
                    onPressed: () => Get.toNamed('/journey/${journey.uuid}'),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(journey.destination!.city!.toString()),
                                  Text('إلى'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(journey.origin!.city!.toString()),
                                  Text('من'),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(journey.trackNo.toString()),
                              Text(
                                humanTimeAr(
                                  journey.updated!.toIso8601String(),
                                ),
                              ),
                              Text('الوصول'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
