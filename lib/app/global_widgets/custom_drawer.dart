import 'package:flutter/material.dart';
import 'package:money_calculator_v2/app/global_widgets/custom_menu.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: CustomMenu(),
      ),
    );
  }
}
