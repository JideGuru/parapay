// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:parapay/models/team_model.dart';
import 'package:parapay/models/competition_model.dart';
import 'package:parapay/util/getter.dart';
import 'dart:convert' as convert;

class HomeProvider with ChangeNotifier {
  HomeProvider() {
    getcompetition();
  }
  Football db = Football();
  static String api =
      "https://api.football-data.org/v2/competitions/CL/matches";

  static const response_headers = {
    'X-Auth-Token': "72b09e03051f4009a4f6080adfebdb14",
    // 'X-API-Version': "v2"
  };
  // List <Competitonmodel> competitons;
  // List matches;

  // http://api.football-data.org/v2/competitions/2003/matches?matchday=1

  Future<List<Match>> getcompetitions(int id) async {
    // var url = Uri.http('api.football-data.org', 'v2/competitions/CL/matches',
    //     {"matchday": "1"});

    var url = Uri.http(
      'api.football-data.org', 'v2/competitions/$id/matches',
      // {"matchday": "1"}
    );

    final response = await get(url, headers: response_headers);

    if (response.statusCode == 200) {
      var competitonss = jsonDecode(response.body);
      print(" Api Service 1 : $competitonss");

      List<dynamic> matchesList = competitonss['matches'];
      // print(" Api Service 1 : $matchesList");

      List<Match> competiton =
          matchesList.map((dynamic item) => Match.fromJson(item)).toList();

      return competiton;
    } else {
      print(" no data");
    }
  }

  Future<List<Competition>> getcompetition() async {
    // http://api.football-data.org/v2/competitions/
    var url = Uri.http(
      'api.football-data.org',
      'v2/competitions/',
    );

    final response = await get(url, headers: response_headers);

    if (response.statusCode == 200) {
      var competitonss = jsonDecode(response.body);

      List<dynamic> matchesList = competitonss['competitions'];
      // print(" Api Service 1 : $matchesList");

      List<Competition> competiton = matchesList
          .map((dynamic item) => Competition.fromJson(item))
          .toList();

      return competiton;
    } else {
      print(" no data");
    }
  }

  Future<Teams> getteam(int id) async {
    var url = Uri.http(
      'api.football-data.org',
      'v2/teams/$id',
    );

    final response = await get(url, headers: response_headers);

    // print(" Api Service 1 : $response");

    if (response.statusCode == 200) {
      List<dynamic> competitonss = new List<dynamic>();
      competitonss = json.decode(response.body)['activeCompetitions'];
      //  var   matchesList = competitonss['activeCompetitions'];
      // print(" Api Service 2 : $competitonss");
      if (competitonss.length > 0) {
        for (int i = 0; i < competitonss.length; i++) {
          if (competitonss[0] != null) {
            Teams map = Teams.fromJson(competitonss[0]['activeCompetitions']);
            return map;
            // print(" Api Service`100` : ${map["name"]}");
          }
        }
      }
      // List<dynamic> matchesList = competitonss['activeCompetitions'];
      // print(" Api Service 3 : $matchesList");
      // List<dynamic> matchesList = competitonss;
      // Teams team = Teams.fromJson(matchesList);
      // List<Teams> teams =
      //     matchesList.map((dynamic item) => Teams.fromJson(item)).toList();

      // final team = teams[0].name;

      // print(" Api Service 4 : $team");
      // Teams team = matchesList.map((dynamic item) => Teams.fromJson(item));
      // print(" Api Service 4 : $team");
      // return team;
    } else {
      print(" no data");
    }
  }
}
