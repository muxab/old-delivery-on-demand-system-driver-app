import 'package:flutter/material.dart';
import 'package:get/get.dart';

successWidget() {
  Get.defaultDialog(
      title: 'خطــأ',
      content: SizedBox(
        child: Row(
          children: const [
            Text('تــم'),
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          ],
        ),
      ));
}
