import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator_v2/app/core/values/global_widget_values.dart';

class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final Icon? icon;
  final String? hintText;
  final bool obscureText;
  final double? width;

  const CustomField({
    Key? key,
    required this.controller,
    this.icon,
    this.hintText,
    this.obscureText = false,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width != null
              ? min(Get.width / 1.2, width!)
              : min(Get.width / 1.2, GlobalWidgetValues.defaultFieldWidth),
          margin: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Get.theme.cardColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                icon: icon,
                border: InputBorder.none,
                hintText: hintText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
