import 'package:driver/controllers/main.controller.dart';
import 'package:driver/widgets/main/bottom.w.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.view.dart';
import 'journeys.view.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(
        nav: controller.naivgate,
        controller: controller,
      ),
      body: Obx(
        () => SafeArea(
            child: IndexedStack(
          index: controller.pageIndex(),
          children: const [
            JourneysView(),
            HomeView(),
            // ProfileView(),
          ],
        )),
      ),
    );
  }
}
