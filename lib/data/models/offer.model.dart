// To parse this JSON data, do
//
//     final offer = offerFromJson(jsonString);

import 'dart:convert';

import 'location.model.dart';

List<Offer> offerFromJson(String str) =>
    List<Offer>.from(json.decode(str).map((x) => Offer.fromJson(x)));

String offerToJson(List<Offer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Offer {
  Offer({
    this.id,
    this.uuid,
    this.trackNo,
    this.amount,
    this.read,
    this.rejected,
    this.accepted,
    this.destination,
    this.origin,
    this.created,
    this.updated,
  });

  int? id;
  String? uuid;
  String? trackNo;
  int? amount;
  bool? read;
  bool? rejected;
  bool? accepted;
  Location? destination;
  Location? origin;
  DateTime? created;
  DateTime? updated;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["id"],
        uuid: json["uuid"],
        trackNo: json["track_no"],
        amount: json["amount"],
        read: json["read"],
        rejected: json["rejected"],
        accepted: json["rejected"],
        destination: Location.fromJson(json["destination"]),
        origin: Location.fromJson(json["origin"]),
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "track_no": trackNo,
        "amount": amount,
        "read": read,
        "rejected": rejected,
        "created": created!.toIso8601String(),
        "updated": updated!.toIso8601String(),
      };
}
