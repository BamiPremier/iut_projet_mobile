// To parse this JSON data, do
//
//     final SalleDefaultModel = SalleDefaultModelFromJson(jsonString);

import 'dart:convert';

SalleDefaultModel SalleDefaultModelFromJson(String str) =>
    SalleDefaultModel.fromJson(json.decode(str));

String SalleDefaultModelToJson(SalleDefaultModel data) => json.encode(data.toJson());

class SalleDefaultModel {
  SalleDefaultModel({
    required this.nomSalle,
    required this.numeroSalle,
    required this.capaciteSalle,
    required this.src,
    required this.longitude,
    required this.latitude,
    required this.id,
    required this.etat,
  });

  String nomSalle;
  String numeroSalle;
  String capaciteSalle;
  final String src;
  String longitude;
  String latitude;
  final int id;
  final bool etat; 

  factory SalleDefaultModel.fromJson(Map<String, dynamic> json) => SalleDefaultModel(
        nomSalle: json["nomSalle"],
        numeroSalle: json["numeroSalle"],
        capaciteSalle: json["capaciteSalle"].toString(),
        src: json["src"] == null ? null : json["src"],
        etat: json["etat"] == null ? null : json["etat"],
        longitude: json["longitude"].toString(),
        latitude: json["latitude"].toString(),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "nomSalle": nomSalle,
        "numeroSalle": numeroSalle,
        "capaciteSalle": capaciteSalle,
        "longitude": longitude,
        "src": src == null ? null : src,
        "etat": etat == null ? null : etat,
        "latitude": latitude,
        "id": id,
      };
}
