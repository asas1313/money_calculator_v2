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

/*  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();*/

// TODO: Remove credentials
  final name = TextEditingController(text: 'Asasas');
  final email = TextEditingController(text: 'as@as.as');
  final password = TextEditingController(text: 'asasas');

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _setScreen(null);
  }

  @override
  void onClose() {}

  _setScreen(User? user) {
    print('auth state changed');
    if (user == null) {
      isLoggedIn.value = false;
      Get.offAll(() => AuthView());
    } else {
      isLoggedIn.value = true;
      Get.offAll(() => HomeView());
    }
  }

  signIn() async {
    try {
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((userCredential) => _setScreen(userCredential.user))
          .onError((error, stackTrace) => print('Error: ${error.toString()}'));
      isLoggedIn.value = true;
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar(MessageKeys.sign_in_failed.tr, MessageKeys.try_again.tr,
          backgroundColor: Colors.red);
    }
  }

  signUp() async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((credential) {
        repository.save(UserModel(
          id: credential.user!.uid,
          name: credential.user!.displayName,
          email: credential.user!.email,
        ));
        isLoggedIn.value = true;
        _setScreen(credential.user);
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar(MessageKeys.sign_in_failed.tr, MessageKeys.try_again.tr);
    }
  }

  signOut() async {
    auth.signOut().then((value) => _setScreen(null));
    isLoggedIn.value = false;
  }
}
