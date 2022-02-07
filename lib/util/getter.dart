// ignore_for_file: non_constant_identifier_names

class Football {
  ///Main site url
  static String mainurl = "https://www.football-data.org";

  ///List all available competitions
  static String competition = "/v2/competitions/";
  static String api = "http://api.football-data.org";
  // 72b09e03051f4009a4f6080adfebdb14

   static const response_headers = {
   
    'X-Auth-Token': "72b09e03051f4009a4f6080adfebdb14",
    'X-API-Version': "v2"
  };

  ///Show one particular team.
  String getTeam({ String team_id}) {
    String team = "/v2/teams/$team_id";
    return team;
  }

  ///List one particular competition.
  String getCompetition({ String competition_id}) {
    String competitions = "/v2/competitions/$competition_id";
    return competitions;
  }

  ///List all teams for a particular competition.
  String getTeams({String teams_id}) {
    String teams = "/v2/competitions/$teams_id/teams";
    return teams;
  }

   ///List all teams for a particular competition.
  String getMatches({ String matches_id}) {
    String matches = "/v2/competitions/$matches_id/matches";
    return matches;
  }
}
