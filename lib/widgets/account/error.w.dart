import 'package:flutter/material.dart';
import 'package:get/get.dart';

errorWidget() {
  Get.defaultDialog(
      title: 'خطــأ',
      content: SizedBox(
        child: Row(
          children: const [
            Text('غير مصــرح لك بالتغيير'),
            Icon(
              Icons.cancel,
              color: Colors.red,
            ),
          ],
        ),
      ));
}
