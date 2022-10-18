import 'package:driver/controllers/main.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    required this.controller,
    Key? key,
    required this.nav,
  }) : super(key: key);
  final MainController controller;
  final Function(int) nav;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        height: 70,
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RawMaterialButton(
                onPressed: () {
                  controller.naivgate(0);
                },
                child: BottomBtn(
                  text: 'الشحنــات',
                  id: 0,
                  index: controller.pageIndex(),
                  icon: Icons.location_on,
                ),
              ),
              RawMaterialButton(
                onPressed: () {
                  controller.naivgate(1);
                },
                child: BottomBtn(
                  text: 'الرئيسية',
                  id: 1,
                  index: controller.pageIndex(),
                  icon: Icons.home,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomBtn extends StatelessWidget {
  const BottomBtn({
    Key? key,
    required this.id,
    required this.index,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final int id;
  final int index;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (Get.width / 3) - 20,
      child: Column(
        children: [
          Icon(
            icon,
            color: id == index ? Colors.red : Colors.yellow,
          ),
          Text(text),
        ],
      ),
    );
  }
}
