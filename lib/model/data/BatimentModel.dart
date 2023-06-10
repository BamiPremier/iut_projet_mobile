// To parse this JSON data, do
//
//     final BatimentModel = BatimentModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class BatimentModel {
  BatimentModel({
    required this.id,
    required this.nombreSalle,
    required this.nomBatiment,
    required this.descripitionBatiment,
    required this.src,
  });

  final int id;
  final int nombreSalle;
  final String nomBatiment;
  final String descripitionBatiment;
  final String src;

  factory BatimentModel.fromJson(Map<String, dynamic> json) => BatimentModel(
        nombreSalle: json["nombreSalle"] == null ? null : json["nombreSalle"],
        id: json["id"] == null ? null : json["id"],
        nomBatiment: json["nomBatiment"] == null ? null : json["nomBatiment"],
        descripitionBatiment: json["descripitionBatiment"] == null
            ? null
            : json["descripitionBatiment"],
        src: json["src"] == null ? null : json["src"],
      );

  Map<String, dynamic> toJson() => {
        "nombreSalle": nombreSalle == null ? null : nombreSalle,
        "id": id == null ? null : id,
        "descripitionBatiment":
            descripitionBatiment == null ? null : descripitionBatiment,
        "nomBatiment": nomBatiment == null ? null : nomBatiment,
        "src": src == null ? null : src,
      };
}
