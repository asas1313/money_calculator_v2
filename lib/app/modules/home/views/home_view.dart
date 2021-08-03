import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator_v2/app/core/values/controllers.dart';
import 'package:money_calculator_v2/app/core/values/languages/message_keys.dart';
import 'package:spaces/spaces.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Spacing'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Main',
              ),
              Tab(
                text: 'Values',
              ),
              Tab(
                text: 'Space',
              ),
              Tab(
                text: 'SpacedFlex',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const MainTab(),
            const ValuesTab(),
            const SpaceTab(),
            const SpacedFlexTab(),
          ],
        ),
      ),
    );
  }
}

class ValuesTab extends StatelessWidget {
  const ValuesTab();

  Widget _box(BuildContext context, String title, double height) {
    final spacing = Spacing.of(context);
    return Padding(
      padding: spacing.insets.all.normal,
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
          ),
          Container(
            color: Colors.red,
            width: spacing.spaces.big,
            height: height,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final spacing = Spacing.of(context);
    return Container(
      color: Colors.red.withOpacity(0.2),
      margin: spacing.insets.all.big,
      padding: spacing.insets.all.normal,
      child: ListView(
        children: <Widget>[
          _box(context, 'extraSmall', spacing.spaces.extraSmall),
          _box(context, 'small', spacing.spaces.small),
          _box(context, 'semiSmall', spacing.spaces.semiSmall),
          _box(context, 'normal', spacing.spaces.normal),
          _box(context, 'semiBig', spacing.spaces.semiBig),
          _box(context, 'big', spacing.spaces.big),
          _box(context, 'extraBig', spacing.spaces.extraBig),
        ],
      ),
    );
  }
}

class SpaceTab extends StatelessWidget {
  const SpaceTab();

  Widget _box(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: 20.0,
      height: 20.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final spacing = Spacing.of(context);
    return Container(
      color: Colors.blue.withOpacity(0.2),
      margin: spacing.insets.all.big,
      padding: spacing.insets.all.normal,
      child: ListView(
        children: <Widget>[
          _box(context),
          Space.extraSmall(),
          _box(context),
          Space.small(),
          _box(context),
          Space.semiSmall(),
          _box(context),
          Space.normal(),
          _box(context),
          Space.semiBig(),
          _box(context),
          Space.big(),
          _box(context),
          Space.extraBig(),
          _box(context),
        ],
      ),
    );
  }
}

class SpacedFlexTab extends StatelessWidget {
  const SpacedFlexTab();

  Widget _box(BuildContext context) {
    return Container(
      color: Colors.green,
      width: 20.0,
      height: 20.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final spacing = Spacing.of(context);
    return Container(
      color: Colors.green.withOpacity(0.2),
      child: ListView(
        children: [
          SpacedColumn.normal(
            padding: spacing.insets.all.normal,
            children: <Widget>[
              _box(context),
              _box(context),
              _box(context),
              _box(context),
            ],
          ),
          Center(
            child: SpacedRow.normal(
              padding: spacing.insets.all.normal,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _box(context),
                _box(context),
                _box(context),
                _box(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MainTab extends StatelessWidget {
  const MainTab();

  @override
  Widget build(BuildContext context) {
    final spacing = Spacing.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.green.withOpacity(0.2),
        child: ListView(
          children: [
            SpacedColumn.normal(
              padding: spacing.insets.all.normal,
              children: <Widget>[
                Text(
                  MessageKeys.hello.tr,
                  style: TextStyle(fontSize: 20),
                ),
                ElevatedButton(
                  onPressed: () => appController.locale = 'lt_LT',
                  child: Text('Lietuviškai'),
                ),
                ElevatedButton(
                  onPressed: () => appController.locale = 'en_EN',
                  child: Text('English'),
                ),
                ElevatedButton(
                  onPressed: () => authController.signIn(),
                  child: Text('Sign In'),
                ),
                Obx(
                  () => Visibility(
                    visible: authController.isLoggedIn.value,
                    child: ElevatedButton(
                      onPressed: () => authController.signOut(),
                      child: Text('Sign Out'),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => appController.changeTheme(),
                  child: Text('Change Theme'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
