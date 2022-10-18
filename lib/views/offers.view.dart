// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors
import 'package:driver/data/models/offer.model.dart';
import 'package:driver/extra/date.function.dart';
import 'package:driver/widgets/general/loading.w.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/offers.controller.dart';

class OffersView extends GetView<OffersController> {
  const OffersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          automaticallyImplyLeading: true,
          title: Text('عروض النقل السابقة'),
        ),
        body: controller.loading.isTrue
            ? Center(
                child: LoadingWidget(),
              )
            : Container(
                child: controller.sysError.isTrue
                    ? Center(
                        child: Row(
                          children: [
                            Text(
                              'حدث خطأ ما ',
                            ),
                            IconButton(
                              onPressed: () {
                                controller.getMyOffers();
                              },
                              icon: Icon(Icons.refresh),
                            ),
                          ],
                        ),
                      )
                    : controller.offers.isEmpty
                        ? Center(
                            child: Text('ليس لديك عروض سابقة'),
                          )
                        : Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ...controller.offers
                                  .map((element) => Card(
                                        child: ListTile(
                                          onTap: () {
                                            controller
                                                .showOffer(element.trackNo!);
                                            Future.delayed(
                                                const Duration(seconds: 1), () {
                                              offerSheet(controller.offer);
                                            });
                                          },
                                          leading: Text(element.read! == true
                                              ? "تم رؤيته من العميل"
                                              : 'لم يتم عرضه بعد'),
                                          title:
                                              Text(element.amount!.toString()),
                                          trailing: Text(
                                            humanTimeAr(
                                                element.created.toString()),
                                          ),
                                        ),
                                      ))
                                  .toList()
                            ],
                          ),
              ),
      ),
    );
  }

  offerSheet(Offer? offer) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: offer == null
            ? Center(
                child: Text('Error'),
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      IconButton(
                          onPressed: () => Get.back(), icon: Icon(Icons.close)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(offer.amount.toString()),
                      Text('قيمة العرض'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        humanTimeAr(offer.created!.toIso8601String()),
                      ),
                      Text('تاريخ العرض'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(offer.origin!.city!.toString()),
                      Text('الانطلاق')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(offer.destination!.city!.toString()),
                      Text('الوصول')
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.defaultDialog(
                        title: 'الغاء',
                        content: Text('هل تريد حذف العرض ؟'),
                        confirm: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          onPressed: () => controller.cancelOffer(offer.uuid),
                          child: Text(' اريد الغاء العرض'),
                        ),
                        cancel: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(' لا اريد الغاء العرض'),
                        ),
                      );
                    },
                    child: Text('الغـاء'),
                  ),
                ],
              ),
      ),
      ignoreSafeArea: true,
    );
  }
}
