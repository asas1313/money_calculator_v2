import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator_v2/app/core/values/global_widget_values.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final double? width;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Container(
        width: width != null
            ? min(Get.width / 1.2, width!)
            : min(Get.width / 1.2, GlobalWidgetValues.defaultButtonWidth),
        margin: EdgeInsets.all(14),
        alignment: Alignment.center,
        child: CustomText(
          text: text,
          size: 22,
          weight: FontWeight.normal,
        ),
      ),
    );
  }
}
