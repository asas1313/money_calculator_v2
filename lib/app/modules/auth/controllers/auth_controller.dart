import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_calculator_v2/app/core/values/firebase.dart';
import 'package:money_calculator_v2/app/core/values/languages/message_keys.dart';
import 'package:money_calculator_v2/app/data/model/user_model.dart';
import 'package:money_calculator_v2/app/data/provider/user_fb_provider.dart';
import 'package:money_calculator_v2/app/data/services/user_repository.dart';
import 'package:money_calculator_v2/app/modules/auth/views/auth_view.dart';
import 'package:money_calculator_v2/app/modules/home/views/home_view.dart';

class AuthController extends GetxController {
  static var instance = Get.find<AuthController>();
  var isLoggedIn = false.obs;

  final repository = UserRepository(provider: UserFbProvider());

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

/*// TODO: Remove credentials
  final name = TextEditingController(text: 'Asasas');
  final email = TextEditingController(text: 'as@as.as');
  final password = TextEditingController(text: 'asasas');*/

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    auth.authStateChanges().listen((User? user) => _setInitialScreen);
  }

  @override
  void onClose() {}

  _setInitialScreen(User? user) {
    if (user == null) {
      isLoggedIn.value = false;
      Get.offAll(() => AuthView());
    } else {
      isLoggedIn.value = true;
      Get.offAll(() => HomeView());
    }
  }

  SignIn() async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      isLoggedIn.value = true;
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar(MessageKeys.sign_in_failed.tr, MessageKeys.try_again.tr,
          backgroundColor: Colors.red);
    }
  }

  SignUp() async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((credential) => repository.save(UserModel(
                id: credential.user!.uid,
                name: credential.user!.displayName,
                email: credential.user!.email,
              )));
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar(MessageKeys.sign_in_failed.tr, MessageKeys.try_again.tr);
    }
  }

  SignOut() async {
    auth.signOut();
    isLoggedIn.value = false;
  }
}
