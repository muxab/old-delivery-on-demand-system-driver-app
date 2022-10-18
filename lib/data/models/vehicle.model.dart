import 'package:driver/data/models/v-type.model.dart';

class Vehicle {
  int? id;
  String? uuid;
  String? liceinseNo;
  String? plateNo;
  String? typeTxt;
  String? status;
  int? typeId;
  int? companyId;
  int? cuurentId;
  String? created;
  String? updated;
  Type? type;

  Vehicle({
    this.id,
    this.uuid,
    this.liceinseNo,
    this.plateNo,
    this.typeTxt,
    this.status,
    this.typeId,
    this.companyId,
    this.cuurentId,
    this.created,
    this.updated,
    this.type,
  });

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    liceinseNo = json['liceinse_no'];
    plateNo = json['plate_no'];
    typeTxt = json['type_txt'];
    status = json['status'];
    created = json['created'];
    updated = json['updated'];
    type = Type.fromJson(json["type"]);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['liceinse_no'] = liceinseNo;
    data['plate_no'] = plateNo;
    data['type_txt'] = typeTxt;
    data['status'] = status;
    data['created'] = created;
    data['updated'] = updated;
    data['type'] = type!.toJson();
    return data;
  }
}
