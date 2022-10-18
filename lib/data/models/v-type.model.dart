class Type {
  Type({
    this.id,
    this.type,
    this.typeAr,
  });

  int? id;
  String? type;
  String? typeAr;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        type: json["type"],
        typeAr: json["type_ar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "type_ar": typeAr,
      };
}
