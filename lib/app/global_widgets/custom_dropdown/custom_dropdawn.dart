import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator_v2/app/core/values/global_widget_values.dart';
import 'package:money_calculator_v2/app/global_widgets/custom_dropdown/custom_dropdown_controller.dart';

class CustomDropdown extends StatelessWidget {
  final CustomDropdownController controller;

  const CustomDropdown({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: controller.width != null
              ? min(Get.width / 1.1, controller.width!)
              : min(Get.width / 1.1, GlobalWidgetValues.defaultFieldWidth),
          margin: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Get.theme.cardColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Obx(
              () => DropdownButtonFormField<String>(
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 32,
                elevation: 24,
                onChanged: (String? newValue) =>
                    controller.changeValue(newValue),
                value: controller.selectedValue.value,
                decoration: InputDecoration(labelText: controller.labelText),
                items: controller.list
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
    ;
  }
}
