// To parse this JSON data, do
//
//     final SalleModel = SalleModelFromJson(jsonString);

import 'dart:convert';

SalleModel SalleModelFromJson(String str) =>
    SalleModel.fromJson(json.decode(str));

String SalleModelToJson(SalleModel data) => json.encode(data.toJson());

class SalleModel {
  SalleModel({
    required this.nomSalle,
    required this.numeroSalle,
    required this.batiment,
    required this.niveauSalle,
    required this.capaciteSalle,
    required this.src,
    required this.longitude,
    required this.latitude,
    required this.id,
  });

  String nomSalle;
  String niveauSalle;
  String numeroSalle;
  String batiment;
  String capaciteSalle;
  final String src;
  String longitude;
  String latitude;
  final int id;

  factory SalleModel.fromJson(Map<String, dynamic> json) => SalleModel(
        nomSalle: json["nomSalle"],
        numeroSalle: json["numeroSalle"],
        batiment: json["batiment"] ?? "Inconnu",
        niveauSalle: json["niveauSalle"].toString() ?? '0',
        capaciteSalle: json["capaciteSalle"].toString(),
        src: json["src"] == null ? null : json["src"],
        longitude: json["longitude"].toString(),
        latitude: json["latitude"].toString(),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "nomSalle": nomSalle,
        "niveauSalle": niveauSalle,
        "numeroSalle": numeroSalle,
        "batiment": batiment,
        "capaciteSalle": capaciteSalle,
        "longitude": longitude,
        "src": src == null ? null : src,
        "latitude": latitude,
        "id": id,
      };
}
