import 'package:flutter/material.dart';
import 'package:money_calculator_v2/app/core/values/controllers.dart';
import 'package:money_calculator_v2/app/core/values/languages/message_keys.dart';
import 'package:money_calculator_v2/app/global_widgets/custom_button.dart';
import 'package:money_calculator_v2/app/global_widgets/custom_field.dart';
import 'package:money_calculator_v2/app/global_widgets/custom_form.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomForm(
      child: Wrap(
        children: [
          CustomField(
            textEditingController: authController.email,
            icon: Icon(Icons.email_outlined),
            hintText: MessageKeys.auth_email,
          ),
          CustomField(
            textEditingController: authController.password,
            icon: Icon(Icons.lock),
            hintText: MessageKeys.auth_password,
            obscureText: true,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: CustomButton(
                  text: MessageKeys.auth_login,
                  onPressed: () {
                    authController.signIn();
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
