import 'package:driver/controllers/home.controller.dart';
import 'package:driver/widgets/general/loading.w.dart';
import 'package:driver/widgets/main/user.w.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: controller.loading.isTrue
              ? LoadingWidget()
              : Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: UserCard(
                        name: controller.user!.name,
                        companyName: controller.user!.companyName.toString(),
                      ),
                    ),
                    Container(
                      child: Expanded(
                        flex: 3,
                        child: ListView(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 400,
                              color: Colors.red,
                              child: controller.currentJourney == null
                                  ? Text(
                                      'No Journey',
                                    )
                                  : Container(
                                      child: controller
                                                  .currentJourney!.status ==
                                              'picking'
                                          ? Text('يرجى تأكيد التقاط الشحنات')
                                          : Text('التوجه نحوو'),
                                    ),
                            ),
                            Container(
                              height: 400,
                              color: Colors.yellow,
                              child: Text(
                                controller.myVehicle == null
                                    ? 'No V'
                                    : controller.myVehicle!.uuid.toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
