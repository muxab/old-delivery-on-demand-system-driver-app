import 'package:driver/controllers/home.controller.dart';
import 'package:driver/widgets/general/loading.w.dart';
import 'package:driver/widgets/home/appbar.w.dart';
import 'package:driver/widgets/home/driver_card.w.dart';
import 'package:driver/widgets/home/journey_card.w.dart';
import 'package:driver/widgets/home/vehicle_card.w.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: controller.loading.isTrue
            ? AppBar(
                backgroundColor: Colors.indigo,
              )
            : AppBar(
                backgroundColor: Colors.indigo,
                automaticallyImplyLeading: false,
                title: IconButton(
                  tooltip: 'حســابي',
                  onPressed: () {
                    // print('sdksods');
                    Get.toNamed('/profile');
                  },
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                    semanticLabel: 'حسـابي',
                  ),
                ),
                actions: [
                  HomeAppBar(
                    count: controller.notificationConuter.value,
                  ),
                ],
              ),
        body: SafeArea(
          child: controller.loading.isTrue
              ? const LoadingWidget()
              : SingleChildScrollView(
                  controller: ScrollController(),
                  // reverse: true,
                  physics: const ScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DriverCard(
                        controller: controller,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Divider(
                          // height: 10,
                          color: Colors.indigo,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        child: MiddleCard(
                          controller: controller,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Divider(
                          // height: 10,
                          color: Colors.indigo,
                        ),
                      ),
                      JourneyCard(
                        controller: controller,
                      ),
                    ],
                  ),
                ),
        ),
      ),
      // ),
    );
  }
}
