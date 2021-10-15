import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator_v2/app/core/values/global_widget_values.dart';

import 'custom_text.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final double? width;
  final double textSize;
  final double margins;

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width,
    this.textSize = 22.0,
    this.margins = 14.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width != null
            ? min(Get.width / 1.2, width!)
            : min(Get.width / 1.2, GlobalWidgetValues.defaultButtonWidth),
        margin: EdgeInsets.all(margins),
        alignment: Alignment.center,
        child: CustomText(
          text: text,
          size: textSize,
          weight: FontWeight.normal,
        ),
      ),
    );
  }
}
