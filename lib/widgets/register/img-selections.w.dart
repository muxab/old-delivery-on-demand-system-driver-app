import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageSelection extends StatelessWidget {
  const ImageSelection({
    Key? key,
    required this.pickImg,
    required this.imgPath,
    required this.intialMsg,
    required this.finalMsg,
  }) : super(key: key);

  final Function? pickImg;
  final String? imgPath;

  final String? intialMsg;
  final String? finalMsg;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: imgPath == null || imgPath == ''
            ? Border.all(color: Colors.red)
            : null,
        borderRadius: BorderRadius.circular(4),
      ),
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: imgPath == ''
          ? Center(
              child: ElevatedButton(
                onPressed: () {
                  pickImg!();
                },
                // child: Text('اخـــتر صورة جانبية للمركبة'),
                child: Text(intialMsg!),
              ),
            )
          : Column(
              children: [
                ElevatedButton(
                  onPressed: () => pickImg!,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Text('تم حفظ صورة جانبية .. اضغط للتتغير'),
                      Text(finalMsg!),
                      const Icon(Icons.check),
                      IconButton(
                        onPressed: () {
                          Get.bottomSheet(
                            Stack(
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Image.file(
                                        File(
                                          // controller.myImg!.path
                                          imgPath!,
                                        ),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  color: Colors.white,
                                  alignment: Alignment.topCenter,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () => Get.back(),
                                        icon: const Icon(Icons.close),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: const Text('تغيير'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: const Icon(Icons.remove_red_eye),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
