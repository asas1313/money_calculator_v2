import 'package:flutter/material.dart';
import 'package:money_calculator_v2/app/core/values/controllers.dart';
import 'package:money_calculator_v2/app/global_widgets/custom_button.dart';
import 'package:money_calculator_v2/app/global_widgets/custom_field.dart';
import 'package:money_calculator_v2/app/global_widgets/custom_form.dart';

class RegistrationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomForm(
      child: Wrap(
        children: [
          CustomField(
            controller: authController.name,
            icon: Icon(Icons.person),
            hintText: "Name",
          ),
          CustomField(
            controller: authController.email,
            icon: Icon(Icons.email_outlined),
            hintText: "Email",
          ),
          CustomField(
            controller: authController.password,
            icon: Icon(Icons.lock),
            hintText: "Password",
            obscureText: true,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: CustomButton(
                  text: "Register",
                  onPressed: () {
                    authController.signUp();
                  }),
            ),
          )
        ],
      ),
    );
  }
}
