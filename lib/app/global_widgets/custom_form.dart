import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator_v2/app/core/values/controllers.dart';

class CustomForm extends StatelessWidget {
  final Widget child;

  const CustomForm({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: appController.backgroundColor.value,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(1),
                blurRadius: 10,
              )
            ],
            borderRadius: BorderRadius.circular(20)),
        child: child,
      );
    });
  }
}
