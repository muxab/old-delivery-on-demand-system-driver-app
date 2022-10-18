import 'package:driver/controllers/register.controller.dart';
import 'package:driver/data/models/v-type.model.dart';
import 'package:driver/statics/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

class VehicleTypePickWidget extends StatefulWidget {
  const VehicleTypePickWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final RegisterController controller;

  @override
  State<VehicleTypePickWidget> createState() => _VehicleTypePickWidgetState();
}

class _VehicleTypePickWidgetState extends State<VehicleTypePickWidget> {
  // final TextEditingController text;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .5,
      child: Container(
        height: 110,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(1)),
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: darkSmallText('نوع المركبة'),
            ),
            Form(
              key: widget.controller.vehicleSearchFKey,
              child: TypeAheadFormField(
                suggestionsCallback: (p) => widget.controller.vTypes.where(
                    (element) => element.typeAr!
                        .toLowerCase()
                        .contains(p.toLowerCase())),
                itemBuilder: (_, Type type) => ListTile(
                  visualDensity: VisualDensity.compact,
                  leading: Text(type.typeAr!.toString()),
                  // ignore: prefer_const_constructors
                  trailing: Icon(
                    Icons.location_city,
                    color: Colors.indigo,
                  ),
                ),
                onSuggestionSelected: (Type type) {
                  widget.controller.searchType.text = type.typeAr!.toString();
                  widget.controller.vehicleType.value = type.typeAr.toString();
                },
                getImmediateSuggestions: true,
                hideSuggestionsOnKeyboardHide: true,
                hideOnEmpty: false,
                noItemsFoundBuilder: (_) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    onTap: () {
                      Get.defaultDialog(
                        radius: 4,
                        title: 'اضــافة نوع مركبة',
                        content: SizedBox(
                          height: 100,
                          width: Get.width - (Get.width / 3),
                          child: Center(
                            child: TextFormField(
                              controller: widget.controller.searchType,
                              textDirection: TextDirection.rtl,
                              decoration: InputDecoration(
                                  hintText: widget.controller.searchType.text),
                            ),
                          ),
                        ),
                        confirm: ElevatedButton.icon(
                          onPressed: () {
                            widget.controller.addType();
                            Get.back();
                            Get.defaultDialog(
                                radius: 0,
                                title: '',
                                content: Container(
                                  height: 20,
                                  width: Get.width - (Get.width / 2),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('تمت الاضـافة'),
                                        IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: const Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ]),
                                ));
                          },
                          // onPressed: () {
                          // },
                          icon: const Icon(Icons.add),
                          label: const Text('إضــافة'),
                        ),
                      );
                    },
                    leading: Text(
                        'اضـافة نوع المركبة ${widget.controller.searchType.text.toString()}'),
                  ),
                ),
                textFieldConfiguration: TextFieldConfiguration(
                    decoration: const InputDecoration(
                      hintText: 'ان لم تجد نوع شاحنتك اكتبه واضفه',
                      border: OutlineInputBorder(),
                    ),
                    controller: widget.controller.searchType),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
