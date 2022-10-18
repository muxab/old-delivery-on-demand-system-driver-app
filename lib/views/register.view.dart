import 'package:driver/widgets/general/loading.w.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register.controller.dart';
import '../widgets/register/stepper-parts.w.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Stepper(
            controlsBuilder: newMethod,
            currentStep: controller.currStepper.value,
            type: StepperType.horizontal,
            steps: stepsBuilder(controller),
            onStepContinue: () {
              if (controller.currStepper.value ==
                  stepsBuilder(controller).length - 1) {
                // Get.snackbar('sending', 'data');
                print('goning');
              } else {
                Get.snackbar('going', 'next');

                controller.currStepper.value++;
              }
            },
            onStepCancel: () {
              if (controller.currStepper.value > 0) {
                controller.currStepper.value--;
              } else if (controller.currStepper.value == 1) {}
            },
          ),
        ),
      ),
    );
  }

  Widget newMethod(context, details) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Obx(
              () => ElevatedButton(
                onPressed: () {
                  if (controller.confirmLoader.isFalse) {
                    if (controller.currStepper.value == 0) {
                      if (controller.nameKey.currentState!.validate()) {
                        // if (1 == 1) {
                        controller.currStepper.value++;
                        // details.onStepContinue;
                      }
                    } else if (controller.currStepper.value ==
                        stepsBuilder(controller).length - 1) {
                      if (controller.vehicleFKey.currentState!.validate()) {
                        // print('register');
                        controller.register();
                      }
                    }
                  }
                },
                child: controller.confirmLoader.isTrue
                    ? const LoadingWidget()
                    : Text(
                        controller.currStepper.value ==
                                stepsBuilder(controller).length - 1
                            ? "اكمال التسجيــل"
                            : "تأكيد",
                        style: const TextStyle(color: Colors.white),
                      ),
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: Text(
                  controller.currStepper.value == 0 ? "إلغـاء" : "رجوع",
                  style: const TextStyle(color: Colors.white),
                ),
                onPressed: controller.currStepper.value == 0
                    ? Get.back
                    : details.onStepCancel),
          ),
        ],
      ),
    );
  }
}
