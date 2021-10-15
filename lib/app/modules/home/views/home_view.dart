import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:spaces/spaces.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final spacing = Spacing.of(context);
    return SingleChildScrollView(
      child: ResponsiveBuilder(builder: (context, sizingInformation) {
        return SpacedColumn.normal(
          padding: spacing.insets.all.normal,
          children: <Widget>[
            Text(
                'Screen width is: ${sizingInformation.screenSize.width.toString()}\n' +
                    'Screen type is Desktop: ${sizingInformation.isDesktop}'),
          ],
        );
      }),
    );
  }
}
