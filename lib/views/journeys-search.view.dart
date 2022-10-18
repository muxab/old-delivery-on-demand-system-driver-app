import 'package:driver/controllers/journeys-search.controller.dart';
import 'package:driver/widgets/general/loading.w.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JourneysSearchView extends GetView<JourneysSearchController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.indigo,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: controller.loading.isTrue
            ? LoadingWidget()
            : controller.sysError()
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('حــدث خطــأ ما '),
                            IconButton(
                              onPressed: () {
                                controller.onInit();
                              },
                              icon: Icon(Icons.refresh),
                            ),
                          ],
                        ),
                        Center(
                          child: Text('أعــد المحاولة'),
                        ),
                      ],
                    ),
                  )
                : controller.journeys.isEmpty
                    ? Center(
                        child: Text('ليس لديك رحلات'),
                      )
                    : SafeArea(
                        child: JourneysListView(
                          controller: controller,
                        ),
                      ),
      ),
    );
  }
}

class JourneysListView extends StatelessWidget {
  const JourneysListView({Key? key, required this.controller})
      : super(key: key);
  final JourneysSearchController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: controller.journeys
              .map(
                (journey) => Card(
                  child: ListTile(
                    onTap: () {
                      Get.toNamed('/journey/${journey.uuid}');
                    },
                    selected: true,
                    enableFeedback: true,
                    title: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('إلى'),
                            Text('من'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(journey.destination.city.toString()),
                            Text(journey.origin.city.toString()),
                          ],
                        ),
                      ],
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
