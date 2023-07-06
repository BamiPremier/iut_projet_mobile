// To parse this JSON data, do
//
//     final InfoModel = InfoModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

InfoModel InfoModelFromJson(String str) => InfoModel.fromJson(json.decode(str));

String InfoModelToJson(InfoModel data) => json.encode(data.toJson());

class InfoModel {
  InfoModel({
    required this.nbre_batiments,
    required this.nbre_utilisateurs,
    required this.nbre_reservations,
    required this.nbre_salles,
  });

  String nbre_batiments;
  String nbre_utilisateurs;
  String nbre_salles;
  String nbre_reservations;

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
        nbre_batiments: json["nbre_batiments"].toString(),
        nbre_utilisateurs: json["nbre_utilisateurs"].toString(),
        nbre_reservations: json["nbre_reservations"].toString(),
        nbre_salles: json["nbre_salles"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "nbre_batiments": nbre_batiments,
        "nbre_utilisateurs": nbre_utilisateurs,
        "nbre_salles": nbre_salles == null ? null : nbre_salles,
        "nbre_reservations": nbre_reservations,
      };
}
