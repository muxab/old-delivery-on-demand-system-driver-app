// To parse this JSON data, do
//
//     final shipment = shipmentFromJson(jsonString);

import 'dart:convert';

import 'package:driver/data/models/v-type.model.dart';

import 'location.model.dart';

Shipment shipmentFromJson(String str) => Shipment.fromJson(json.decode(str));

String shipmentToJson(Shipment data) => json.encode(data.toJson());

class Shipment {
  int? id;
  String? uuid;
  dynamic weight;
  String? typeS;
  String? status;
  String? trackNo;
  String? payment;
  String? destAddress;
  String? originAddress;
  DateTime? created;
  DateTime? updated;
  Location? destination;
  Location? origin;
  Type? type;

  Shipment(
      {this.id,
      this.uuid,
      this.weight,
      this.typeS,
      this.status,
      this.trackNo,
      this.payment,
      this.destAddress,
      this.originAddress,
      this.created,
      this.updated,
      this.destination,
      this.origin,
      this.type});

  factory Shipment.fromJson(Map<String, dynamic> json) => Shipment(
        id: json["id"],
        uuid: json["uuid"],
        weight: json["weight"],
        typeS: json["type_s"],
        status: json["status"],
        trackNo: json["track_no"],
        payment: json["payment"],
        destAddress: json["dest_address"],
        originAddress: json["origin_address"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        destination: Location.fromJson(json["destination"]),
        origin: Location.fromJson(json["origin"]),
        type: Type.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "weight": weight,
        "type_s": typeS,
        "status": status,
        "track_no": trackNo,
        "payment": payment,
        "dest_address": destAddress,
        "origin_address": originAddress,
        "created": created!.toIso8601String(),
        "updated": updated!.toIso8601String(),
        "destination": destination!.toJson(),
        "origin": origin!.toJson(),
      };
}
