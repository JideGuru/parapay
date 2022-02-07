// To parse this JSON data, do
//
//     final competitonmodel = competitonmodelFromJson(jsonString);

import 'dart:convert';

class Matches {
  int count;
  Filters filters;
  Competition competition;
  List<Match> matches;

  Matches(
      {
      this.count,
      this.competition,
      this.filters,
      this.matches});

  factory Matches.fromJson(Map<String, dynamic> json) {
    return Matches(
      // Fixture.fromJson(json['fixture']),
      competition: Competition.fromJson(json['competition']),
      matches: List<Match>.from(json["matches"].map((x) => Match.fromJson(x))),
    );
  }
}

class Match {
  int id;
  Team homeTeam;
  Team awayTeam;

  Match({this.id, this.homeTeam, this.awayTeam});

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
        id: json["id"],
        homeTeam: Team.fromJson(json['homeTeam']),
        awayTeam: Team.fromJson(json['awayTeam']));
  }
}

class Team {
  int id;
  String name;

  Team({this.id, this.name});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json["id"],
      name: json["name"],
    );
  }
}

class Competition {
  Competition({
    this.id,
    // this.area,
    this.name,
    // this.code,
    // this.lastUpdated,
  });

  int id;
  // Area area;
  String name;
  // String code;

  // DateTime lastUpdated;

  factory Competition.fromJson(Map<String, dynamic> json) => Competition(
        id: json["id"],
        // area: Area.fromJson(json["area"]),
        name: json["name"],
        // code: json["code"] == null ? null : json["code"],
        // lastUpdated: DateTime.parse(json["lastUpdated"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "area": area.toJson(),
  //       "name": name,
  //       "code": code == null ? null : code,
  //       "lastUpdated": lastUpdated.toIso8601String(),
  //     };
}

class Area {
  Area({
    this.id,
    this.name,
    this.countryCode,
    this.ensignUrl,
  });

  int id;
  String name;
  String countryCode;
  String ensignUrl;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        name: json["name"],
        countryCode: json["countryCode"],
        ensignUrl: json["ensignUrl"] == null ? null : json["ensignUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "countryCode": countryCode,
        "ensignUrl": ensignUrl == null ? null : ensignUrl,
      };
}

class CurrentSeason {
  CurrentSeason({
    this.id,
    this.startDate,
    this.endDate,
    this.currentMatchday,
    this.winner,
  });

  int id;
  DateTime startDate;
  DateTime endDate;
  int currentMatchday;
  Winner winner;

  factory CurrentSeason.fromJson(Map<String, dynamic> json) => CurrentSeason(
        id: json["id"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        currentMatchday:
            json["currentMatchday"] == null ? null : json["currentMatchday"],
        winner: json["winner"] == null ? null : Winner.fromJson(json["winner"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "startDate":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "endDate":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "currentMatchday": currentMatchday == null ? null : currentMatchday,
        "winner": winner == null ? null : winner.toJson(),
      };
}

class Winner {
  Winner({
    this.id,
    this.name,
    this.shortName,
    this.tla,
    this.crestUrl,
  });

  int id;
  String name;
  String shortName;
  String tla;
  String crestUrl;

  factory Winner.fromJson(Map<String, dynamic> json) => Winner(
        id: json["id"],
        name: json["name"],
        shortName: json["shortName"] == null ? null : json["shortName"],
        tla: json["tla"] == null ? null : json["tla"],
        crestUrl: json["crestUrl"] == null ? null : json["crestUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "shortName": shortName == null ? null : shortName,
        "tla": tla == null ? null : tla,
        "crestUrl": crestUrl == null ? null : crestUrl,
      };
}

class Filters {
  Filters();

  factory Filters.fromJson(Map<String, dynamic> json) => Filters();

  Map<String, dynamic> toJson() => {};
}


// // To parse this JSON data, do
// //
// //     final competitonmodel = competitonmodelFromJson(jsonString);

// import 'dart:convert';

// Competitonmodel competitonmodelFromJson(String str) => Competitonmodel.fromJson(json.decode(str));

// String competitonmodelToJson(Competitonmodel data) => json.encode(data.toJson());

// class Competitonmodel {
//     Competitonmodel({
//         this.count,
//         this.filters,
//         this.competitions,
//     });

//     int count;
//     Filters filters;
//     List<Competition> competitions;

//     factory Competitonmodel.fromJson(Map<String, dynamic> json) => Competitonmodel(
//         count: json["count"],
//         filters: Filters.fromJson(json["filters"]),
//         competitions: List<Competition>.from(json["competitions"].map((x) => Competition.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "count": count,
//         "filters": filters.toJson(),
//         "competitions": List<dynamic>.from(competitions.map((x) => x.toJson())),
//     };
// }

// class Competition {
//     Competition({
//         this.id,
//         this.area,
//         this.name,
//         this.code,
//         this.emblemUrl,
//         this.plan,
//         this.currentSeason,
//         this.numberOfAvailableSeasons,
//         this.lastUpdated,
//     });

//     int id;
//     Area area;
//     String name;
//     String code;
//     String emblemUrl;
//     Plan plan;
//     CurrentSeason currentSeason;
//     int numberOfAvailableSeasons;
//     DateTime lastUpdated;

//     factory Competition.fromJson(Map<String, dynamic> json) => Competition(
//         id: json["id"],
//         area: Area.fromJson(json["area"]),
//         name: json["name"],
//         code: json["code"] == null ? null : json["code"],
//         emblemUrl: json["emblemUrl"] == null ? null : json["emblemUrl"],
//         plan: planValues.map[json["plan"]],
//         currentSeason: json["currentSeason"] == null ? null : CurrentSeason.fromJson(json["currentSeason"]),
//         numberOfAvailableSeasons: json["numberOfAvailableSeasons"],
//         lastUpdated: DateTime.parse(json["lastUpdated"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "area": area.toJson(),
//         "name": name,
//         "code": code == null ? null : code,
//         "emblemUrl": emblemUrl == null ? null : emblemUrl,
//         "plan": planValues.reverse[plan],
//         "currentSeason": currentSeason == null ? null : currentSeason.toJson(),
//         "numberOfAvailableSeasons": numberOfAvailableSeasons,
//         "lastUpdated": lastUpdated.toIso8601String(),
//     };
// }

// class Area {
//     Area({
//         this.id,
//         this.name,
//         this.countryCode,
//         this.ensignUrl,
//     });

//     int id;
//     String name;
//     String countryCode;
//     String ensignUrl;

//     factory Area.fromJson(Map<String, dynamic> json) => Area(
//         id: json["id"],
//         name: json["name"],
//         countryCode: json["countryCode"],
//         ensignUrl: json["ensignUrl"] == null ? null : json["ensignUrl"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "countryCode": countryCode,
//         "ensignUrl": ensignUrl == null ? null : ensignUrl,
//     };
// }

// class CurrentSeason {
//     CurrentSeason({
//         this.id,
//         this.startDate,
//         this.endDate,
//         this.currentMatchday,
//         this.winner,
//     });

//     int id;
//     DateTime startDate;
//     DateTime endDate;
//     int currentMatchday;
//     Winner winner;

//     factory CurrentSeason.fromJson(Map<String, dynamic> json) => CurrentSeason(
//         id: json["id"],
//         startDate: DateTime.parse(json["startDate"]),
//         endDate: DateTime.parse(json["endDate"]),
//         currentMatchday: json["currentMatchday"] == null ? null : json["currentMatchday"],
//         winner: json["winner"] == null ? null : Winner.fromJson(json["winner"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "startDate": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
//         "endDate": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
//         "currentMatchday": currentMatchday == null ? null : currentMatchday,
//         "winner": winner == null ? null : winner.toJson(),
//     };
// }

// class Winner {
//     Winner({
//         this.id,
//         this.name,
//         this.shortName,
//         this.tla,
//         this.crestUrl,
//     });

//     int id;
//     String name;
//     String shortName;
//     String tla;
//     String crestUrl;

//     factory Winner.fromJson(Map<String, dynamic> json) => Winner(
//         id: json["id"],
//         name: json["name"],
//         shortName: json["shortName"] == null ? null : json["shortName"],
//         tla: json["tla"] == null ? null : json["tla"],
//         crestUrl: json["crestUrl"] == null ? null : json["crestUrl"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "shortName": shortName == null ? null : shortName,
//         "tla": tla == null ? null : tla,
//         "crestUrl": crestUrl == null ? null : crestUrl,
//     };
// }

// enum Plan { TIER_FOUR, TIER_TWO, TIER_THREE, TIER_ONE }

// final planValues = EnumValues({
//     "TIER_FOUR": Plan.TIER_FOUR,
//     "TIER_ONE": Plan.TIER_ONE,
//     "TIER_THREE": Plan.TIER_THREE,
//     "TIER_TWO": Plan.TIER_TWO
// });

// class Filters {
//     Filters();

//     factory Filters.fromJson(Map<String, dynamic> json) => Filters(
//     );

//     Map<String, dynamic> toJson() => {
//     };
// }

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
