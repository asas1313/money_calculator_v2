import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator_v2/app/modules/app_controller.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;

  const CustomText({
    Key? key,
    required this.text,
    this.size,
    this.color,
    this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (controller) {
      return Text(
        text,
        style: TextStyle(
          fontSize: size ?? 16,
          color: color ??
              (controller.isDarkMode.value
                  ? ColorScheme.dark().onSurface
                  : ColorScheme.light().onSurface),
          fontWeight: weight ?? FontWeight.normal,
        ),
      );
    });
  }
}
