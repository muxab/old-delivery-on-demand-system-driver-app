// To parse this JSON data, do
//
//     final journey = journeyFromJson(jsonString);

import 'dart:convert';

import 'package:driver/data/models/location.model.dart';

Journey journeyFromJson(String str) => Journey.fromJson(json.decode(str));

String journeyToJson(Journey data) => json.encode(data.toJson());

class Journey {
  Journey({
    this.id,
    this.uuid,
    this.trackNo,
    // this.changeReason,
    this.changedVehicle,
    this.status,
    this.destAddress,
    this.originAddress,
    this.vehicleId,
    this.created,
    this.updated,
    this.destination,
    this.origin,
  });

  int? id;
  String? uuid;
  dynamic trackNo;
  // dynamic changeReason;
  bool? changedVehicle;
  String? status;
  String? destAddress;
  String? originAddress;
  int? vehicleId;
  DateTime? created;
  DateTime? updated;
  Location? destination;
  Location? origin;

  factory Journey.fromJson(Map<String, dynamic> json) => Journey(
        id: json["id"],
        uuid: json["uuid"],
        trackNo: json["track_no"],
        // changeReason: json["changeReason"],
        changedVehicle: json["changedVehicle"],
        status: json["status"],
        destAddress: json["dest_address"],
        originAddress: json["origin_address"],
        vehicleId: json["vehicleId"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        destination: Location.fromJson(json["destination"]),
        origin: Location.fromJson(json["origin"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "track_no": trackNo,
        // "changeReason": changeReason,
        "changedVehicle": changedVehicle,
        "status": status,
        "dest_address": destAddress,
        "origin_address": originAddress,
        "vehicleId": vehicleId,
        "created": created!.toIso8601String(),
        "updated": updated!.toIso8601String(),
        "destination": destination!.toJson(),
        "origin": origin!.toJson(),
      };
}
