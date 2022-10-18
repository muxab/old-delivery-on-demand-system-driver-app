import 'package:driver/controllers/notifications.controller.dart';
import 'package:driver/statics/fonts.dart';
import 'package:driver/widgets/general/loading.w.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsView extends GetView<NotificationsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: darkMediumText('الاشعــارات'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.indigo,
          ),
          onPressed: () {
            controller.goBack();
          },
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: Obx(
        () => controller.sysError()
            ? const Center(
                child: Text('Something Went Wrong'),
              )
            : controller.loading()
                ? const LoadingWidget()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Get.height - 100,
                        child: ListView.builder(
                            itemCount: controller.notifications.length,
                            itemBuilder: (v, i) {
                              return SizedBox(
                                height: 85,
                                child: Card(
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          color:
                                              controller.notifications[i].read!
                                                  ? Colors.red
                                                  : Colors.white,
                                          height: 5,
                                          width: 5,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(controller
                                              .notifications[i].message
                                              .toString()),
                                          IconButton(
                                            onPressed: () =>
                                                controller.deleteNot(controller
                                                    .notifications[i].id),
                                            icon: const Icon(
                                              Icons.delete_forever_outlined,
                                              color: Colors.red,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () =>
                                                controller.updateNot(controller
                                                    .notifications[i].id),
                                            icon: const Icon(
                                              Icons.remove_red_eye,
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
      ),
    );
  }
}
