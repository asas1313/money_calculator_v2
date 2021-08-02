import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:money_calculator_v2/app/core/values/firebase.dart';
import 'package:money_calculator_v2/app/core/values/global_names.dart';
import 'package:money_calculator_v2/app/data/model/user_model.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class UserFbProvider {
  final userFbCollection =
      firebaseFirestore.collection(GlobalNames.USER_COLLECTION);

  Future<List<UserModel>?> getAll() async {
    var users = List<UserModel>.empty(growable: true);
    try {
      userFbCollection.get().then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((user) {
          users.add(UserModel.fromSnapshot(user));
        });
      });
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
    return users;
  }

  Future<UserModel?> getId(String id) async {
    UserModel? userModel = null;
    try {
      await userFbCollection.doc(id).get().then((user) {
        if (!user.exists) {
          print('User with id: $id does not exists.');
          return null;
        }
        userModel = UserModel.fromSnapshot(user);
      });
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
    return userModel;
  }

  Future save(UserModel user) async {
    try {
      await userFbCollection
          .doc(user.id)
          .set(user.toJson())
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
      ;
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
    return;
  }
}
