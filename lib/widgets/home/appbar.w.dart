import 'package:driver/controllers/home.controller.dart';
import 'package:driver/statics/fonts.dart';
import 'package:driver/widgets/general/loading.w.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
    required this.count,
  }) : super(key: key);
  final count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          count == 0 ? const Text('') : lightSmallText(count.toString()),
          IconButton(
            tooltip: 'الاشعارات',
            onPressed: () {
              Get.toNamed('/notifications');
            },
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
