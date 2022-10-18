import 'package:driver/controllers/profile.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          child: Form(
            key: controller.formKey1,
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  child: ExpansionTile(
                    title: const Icon(Icons.phone),
                    // onTap: () {},
                    trailing: const Text('تغيير رقم الهاتف'),
                    leading: const Icon(Icons.arrow_drop_down),
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: TextFormField(
                          controller: controller.phone,
                          validator: (value) {
                            if (1 == 1) {
                              return 'nah';
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'رقم الهاتف الجديد',
                            hintTextDirection: TextDirection.rtl,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: TextFormField(
                          controller: controller.mainPassword,
                          validator: (value) {
                            if (1 == 1) {
                              return 'nah';
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'كلمة السر',
                            hintTextDirection: TextDirection.rtl,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Card(
                  child: ExpansionTile(
                    title: const Icon(Icons.alternate_email),
                    // onTap: () {},
                    trailing: const Text('تغيير الايميل'),
                    leading: const Icon(Icons.arrow_drop_down),
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: TextFormField(
                          controller: controller.email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'هذا الحقل مطلوب';
                            } else if (!value.isEmail) {
                              return 'مثلا :: email@email.com';
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'الايميل الجديد',
                            hintTextDirection: TextDirection.rtl,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: TextFormField(
                          controller: controller.mainPassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'هذا الحقل مطلوب';
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'كلمة السر',
                            hintTextDirection: TextDirection.rtl,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Card(
                  child: ExpansionTile(
                    title: const Icon(Icons.lock),
                    // onTap: () {},
                    trailing: const Text('تغيير كلمة السر'),
                    leading: const Icon(Icons.arrow_drop_down),
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: TextFormField(
                          controller: controller.newpassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'هذا الحقل مطلوب';
                            } else if (value.length < 5) {
                              return 'كلمة السر لا يمكن ان تقل عن 5 احرف';
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'كلمة السر الجديدة',
                            hintTextDirection: TextDirection.rtl,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: TextFormField(
                          controller: controller.mainPassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'هذا الحقل مطلوب';
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'كلمة السر القديمة',
                            hintTextDirection: TextDirection.rtl,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // const Spacer(),
                const SizedBox(
                  height: 200,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Card(
                    elevation: 2,
                    child: ListTile(
                      trailing: const Text('تسجيــل الخروج'),
                      leading: const Icon(
                        Icons.logout,
                        textDirection: TextDirection.rtl,
                      ),
                      onTap: () {
                        controller.logout();
                      },
                    ),
                  ),
                ),
                // const Spacer(),
                const SizedBox(
                  height: 200,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  color: Colors.red,
                  child: const Text('EXY'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
