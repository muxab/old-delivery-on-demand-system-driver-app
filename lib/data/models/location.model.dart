class Location {
  Location({
    this.id,
    this.city,
    this.cityEn,
  });

  int? id;
  String? city;
  String? cityEn;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        city: json["city"],
        cityEn: json["city_en"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city": city,
        "city_en": cityEn,
      };
}
