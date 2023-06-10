// To parse this JSON data, do
//
//     final ReservationModel = ReservationModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ReservationModel {
  ReservationModel({
    required this.nomSalle,
    required this.numeroSalle,
    required this.capaciteSalle,
    required this.src,
    required this.longitude,
    required this.latitude,
    required this.id,
  });

  String nomSalle;
  String numeroSalle;
  String capaciteSalle;
  String longitude;
  final String src;
  String latitude;
  final int id;

  factory ReservationModel.fromJson(Map<String, dynamic> json) =>
      ReservationModel(
        nomSalle: json["nomSalle"],
        numeroSalle: json["numeroSalle"],
        capaciteSalle: json["capaciteSalle"].toString(),
        longitude: json["longitude"].toString(),
        src: json["src"] == null ? null : json["src"],
        latitude: json["latitude"].toString(),
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "nomSalle": nomSalle,
        "numeroSalle": numeroSalle,
        "capaciteSalle": capaciteSalle,
        "src": src == null ? null : src,
        "longitude": longitude,
        "latitude": latitude,
        "id": id == null ? null : id,
      };
}
