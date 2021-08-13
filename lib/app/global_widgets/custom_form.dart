import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomForm extends StatelessWidget {
  final Widget child;

  const CustomForm({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Get.theme.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              blurRadius: 10,
            )
          ],
          borderRadius: BorderRadius.circular(20)),
      child: child,
    );
  }
}
