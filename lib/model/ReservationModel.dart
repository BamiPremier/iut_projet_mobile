// To parse this JSON data, do
//
//     final ReservationModel = ReservationModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ReservationModel {
  ReservationModel({
    required this.nomSalle,
    required this.fin,
    required this.debut,
    required this.motif,
    required this.numeroSalle,
    required this.capaciteSalle,
    required this.niveauSalle,
    required this.batiment,
    required this.src,
    required this.longitude,
    required this.latitude,
    required this.id,
  });

  String motif;
  String debut;
  String fin;
  String nomSalle;
  String numeroSalle;
  String batiment;
  String niveauSalle;
  String capaciteSalle;
  String longitude;
  final String src;
  String latitude;
  final int id;

  factory ReservationModel.fromJson(Map<String, dynamic> json) =>
      ReservationModel(
        motif: json["motif"] ?? "Inconnu",
        nomSalle: json["nomSalle"],
        debut: json["debut"] ?? "Aucune",
        fin: json["fin"] ?? "Aucune",
        numeroSalle: json["numeroSalle"],
        niveauSalle: json["niveauSalle"].toString() ?? "Inconnu",
        batiment: json["batiment"] ?? "Inconnu",
        capaciteSalle: json["capaciteSalle"].toString(),
        longitude: json["longitude"].toString(),
        src: json["src"] == null ? null : json["src"],
        latitude: json["latitude"].toString(),
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "nomSalle": nomSalle,
        "numeroSalle": numeroSalle,
        "debut": debut,
        "motif": motif,
        "fin": fin,
        "batiment": batiment,
        "niveauSalle": niveauSalle,
        "capaciteSalle": capaciteSalle,
        "src": src == null ? null : src,
        "longitude": longitude,
        "latitude": latitude,
        "id": id == null ? null : id,
      };
}
