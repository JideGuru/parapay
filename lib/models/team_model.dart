import 'dart:convert';

class Teams {
  Teams({
    this.id,
    this.area,
    this.name,
    this.shortName,
    this.crestUrl,
    this.address,
    this.phone,
    this.website,
    this.email,
    this.squad,
  });

  dynamic id;
  Area area;
  String name;
  String shortName;

  String crestUrl;
  String address;
  String phone;
  String website;
  String email;

  List<Squad> squad;

  factory Teams.fromJson(Map<dynamic, dynamic> json) => Teams(
        id: json["id"],
        area: Area.fromJson(json["area"]),
        name: json["name"],
        shortName: json["shortName"],
        crestUrl: json["crestUrl"],
        address: json["address"],
        phone: json["phone"],
        website: json["website"],
        email: json["email"],
        squad: List<Squad>.from(json["squad"].map((x) => Squad.fromJson(x))),
      );
}

class Area {
  Area({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        name: json["name"],
      );
}

class Squad {
  Squad({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Squad.fromJson(Map<String, dynamic> json) => Squad(
        id: json["id"],
        name: json["name"],
      );
}
