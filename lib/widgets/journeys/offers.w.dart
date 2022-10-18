import 'package:driver/controllers/journeys.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersListView extends StatelessWidget {
  const OffersListView({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final JourneysController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: controller.shipmentToOffer
            .map(
              (shipment) => Card(
                child: ListTile(
                  trailing: const Icon(Icons.remove_red_eye),
                  onTap: () {
                    Get.toNamed('/shipment/${shipment.uuid}');
                  },
                  title: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            shipment.destination!.city.toString(),
                          ),
                          const Text('الوجهة'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            shipment.origin!.city.toString(),
                          ),
                          const Text('الانطلاق'),
                        ],
                      ),
                    ],
                  ),
                  leading: Column(
                    children: [
                      const Text('الوزن'),
                      Text(
                        ' ${shipment.weight.toString()} طن ',
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
