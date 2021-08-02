import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = 'id';
  static const NAME = 'name';
  static const EMAIL = 'email';

  String? id;
  String? name;
  String? email;

  UserModel({this.id, this.name, this.email});

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    this.id = data[ID];
    this.name = data[NAME];
    this.email = data[EMAIL];
  }

  Map<String, dynamic> toJson() => {ID: id, NAME: name, EMAIL: email};
}
