// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.src,
    required this.phone,
    required this.typeUser,
  });

  int id;
  String nom;
  String prenom;
  final String src;
  String email;
  String phone;
  TypeUser typeUser;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        nom: json["nom"],
        prenom: json["prenom"],
        email: json["email"],
        src: json["src"] == null ? null : json["src"],
        phone: json["phone"],
        typeUser: TypeUser.fromJson(json["typeUser"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "prenom": prenom,
        "src": src == null ? null : src,
        "email": email,
        "phone": phone,
        "typeUser": typeUser.toJson(),
      };
}

class TypeUser {
  TypeUser({
    required this.id,
    required this.libelle,
  });

  int id;
  String libelle;

  factory TypeUser.fromJson(Map<String, dynamic> json) => TypeUser(
        id: json["id"],
        libelle: json["libelle"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "libelle": libelle,
      };
}
