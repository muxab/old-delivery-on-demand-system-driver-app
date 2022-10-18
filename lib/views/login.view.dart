// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:driver/controllers/login.controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      // ),
      body: WillPopScope(
        onWillPop: () async {
          controller.counter++;
          Future.delayed(Duration(milliseconds: 1000), () {
            controller.counter(0);
          });
          if (controller.counter() == 2) {
            exit(0);
          } else {
            return false;
          }
        },
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                height: Get.height - (Get.height / 3),
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(
                      parent: NeverScrollableScrollPhysics()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Form(
                              key: controller.formKey,
                              child: TextFormField(
                                controller: controller.email,
                                validator: (value) {
                                  return controller.validateEmail(value);
                                },
                                decoration: InputDecoration(
                                  hintText: 'الايميل',
                                  hintTextDirection: TextDirection.rtl,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Form(
                              key: controller.formKey2,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'كلمة السر',
                                  hintTextDirection: TextDirection.rtl,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                ),
                                controller: controller.password,
                                validator: (text) {
                                  return controller.validatePassword(text);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.indigoAccent,
                                minimumSize: Size(200, 50)),
                            onPressed: () {
                              // controller.login();
                              if (controller.formKey.currentState!.validate() &&
                                  controller.formKey2.currentState!
                                      .validate()) {
                                // print('object');
                                controller.login();
                              }

                              // action WHEN values are valid
                            },
                            child: Text('دخـــول'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                child: Text(
                                  'تسجيـل',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                onTap: () {
                                  Get.toNamed('/register');
                                },
                              ),
                              Text('ما عندك حســاب؟')
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 50,
                    width: Get.width,
                    color: Colors.grey,
                    child: Center(child: Text('ExyPnos Made It For You ❤')),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
