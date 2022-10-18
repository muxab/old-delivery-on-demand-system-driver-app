// ignore_for_file: prefer_const_constructors

import 'package:driver/widgets/register/personal-data.w.dart';
import 'package:driver/widgets/register/vehicle-data.w.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Step> stepsBuilder(controller) {
  return [
    Step(
      title: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text('بيانات شخصية'),
          Icon(Icons.person),
        ],
      ),
      content: PersonalData(
        controller: controller,
      ),
      isActive: controller.currStepper.value >= 0,
    ),
    Step(
      title: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text('بيانات المركبة'),
          Icon(CupertinoIcons.train_style_two),
        ],
      ),
      content: VehicleData(controller: controller),
      isActive: controller.currStepper.value >= 1,
    ),
  ];
}
